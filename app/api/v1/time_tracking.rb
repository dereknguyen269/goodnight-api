class V1::TimeTracking < Grape::API
  helpers V1::Helpers

  resource :time_trackings do
    desc 'Clock-in / Clock-out sleep record',
      entity: Entities::V1::TimeTracking,
      headers: {
        Authorization: {
          description: 'Authorization access token',
          required: true
        }
      }
    params do
      optional :id, type: Integer, desc: 'Time Tracking Id'
    end
    post do
      user_authenticate!
      # Find clocked-in record of user when have id
      time_tracking = current_user.time_trackings.sleeping.find_by(id: params[:id]) if params[:id]
      # Or get first clocked-in record of user
      time_tracking ||= current_user.time_trackings.sleeping.first
      record_at = Time.zone.now
      if time_tracking
        # Clocked-out
        length_of_sleep = record_at - time_tracking.start_at
        time_tracking.update end_at: record_at, length_of_sleep: length_of_sleep
      else
        # Clocked-in
        time_tracking = current_user.time_trackings.create!(start_at: record_at)
      end
      if time_tracking
        status 200
        present time_tracking, with: Entities::V1::TimeTracking
      end
    end

    resource :me do
      desc 'My Sleep Records', entity: Entities::V1::TimeTracking
      get :my_records do
        user_authenticate!
        present current_user.time_trackings, with: Entities::V1::TimeTracking
      end

      desc 'My Clocked-in Sleep Records', entity: Entities::V1::TimeTracking
      get :my_clocked_in_records do
        user_authenticate!
        present current_user.time_trackings.sleeping, with: Entities::V1::TimeTracking
      end

      desc 'Friends\'s Sleep Records', entity: Entities::V1::TimeTracking
      get :friend_records do
        user_authenticate!
        present current_user.friend_records
      end
    end
  end
end
