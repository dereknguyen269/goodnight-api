module V1
  module Helpers
    extend Grape::API::Helpers

    def logger
      Base.logger
    end

    def declared_params
      @declared_params ||= ActionController::Parameters.new(declared(params, include_missing: false)).permit!
    end

    def user_authenticate!
      error!("401 Unauthorized", 401) unless current_user
    end

    def current_user
      @current_user ||= User.authorize access_token_param
    end

    def access_token_param
      @access_token ||= headers["Authorization"]
      { access_token: @access_token }
    end
  end
end
