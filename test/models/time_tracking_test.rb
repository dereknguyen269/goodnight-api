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
require "test_helper"

class TimeTrackingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
