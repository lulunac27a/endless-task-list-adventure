require_dependency "user"
require_relative "application_record"

Rails.application.config.after_initialize do
  User.find_or_create_by(name: "Default User") do |user|
    user.level = 1
    user.xp = 0
    user.xp_required = 1
    user.total_xp = 0
  end
end
