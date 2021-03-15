# == Schema Information
#
# Table name: time_trackings
#
#  id         :integer          not null, primary key
#  end_at     :datetime
#  start_at   :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_time_trackings_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class TimeTracking < ApplicationRecord
  belongs_to :user
end
