require "etda_utilities/version"

module EtdaUtilities
  class Partner
    VALID_IDS = %w( graduate honors milsch )

    def self.current
      new(ENV.fetch('PARTNER', 'graduate'))
    end

    def initialize(id)
      unless VALID_IDS.include?(id)
        raise ArgumentError, "Unknown partner id #{id.inspect}"
      end
      @id = id
    end

    attr_reader :id

    def graduate?
      id == 'graduate'
    end

    def honors?
      id == 'honors'
    end

    def milsch?
      id == 'milsch'
    end
  end
end
