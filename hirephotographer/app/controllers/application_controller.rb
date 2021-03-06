class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper
  include ProfilesHelper
  include PersonalinformationsHelper
  included MessagesHelper
  included ConversationsHelper
end
