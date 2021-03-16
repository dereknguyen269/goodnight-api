class V1::Users < Grape::API
  resource :users do
    desc 'List Users', entity: Entities::V1::User
    get do
      present User.all, with: Entities::V1::User
    end
  end
end
