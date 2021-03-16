module Authentication
  extend ActiveSupport::Concern

  module ClassMethods
    def authorize(params)
      return find_by authentication_token: params[:access_token] if params[:access_token]
    end
  end
end
