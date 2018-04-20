class ApplicationController < ActionController::Base
  # This makes user go to root if he has no permission
  rescue_from CanCan::AccessDenied do
    redirect_to root_path
  end
end
