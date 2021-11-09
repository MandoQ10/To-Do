require "application_system_test_case"

class ToDoEntriesTest < ApplicationSystemTestCase
  setup do
    @to_do_entry = to_do_entries(:one)
  end

  test "visiting the index" do
    visit to_do_entries_url
    assert_selector "h1", text: "To Do Entries"
  end

  test "creating a To do entry" do
    visit to_do_entries_url
    click_on "New To Do Entry"

    fill_in "Title", with: @to_do_entry.title
    click_on "Create To do entry"

    assert_text "To do entry was successfully created"
    click_on "Back"
  end

  test "updating a To do entry" do
    visit to_do_entries_url
    click_on "Edit", match: :first

    fill_in "Title", with: @to_do_entry.title
    click_on "Update To do entry"

    assert_text "To do entry was successfully updated"
    click_on "Back"
  end

  test "destroying a To do entry" do
    visit to_do_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "To do entry was successfully destroyed"
  end
end
