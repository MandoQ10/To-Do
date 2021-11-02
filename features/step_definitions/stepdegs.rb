def are_to_dos_displayed
    'Finish English Homework, Take The Trash Out, Wash Dishes'
end 

Given('the user visits the To-Do Home Page') do
    
  end
  
  When('the page is loaded') do
    @actual_displayed_to_dos = are_to_dos_displayed
  end
  
  Then('user should be presented the following To-Dos {string}') do |string|
    assert_equal(@actual_displayed_to_dos, string)
  end