# frozen_string_literal: true

module EtdaUtilities
  class EtdaFilePaths
    RESTRICTED_DIR = 'restricted'
    RESTRICTED_INSTITUTION_DIR = 'restricted_institution'
    OPEN_DIR = 'open_access'

    def workflow_base_path
      path = (defined? EXPLORE_BASE_PATH) ? EXPLORE_BASE_PATH : 'tmp'
      path + '/'
    end

    def explore_base_path
      path = (defined? EXPLORE_BASE_PATH) ? EXPLORE_BASE_PATH : 'tmp'
      path + '/'
    end

    def workflow_upload_final_files_path
      workflow_base_path + 'final_submission_files/'
    end

    def workflow_upload_format_review_path
      workflow_base_path + 'format_review_files/'
    end

    def workflow_restricted
      workflow_base_path + RESTRICTED_DIR + '/'
    end

    def explore_open
      explore_base_path + OPEN_DIR + '/'
    end

    def explore_psu_only
      explore_base_path + RESTRICTED_INSTITUTION_DIR + '/'
    end

    def detailed_file_path(file_id)
      str1 = format("%02d", ((file_id || 0) % 100))
      str2 = file_id.to_s
      str1 + '/' + str2 + '/'
    end

    def explore_download_file_path(file_id, access_level, filename)
      return nil if file_id.nil? || access_level.empty?
      return nil if access_level == 'restricted'
      return explore_open + detailed_file_path(file_id) + filename if access_level == 'open_access'
      return explore_psu_only + detailed_file_path(file_id) + filename if access_level == 'restricted_to_institution'
      nil
    end
  end
end
