require "application_system_test_case"

class EstatesTest < ApplicationSystemTestCase
  setup do
    @estate = estates(:one)
  end

  test "visiting the index" do
    visit estates_url
    assert_selector "h1", text: "Estates"
  end

  test "creating a Estate" do
    visit estates_url
    click_on "New Estate"

    fill_in "Area", with: @estate.area
    fill_in "Currency", with: @estate.currency
    fill_in "Modality", with: @estate.modality
    fill_in "Price", with: @estate.price
    fill_in "Title", with: @estate.title
    fill_in "Type", with: @estate.type
    fill_in "User", with: @estate.user_id
    click_on "Create Estate"

    assert_text "Estate was successfully created"
    click_on "Back"
  end

  test "updating a Estate" do
    visit estates_url
    click_on "Edit", match: :first

    fill_in "Area", with: @estate.area
    fill_in "Currency", with: @estate.currency
    fill_in "Modality", with: @estate.modality
    fill_in "Price", with: @estate.price
    fill_in "Title", with: @estate.title
    fill_in "Type", with: @estate.type
    fill_in "User", with: @estate.user_id
    click_on "Update Estate"

    assert_text "Estate was successfully updated"
    click_on "Back"
  end

  test "destroying a Estate" do
    visit estates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estate was successfully destroyed"
  end
end
