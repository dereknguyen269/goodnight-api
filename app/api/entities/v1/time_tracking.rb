class Entities::V1::TimeTracking < Grape::Entity
  root "data", "object"

  expose :id, documentation: { type: "Integer", desc: "Id" }
  expose :start_at, documentation: { type: "Datetime", desc: "Start sleep at" }
  expose :end_at, documentation: { type: "Datetime", desc: "End sleep at" }
end
