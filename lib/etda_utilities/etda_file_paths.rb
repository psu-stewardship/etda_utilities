# frozen_string_literal: true

module EtdaUtilities
  class EtdaFilePaths
    RESTRICTED_DIR = 'restricted'
    RESTRICTED_INSTITUTION_DIR = 'restricted_institution'
    OPEN_DIR = 'open'

    def workflow_base_path
      path = (defined? EXPLORE_BASE_PATH) ? EXPLORE_BASE_PATH : 'tmp'
      path + '/'
    end

    def explore_base_path
      path = (defined? EXPLORE_BASE_PATH) ? EXPLORE_BASE_PATH : 'tmp'
      path + '/'
    end

    def workflow_upload_final_files_path
      workflow_base_path + 'final-submission-files'
    end

    def workflow_upload_format_review_path
      workflow_base_path + 'format-review-files'
    end

    def workflow_restricted
      workflow_base_path + RESTRICTED_DIR
    end

    def explore_open
      explore_base_path + OPEN_DIR
    end

    def explore_psu_only
      explore_base_path + RESTRICTED_INSTITUTION_DIR
    end
  end
end
