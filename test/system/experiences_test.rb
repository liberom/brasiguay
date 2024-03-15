require "application_system_test_case"

class ExperiencesTest < ApplicationSystemTestCase
  setup do
    @experience = experiences(:one)
  end

  test "visiting the index" do
    visit experiences_url
    assert_selector "h1", text: "Experiences"
  end

  test "creating a Experience" do
    visit experiences_url
    click_on "New Experience"

    fill_in "Company", with: @experience.company
    fill_in "Date from", with: @experience.date_from
    fill_in "Date to", with: @experience.date_to
    fill_in "Position", with: @experience.position
    fill_in "Profile", with: @experience.profile_id
    click_on "Create Experience"

    assert_text "Experience was successfully created"
    click_on "Back"
  end

  test "updating a Experience" do
    visit experiences_url
    click_on "Edit", match: :first

    fill_in "Company", with: @experience.company
    fill_in "Date from", with: @experience.date_from
    fill_in "Date to", with: @experience.date_to
    fill_in "Position", with: @experience.position
    fill_in "Profile", with: @experience.profile_id
    click_on "Update Experience"

    assert_text "Experience was successfully updated"
    click_on "Back"
  end

  test "destroying a Experience" do
    visit experiences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Experience was successfully destroyed"
  end
end
