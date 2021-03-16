class Entities::V1::User < Grape::Entity
  root "data", "object"

  expose :id, documentation: { type: "Integer", desc: "Id of user." }
  expose :name, documentation: { type: "String", desc: "Name of user." }
  expose :email, documentation: { type: "String", desc: "Email of user." }
end
