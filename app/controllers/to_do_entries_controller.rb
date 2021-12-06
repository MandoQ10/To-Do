class ToDoEntriesController < ApplicationController
  before_action :get_list
  before_action :set_to_do_entry, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
 
  # GET /to_do_entries or /to_do_entries.json

  def index
    # @to_do_entries = ToDoEntry.all.sort(&:sort_date)
    @to_do_entries = @list.to_do_entries.all.sort(&:sort_date)
  end
  # GET /to_do_entries/1 or /to_do_entries/1.json
  def show
  end

  # GET /to_do_entries/new
  def new
    @to_do_entries = @list.to_do_entries.build
  end

  # # GET /to_do_entries/1/edit
  def edit
   
  end

  # # POST /to_do_entries or /to_do_entries.json
  def create 
    @to_do_entry = @list.to_do_entries.build(to_do_entry_params)

    respond_to do |format|
      if @to_do_entry.save
        format.html { redirect_to list_to_do_entries_path(@list), notice: "To do entry was successfully created." }
        format.json { render :show, status: :created, location: @to_do_entry }
      else
        format.html { redirect_to list_to_do_entries_path(@list), notice: @to_do_entry.errors.full_messages }
        format.json { render json: @to_do_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /to_do_entries/1 or /to_do_entries/1.json
  def update
    @to_do_entry = ToDoEntry.find(params[:id])
    respond_to do |format|
      
      if @to_do_entry.update(params.require(:to_do_entry).permit(:title, :completed, :due_date))
        format.html { redirect_to list_to_do_entries_path(@list), notice: "To do entry was successfully updated" }
        format.json { render :show, status: :ok, location: @to_do_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @to_do_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /to_do_entries/1 or /to_do_entries/1.json
  def destroy
   
    @to_do_entry.destroy
    respond_to do |format|
      format.html { redirect_to list_to_do_entries_path(@list), notice: "To do entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_list 
      @list = List.find(params[:list_id])
    end 
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do_entry
      @to_do_entry = @list.to_do_entries.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def to_do_entry_params
      params.permit(:title, :completed, :due_date)
    end
end
