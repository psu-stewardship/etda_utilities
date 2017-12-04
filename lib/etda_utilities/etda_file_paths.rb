module EtdaUtilities
  class EtdaFilePaths
    RESTRICTED_DIR = 'restricted'
    RESTRICTED_INSTITUTION_DIR = 'restricted_institution'
    OPEN_DIR = 'open'

    def workflow_base_path
      'tmp/'
      # override method in application adding following line (do not include 'tmp/')
      # WORKFLOW_BASE_PATH
    end

    def explore_base_path
      'tmp/'
      # override method in application by adding the following line (do not include 'tmp/')
      # EXPLORE_BASE_PATH
    end

    def this_host
      'localhost/'

      # override method in application with following line (do not include 'localhost/'):
      # Rails.application.secrets.webaccess[:path] + '/'
    end

    def workflow_upload_final_files_path
      "#{workflow_base_path}" + "#{this_host}" + 'final-submission-files'
    end

    def workflow_upload_format_review_path
      "#{workflow_base_path}" + "#{this_host}" + 'format-review-files'
    end

    def workflow_restricted_institution
      "#{workflow_base_path}" + "#{this_host}" + RESTRICTED_INSTITUTION_DIR
    end

    def workflow_restricted
      "#{workflow_base_path}" + "#{this_host}" + RESTRICTED_DIR
    end

    def explore_open
      "#{explore_base_path}" + "#{this_host}" + OPEN_DIR
    end

    def explore_psu_only
      "#{explore_base_path}" + "#{this_host}" + RESTRICTED_INSTITUTION_DIR
    end
  end
end
