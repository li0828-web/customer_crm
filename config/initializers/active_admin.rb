ActiveAdmin.setup do |config|
  # == Site Title
  config.site_title = "Customer CRM"

  # == Authentication
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user

  # == User Authorization
  # config.authorization_adapter = ActiveAdmin::CanCanAdapter

  # == Comments
  config.comments = true

  # == Batch Actions
  config.batch_actions = true

  # == Localize Date/Time Format
  config.localize_format = :long
end

