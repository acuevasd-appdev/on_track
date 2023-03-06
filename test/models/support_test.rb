# == Schema Information
#
# Table name: supports
#
#  id           :bigint           not null, primary key
#  support_type :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  fan_id       :bigint           not null
#  step_id      :bigint           not null
#
# Indexes
#
#  index_supports_on_fan_id   (fan_id)
#  index_supports_on_step_id  (step_id)
#
# Foreign Keys
#
#  fk_rails_...  (fan_id => users.id)
#  fk_rails_...  (step_id => steps.id)
#
require "test_helper"

class SupportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
