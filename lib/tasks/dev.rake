task sample_data: :environment do
  p "Creating sample data"

  if Rails.env.development?
    Support.destroy_all
    FriendRequest.destroy_all  
    Step.destroy_all
    Habit.destroy_all
    User.destroy_all
  end

  usernames = Array.new{Faker::Name.first_name}
  5.times do
    this_name = Faker::Name.first_name
    usernames << this_name
  end
  usernames << "alice"
  usernames << "bob"
  usernames.each do |username|
    User.create(
      email: "#{username}@example.com",
      username: username.downcase,
      password: "password",
      private: [true,false].sample
    )
  end
  p "#{User.count} users have been created."

  all_users = User.all
  total_users = all_users.length

  #FriendRequests
  all_users.each do |user1|
    all_users.each do |user2|
       if user2.id > user1.id && rand < 0.8 && user1 != user2
        user1.sent_friend_requests.create(
          recipient: user2,
          status: FriendRequest.statuses.keys.sample 
          #keys or values
        )
      end

      
    end
  end

  p "#{FriendRequest.count} friendships requests have been created."

  #Habits
  all_users.each do |user|
    creating = rand(1..2)
    creating.times do
      title_text = Faker::Hobby.activity
      desc_text = Faker::Quote.yoda 
      
      habit = user.own_habits.create(
        title: title_text,
        description: desc_text,
        habit_type: Habit.habit_types.keys.sample,
        frequency: Habit.frequencies.keys.sample,
        goal_frequency: 3
        )
      
      #Steps
      steptimes = rand(1..3)
      steptimes.times do 
        cap_text = Faker::Quote.most_interesting_man_in_the_world
        if rand < 0.5
          image_text = "https://robohash.org/#{rand(9999)}"
        end
        
        step = habit.steps.create(
          caption: cap_text,
          image: image_text,
          date_completion: Date.today
        )
        
        #Update habit
        habit.current_progress += 1 
        if habit.top_streak < habit.current_progress
          habit.top_streak = habit.current_progress
        end

        #Comments and Support
        user.friends_s.each do |friend|
          #Supports
          step.supports.create(
          support_type: Support.support_types.keys.sample, 
          fan: friend

        end
      end  
   end
  end

  p "#{Habit.count} habits have been created."
  p "#{Step.count} steps have been created."
  p "#{Support.count} supports have been created."
end
