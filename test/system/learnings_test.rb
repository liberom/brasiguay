require "application_system_test_case"

class LearningsTest < ApplicationSystemTestCase
  setup do
    @learning = learnings(:one)
  end

  test "visiting the index" do
    visit learnings_url
    assert_selector "h1", text: "Learnings"
  end

  test "creating a Learning" do
    visit learnings_url
    click_on "New Learning"

    fill_in "Date from", with: @learning.date_from
    fill_in "Date to", with: @learning.date_to
    fill_in "Description", with: @learning.description
    fill_in "Institution", with: @learning.institution
    fill_in "Profile", with: @learning.profile_id
    click_on "Create Learning"

    assert_text "Learning was successfully created"
    click_on "Back"
  end

  test "updating a Learning" do
    visit learnings_url
    click_on "Edit", match: :first

    fill_in "Date from", with: @learning.date_from
    fill_in "Date to", with: @learning.date_to
    fill_in "Description", with: @learning.description
    fill_in "Institution", with: @learning.institution
    fill_in "Profile", with: @learning.profile_id
    click_on "Update Learning"

    assert_text "Learning was successfully updated"
    click_on "Back"
  end

  test "destroying a Learning" do
    visit learnings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Learning was successfully destroyed"
  end
end
