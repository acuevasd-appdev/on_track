require "test_helper"

class SupportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @support = supports(:one)
  end

  test "should get index" do
    get supports_url
    assert_response :success
  end

  test "should get new" do
    get new_support_url
    assert_response :success
  end

  test "should create support" do
    assert_difference('Support.count') do
      post supports_url, params: { support: { fan_id: @support.fan_id, step_id: @support.step_id, support_type: @support.support_type } }
    end

    assert_redirected_to support_url(Support.last)
  end

  test "should show support" do
    get support_url(@support)
    assert_response :success
  end

  test "should get edit" do
    get edit_support_url(@support)
    assert_response :success
  end

  test "should update support" do
    patch support_url(@support), params: { support: { fan_id: @support.fan_id, step_id: @support.step_id, support_type: @support.support_type } }
    assert_redirected_to support_url(@support)
  end

  test "should destroy support" do
    assert_difference('Support.count', -1) do
      delete support_url(@support)
    end

    assert_redirected_to supports_url
  end
end
