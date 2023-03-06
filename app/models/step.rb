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
class Step < ApplicationRecord
  belongs_to :habit, counter_cache: true, dependent: :destroy

  has_many :supports, dependent: :destroy

  #Indirect associations:
  has_many :fans, through: :support
  has_one :owner, through: :habit

end
