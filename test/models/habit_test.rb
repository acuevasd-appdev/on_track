# == Schema Information
#
# Table name: habits
#
#  id               :bigint           not null, primary key
#  current_progress :float            default(0.0)
#  description      :text
#  frequency        :string           not null
#  goal_frequenc    :integer          not null
#  habit_type       :string           not null
#  private          :boolean          default(FALSE)
#  steps_count      :integer          default(0)
#  title            :string           not null
#  top_streak       :float            default(0.0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  owner_id         :bigint           not null
#
# Indexes
#
#  index_habits_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
require "test_helper"

class HabitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
