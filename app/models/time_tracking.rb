# == Schema Information
#
# Table name: time_trackings
#
#  id              :integer          not null, primary key
#  end_at          :datetime
#  length_of_sleep :integer
#  start_at        :datetime         not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer          not null
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

  default_scope { order(created_at: :asc) }
  scope :sleeping, -> { where(end_at: nil).where.not(start_at: nil) }
  scope :completed, -> { where.not(length_of_sleep: nil) }
  scope :order_by_length_of_sleep, -> { order(length_of_sleep: :asc) }
  scope :pastweek, -> {
    begin_of_week = Time.zone.now.beginning_of_week
    where('created_at < ?', begin_of_week)
  }
end
