class Entities::V1::TimeTracking < Grape::Entity
  root "data", "object"

  expose :id, documentation: { type: "Integer", desc: "Id" }
  expose :user_id, documentation: { type: "Integer", desc: "User id" }
  expose :start_at, documentation: { type: "Datetime", desc: "Start sleep at" }
  expose :end_at, documentation: { type: "Datetime", desc: "End sleep at" }
  expose :length_of_sleep, documentation: { type: "Integer", desc: "Lenght of sleep" }
  expose :created_at, documentation: { type: "Datetime", desc: "Created at" }
end
