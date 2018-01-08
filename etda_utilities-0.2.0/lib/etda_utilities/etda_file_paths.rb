class EtdaFilePaths
  RESTRICTED_DIR = 'restricted'
  RESTRICTED_INSTITUTION_DIR = 'restricted_institution'
  OPEN_DIR = 'open'

  def workflow_base_path
    return WORKFLOW_BASE_PATH if self.running_application?
    '/utility_path'
  end

  def explore_base_path
    return EXPLORE_BASE_PATH if self.running_application?
    '/utility_path'
  end

  def this_host
    service = Rails.application.secrets.webaccess[:vservice]
    return 'qa/' if service.contains('qa')
    return 'staging/' if service.contains('stage')
    return 'prod/' if service.contains('prod')
  end

  def workflow_upload_final_path
    "#{workflow_base_path}" + "#{this_host}" + 'final-submission-files'
  end

  def workflow_upload_format_path
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

  # private

  def running_application?
    return true if Rails.application.class.parent == 'EtdaWorkflow' || Rails.application.class.parent == 'EtdaExplore'
    false
  end
end
