class V1::Base < Grape::API
  include V1::ExceptionsHandler

  prefix 'api'
  format :json
  version 'v1'

  mount V1::TimeTracking
  mount V1::Users
  add_swagger_documentation(api_version: self.version, hide_format: true, hide_documentation_path: true)
end
