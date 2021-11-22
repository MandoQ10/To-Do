require "application_system_test_case"
require 'selenium-webdriver'

@driver = Selenium::WebDriver.for :chrome

class ToDoEntriesTest < ApplicationSystemTestCase
  setup do
    @to_do_entry = to_do_entries(:one)
  end

  # test "To-do can be marked as completed" do 
  #   visit to_do_entries_url
  #   find('input[class="update-298486374"]').set(true)
    
  #   assert_selector "p",text: "To do entry was successfully updated"   
  #   assert_selector "span", text: @to_do_entry.title
  # end 

  test "visiting the index" do
    visit to_do_entries_url
    assert_selector "h1", text: "Your To-Dos"
  end

  test "creating a To do entry with uncompleted status" do
    visit to_do_entries_url
    click_on "Create New To-Do"

    fill_in "title", with: @to_do_entry.title
    click_on "Save"

    assert_text "To do entry was successfully created"

    assert_text @to_do_entry.title
  end

  test "creating a To do entry with completed status" do
    visit to_do_entries_url
    click_on "Create New To-Do"

    fill_in "title", with: @to_do_entry.title
    find('input[id="set-completed-status"]').set(true)
    click_on "Save"

    assert_text "To do entry was successfully created"

    assert_text @to_do_entry.title
  end

  test "updating a To do entry" do
    visit to_do_entries_url
    click_on "edit", match: :first

    fill_in "to_do_entry[title]", with: "Update To-Do"
    click_on "Update To do entry"

    assert_text "To do entry was successfully updated"
  end

  test "destroying a To do entry" do
    visit to_do_entries_url
    accept_confirm do
      click_on "Destroy", match: :first
    end
  end 

  test "should create To-Do with due date" do
    visit to_do_entries_url
    click_on "Create New To-Do"

    fill_in "title", with: @to_do_entry.title
  
    fill_in "due_date", with: @to_do_entry.due_date

    click_on "Save"

    assert_text "To do entry was successfully created"
    assert_text @to_do_entry.title
    assert_text "November 22, 2021"
  end 

  test "should create a To-Do without a due date" do
    visit to_do_entries_url
    click_on "Create New To-Do"

    fill_in "title", with: @to_do_entry.title
    click_on "Save"

    assert_text "To do entry was successfully created"
    assert_text @to_do_entry.title
    
  end 
end
