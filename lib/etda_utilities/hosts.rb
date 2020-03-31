# frozen_string_literal: true

module EtdaUtilities
  class Hosts
    def workflow_submit_host(partner, environment = 'prod')
      host_builder(partner, environment, true)
    end

    def explore_host(partner, environment = 'prod')
      host_builder(partner, environment, false)
    end

    private

      def host_builder(partner, environment, is_workflow)
        return nil if partner.nil?

        return 'localhost' if environment == 'development'

        location_environment = "#{host_application(is_workflow)}-#{environment}" if environment != 'prod'
        "#{host_prefix(is_workflow)}#{partner_host(partner)}#{location_environment}.libraries.psu.edu"
      end

      def host_prefix(is_workflow = false)
        return '' unless is_workflow

        'submit-'
      end

      def host_application(is_workflow = false)
        return '' if is_workflow

        '-explore'
      end

      def partner_host(partner)
        case partner
        when 'graduate'
          "etda"
        when 'honors'
          "honors"
        when 'milsch'
          "millennium-scholars"
        when 'sset'
          "sset"
        end
      end
  end
end
