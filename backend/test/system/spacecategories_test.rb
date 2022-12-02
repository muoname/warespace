require "application_system_test_case"

class SpacecategoriesTest < ApplicationSystemTestCase
  setup do
    @spacecategory = spacecategories(:one)
  end

  test "visiting the index" do
    visit spacecategories_url
    assert_selector "h1", text: "Spacecategories"
  end

  test "should create spacecategory" do
    visit spacecategories_url
    click_on "New spacecategory"

    fill_in "Category name", with: @spacecategory.category_name
    click_on "Create Spacecategory"

    assert_text "Spacecategory was successfully created"
    click_on "Back"
  end

  test "should update Spacecategory" do
    visit spacecategory_url(@spacecategory)
    click_on "Edit this spacecategory", match: :first

    fill_in "Category name", with: @spacecategory.category_name
    click_on "Update Spacecategory"

    assert_text "Spacecategory was successfully updated"
    click_on "Back"
  end

  test "should destroy Spacecategory" do
    visit spacecategory_url(@spacecategory)
    click_on "Destroy this spacecategory", match: :first

    assert_text "Spacecategory was successfully destroyed"
  end
end
