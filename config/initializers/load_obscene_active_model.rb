require 'obscenity/active_model'

Obscenity.configure do |config|
  config.whitelist   = ['cum'] # Conflict with Lorem Ipsum
end
