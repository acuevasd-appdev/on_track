require "application_system_test_case"

class HabitsTest < ApplicationSystemTestCase
  setup do
    @habit = habits(:one)
  end

  test "visiting the index" do
    visit habits_url
    assert_selector "h1", text: "Habits"
  end

  test "creating a Habit" do
    visit habits_url
    click_on "New Habit"

    fill_in "Current progress", with: @habit.current_progress
    fill_in "Description", with: @habit.description
    fill_in "Frequency", with: @habit.frequency
    fill_in "Goal frequency", with: @habit.goal_frequency
    fill_in "Habit type", with: @habit.habit_type
    fill_in "Owner", with: @habit.owner_id
    check "Private" if @habit.private
    fill_in "Steps count", with: @habit.steps_count
    fill_in "Title", with: @habit.title
    fill_in "Top streak", with: @habit.top_streak
    click_on "Create Habit"

    assert_text "Habit was successfully created"
    click_on "Back"
  end

  test "updating a Habit" do
    visit habits_url
    click_on "Edit", match: :first

    fill_in "Current progress", with: @habit.current_progress
    fill_in "Description", with: @habit.description
    fill_in "Frequency", with: @habit.frequency
    fill_in "Goal frequency", with: @habit.goal_frequency
    fill_in "Habit type", with: @habit.habit_type
    fill_in "Owner", with: @habit.owner_id
    check "Private" if @habit.private
    fill_in "Steps count", with: @habit.steps_count
    fill_in "Title", with: @habit.title
    fill_in "Top streak", with: @habit.top_streak
    click_on "Update Habit"

    assert_text "Habit was successfully updated"
    click_on "Back"
  end

  test "destroying a Habit" do
    visit habits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Habit was successfully destroyed"
  end
end
