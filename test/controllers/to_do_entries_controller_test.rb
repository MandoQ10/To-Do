require "test_helper"

class ToDoEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @to_do_entry = to_do_entries(:one)
  end

  test "should get index" do
    get to_do_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_to_do_entry_url
    assert_response :success
  end

  test "should create to_do_entry" do
    assert_difference('ToDoEntry.count') do
      post to_do_entries_url, params: { to_do_entry: { title: @to_do_entry.title } }
    end

    assert_redirected_to to_do_entry_url(ToDoEntry.last)
  end

  test "should show to_do_entry" do
    get to_do_entry_url(@to_do_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_to_do_entry_url(@to_do_entry)
    assert_response :success
  end

  test "should update to_do_entry" do
    patch to_do_entry_url(@to_do_entry), params: { to_do_entry: { title: @to_do_entry.title } }
    assert_redirected_to to_do_entry_url(@to_do_entry)
  end

  test "should destroy to_do_entry" do
    assert_difference('ToDoEntry.count', -1) do
      delete to_do_entry_url(@to_do_entry)
    end

    assert_redirected_to to_do_entries_url
  end
end
