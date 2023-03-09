task sample_data: :environment do
  p "Creating sample data"

  Support.destroy_all
  Step.destroy_all
  Habit.destroy_all
  User.destroy_all


  support = Support.all
  support.each do |sp|
    sp.destroy
  end

  p "#{User.count} current users."
  p "#{FriendRequest.count} friendships requests"
  p "#{Habit.count} current habits"
  p "#{Step.count} current steps"
  p "#{Support.count} current supports"
end
