# frozen_string_literal: true

module EtdaUtilities
  file_path = File.join(File.dirname(__FILE__), 'access_levels_for_partners.yml')
  CURRENT_PARTNER_ACCESS_LEVELS = YAML.load_file(file_path.to_s)[EtdaUtilities::Partner.current.id]

  class AccessLevel
    attr_accessor :attributes
    # attr_accessor :current_access_level
    # *** IMPORTANT NOTE ***
    # The order of the keys in this array matter and they should go from least restrictive to most restrictive
    # This is used in the comparison operation (<=>) below
    ACCESS_LEVEL_KEYS = ['open_access', 'restricted_to_institution', 'restricted', ''].freeze

    # create instances of each type that can be used
    # OPEN_ACCESS, RESTRICTED, and RESTRICTED_TO_INSTITUTION (graduate only)
    class << self
      ACCESS_LEVEL_KEYS.each do |level|
        level = 'NO_ACCESS' if level == '' || level.nil?
        define_method(level.upcase) do
          new(level)
        end
      end
    end

    def self.partner_access_levels
      CURRENT_PARTNER_ACCESS_LEVELS
    end

    def self.paper_access_level_keys
      ACCESS_LEVEL_KEYS
    end

    def self.valid_levels
      paper_access_level_keys #  + ['']
    end

    def self.paper_access_levels
      paper_access_level_keys.map do |key|
        level = EtdaUtilities::AccessLevel.new(key)
        { type: key, label: level.label, description: level.description }
      end
    end

    def initialize(level)
      # super(submission_attributes, level)
      @attributes = self.class.partner_access_levels['access_level'][level.to_s] # || 'NO_ACCESS'
      @current_access_level = verify_access_level(level)
    end

    attr_reader :current_access_level

    def <=>(other)
      alevel = other
      alevel = self.class.new(alevel) unless alevel.instance_of? self.class
      to_i <=> alevel.to_i
    end

    def scope
      self.class.partner_access_levels['access_level']["#{current_access_level}_attr"]['scope'] || 'released_for_publication'
    end

    def label
      self.class.partner_access_levels['access_level'][current_access_level] || ''
    end

    def description
      return '' if current_access_level == ''

      self.class.partner_access_levels['access_level']["#{current_access_level}_attr"]['description_html']
    end

    # define the integer value of the item as the index in the access other keys array
    def to_i
      self.class.valid_levels.find_index current_access_level
    end

    private

      def i18n_attr_handle
        "#{i18n_handle}_attr"
      end

      def i18n_handle
        self.class.partner_access_levels['access_level']
      end

      def verify_access_level(level)
        EtdaUtilities::AccessLevel::ACCESS_LEVEL_KEYS.include?(level) ? level : ''
      end

      def method_missing(sym, *args, &block)
        super
      rescue NoMethodError
        name = sym.to_s.sub('?', '')
        return false if ACCESS_LEVEL_KEYS.include?(name)

        raise
      end
  end
end
