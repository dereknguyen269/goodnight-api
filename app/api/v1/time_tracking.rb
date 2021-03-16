class V1::TimeTracking < Grape::API
  resource :time_trackings do
    desc 'List Time Tracking', entity: Entities::V1::TimeTracking
    get do
      present TimeTracking.all, with: Entities::V1::TimeTracking
    end
  end
end
