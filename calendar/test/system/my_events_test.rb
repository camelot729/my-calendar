require "application_system_test_case"

class MyEventsTest < ApplicationSystemTestCase
  setup do
    @my_event = my_events(:one)
  end

  test "visiting the index" do
    visit my_events_url
    assert_selector "h1", text: "My Events"
  end

  test "creating a My event" do
    visit my_events_url
    click_on "New My Event"

    click_on "Create My event"

    assert_text "My event was successfully created"
    click_on "Back"
  end

  test "updating a My event" do
    visit my_events_url
    click_on "Edit", match: :first

    click_on "Update My event"

    assert_text "My event was successfully updated"
    click_on "Back"
  end

  test "destroying a My event" do
    visit my_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "My event was successfully destroyed"
  end
end
