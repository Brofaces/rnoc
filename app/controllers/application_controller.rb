class ApplicationController < ActionController::Base
  include RNOC
  protect_from_forgery
end
