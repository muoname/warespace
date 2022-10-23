require "test_helper"

class SpacecategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spacecategory = spacecategories(:one)
  end

  test "should get index" do
    get spacecategories_url
    assert_response :success
  end

  test "should get new" do
    get new_spacecategory_url
    assert_response :success
  end

  test "should create spacecategory" do
    assert_difference("Spacecategory.count") do
      post spacecategories_url, params: { spacecategory: { category_name: @spacecategory.category_name } }
    end

    assert_redirected_to spacecategory_url(Spacecategory.last)
  end

  test "should show spacecategory" do
    get spacecategory_url(@spacecategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_spacecategory_url(@spacecategory)
    assert_response :success
  end

  test "should update spacecategory" do
    patch spacecategory_url(@spacecategory), params: { spacecategory: { category_name: @spacecategory.category_name } }
    assert_redirected_to spacecategory_url(@spacecategory)
  end

  test "should destroy spacecategory" do
    assert_difference("Spacecategory.count", -1) do
      delete spacecategory_url(@spacecategory)
    end

    assert_redirected_to spacecategories_url
  end
end
