require "application_system_test_case"
require 'selenium-webdriver'
require 'pry'

@driver = Selenium::WebDriver.for :chrome
@today_date = Date.today.to_formatted_s(:long) 

class ToDoEntriesTest < ApplicationSystemTestCase
  setup do
    @to_do_entry = to_do_entries(:one)
    @to_do_entry_2 = to_do_entries(:two)
    @to_do_entry_3 = to_do_entries(:three)
    @to_do_entry_3 = to_do_entries(:four)
  end

  test "To-Do ordering should be arranged from upcoming to future date" do
    visit to_do_entries_url 
    list_of_to_dos = all(class: "card-body")


    expected_to_do_list = ["3rd To-Do", "2nd To-Do", "New To-Do", "4th To-Do"]
    
    current_to_do_list = list_of_to_dos.collect do |to_do|
      to_do.find(class: "title").text
    end
    
    assert_equal(expected_to_do_list, current_to_do_list)
  end 

  # test "To-do can be marked as completed" do 
  #   visit to_do_entries_url

  #   find(class: "update-#{@to_do_entry.id}").click
    
  #   assert_text "To do entry was successfully updated"   
  #   assert_selector "span", text: @to_do_entry.title
  # end 

  # test "visiting the index" do
  #   visit to_do_entries_url
  #   assert_selector "h1", text: "Your To-Dos"
  # end

  # test "creating a To do entry with uncompleted status" do
  #   visit to_do_entries_url
  #   click_on "Create New To-Do"

  #   fill_in "title", with: @to_do_entry.title
  #   click_on "Save"

  #   assert_text "To do entry was successfully created"

  #   assert_text @to_do_entry.title
  # end

  # test "creating a To do entry with completed status" do
  #   visit to_do_entries_url
  #   click_on "Create New To-Do"

  #   fill_in "title", with: @to_do_entry.title
  #   find('input[id="set-completed-status"]').set(true)
  #   click_on "Save"

  #   assert_text "To do entry was successfully created"

  #   assert_text @to_do_entry.title
  # end

  # test "updating a To do entry" do
  #   visit to_do_entries_url
  #   click_on(id: "edit-#{@to_do_entry.id}")

  #   fill_in "to_do_entry[title]", with: "Update To-Do"
  #   click_on "Update To do entry"

  #   assert_text "To do entry was successfully updated"
  # end

  # test "destroying a To do entry" do
  #   visit to_do_entries_url
  #   accept_confirm do
  #     click_on(id: "delete-#{@to_do_entry.id}")
  #   end
  # end 

  # test "should create To-Do with due date" do
  #   visit to_do_entries_url
  #   click_on "Create New To-Do"

  #   fill_in "title", with: @to_do_entry.title
  
  #   fill_in "due_date", with: @to_do_entry.due_date

  #   click_on "Save"

  #   assert_text "To do entry was successfully created"
  #   assert_text @to_do_entry.title
  #   assert_text @today_date
  # end 

  # test "should create a To-Do without a due date" do
  #   visit to_do_entries_url
  #   click_on "Create New To-Do"

  #   fill_in "title", with: @to_do_entry.title
  #   click_on "Save"

  #   assert_text "To do entry was successfully created"
  #   assert_text @to_do_entry.title
    
  # end 
end
