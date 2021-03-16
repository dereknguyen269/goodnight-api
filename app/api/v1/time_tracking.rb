class V1::TimeTracking < Grape::API
  helpers V1::Helpers

  resource :time_trackings do
    desc 'Record for sleep (Start/End)',
      entity: Entities::V1::TimeTracking,
      headers: {
        Authorization: {
          description: 'Authorization access token',
          required: true
        }
      }
    post do
      user_authenticate!
      time_tracking = current_user.time_trackings.sleeping.first
      record_at = Time.zone.now
      if time_tracking
        time_tracking.update end_at: record_at
      else
        time_tracking = current_user.time_trackings.create!(start_at: record_at)
      end
      if time_tracking
        status 200
        present time_tracking, with: Entities::V1::TimeTracking
      end
    end

    resource :me do
      desc 'My Time Tracking', entity: Entities::V1::TimeTracking
      get :my_records do
        user_authenticate!
        present current_user.time_trackings, with: Entities::V1::TimeTracking
      end
    end
  end
end
