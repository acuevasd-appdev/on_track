# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  comments_count         :integer          default(0)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  habits_count           :integer          default(0)
#  private                :boolean          default(FALSE)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  supports_count         :integer          default(0)
#  username               :citext
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  
  has_many :own_habits, foreign_key: :owner_id, class_name: "Habit", dependent: :destroy

  has_many :sent_friend_requests, foreign_key: :sender_id,  class_name: "FriendRequest", dependent: :destroy
  has_many :received_friend_requests, foreign_key: :recipient_id,  class_name: "FriendRequest", dependent: :destroy

  #Friends sender and receipent
  has_many :accepted_sent_friend_requests, ->{ accepted }, foreign_key: :sender_id,  class_name: "FriendRequest"
  has_many :accepted_received_friend_requests, ->{ accepted }, foreign_key: :recipient_id,  class_name: "FriendRequest"
  has_many :pending_received_friend_requests, ->{ pending }, foreign_key: :recipient_id,  class_name: "FriendRequest"

  has_many :supports, foreign_key: :fan_id, dependent: :destroy

  #Indirect associations:
  has_many :own_steps, through: :own_habits, source: :steps
  has_many :supported_steps, through: :supports, source: :step
  
  has_many :friends_r, through: :accepted_sent_friend_requests, source: :recipient
  has_many :friends_s, through: :accepted_received_friend_requests, source: :sender

  def friend_ids
    (friends_r.ids + friends_s.ids).uniq
  end

  def friends
    User.where(id: friend_ids)
  end
  
end
