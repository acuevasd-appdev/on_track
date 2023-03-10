require "application_system_test_case"

class StepsTest < ApplicationSystemTestCase
  setup do
    @step = steps(:one)
  end

  test "visiting the index" do
    visit steps_url
    assert_selector "h1", text: "Steps"
  end

  test "creating a Step" do
    visit steps_url
    click_on "New Step"

    fill_in "Caption", with: @step.caption
    fill_in "Comments count", with: @step.comments_count
    fill_in "Date completion", with: @step.date_completion
    fill_in "Habit", with: @step.habit_id
    fill_in "Image", with: @step.image
    fill_in "Supports count", with: @step.supports_count
    click_on "Create Step"

    assert_text "Step was successfully created"
    click_on "Back"
  end

  test "updating a Step" do
    visit steps_url
    click_on "Edit", match: :first

    fill_in "Caption", with: @step.caption
    fill_in "Comments count", with: @step.comments_count
    fill_in "Date completion", with: @step.date_completion
    fill_in "Habit", with: @step.habit_id
    fill_in "Image", with: @step.image
    fill_in "Supports count", with: @step.supports_count
    click_on "Update Step"

    assert_text "Step was successfully updated"
    click_on "Back"
  end

  test "destroying a Step" do
    visit steps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Step was successfully destroyed"
  end
end
