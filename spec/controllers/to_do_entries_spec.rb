require 'rails_helper'

describe ToDoEntriesController do 
    describe "GET new" do 
        it "renders :new template" do 
            get :new 
            expect(response).to render_template(:new)
        end
        
        it "assigns requested to_do_entry to @to_do_entry" do
            get :new
            expect(assigns(:to_do_entry)).to be_a_new(ToDoEntry)
        end
    end 
end