# == Schema Information
#
# Table name: steps
#
#  id              :bigint           not null, primary key
#  caption         :text
#  comments_count  :integer          default(0)
#  date_completion :datetime         not null
#  image           :string
#  supports_count  :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  habit_id        :bigint           not null
#
# Indexes
#
#  index_steps_on_habit_id  (habit_id)
#
# Foreign Keys
#
#  fk_rails_...  (habit_id => habits.id)
#
require "test_helper"

class StepTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
