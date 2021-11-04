class ToDoEntriesController < ApplicationController
  before_action :set_to_do_entry, only: %i[ show edit update destroy ]

  # GET /to_do_entries or /to_do_entries.json
  def index
    @to_do_entries = ToDoEntry.all
  end

  # GET /to_do_entries/1 or /to_do_entries/1.json
  def show
  end

  # GET /to_do_entries/new
  def new
    @to_do_entry = ToDoEntry.new
  end

  # # GET /to_do_entries/1/edit
  # def edit
  # end

  # # POST /to_do_entries or /to_do_entries.json
  # def create
  #   @to_do_entry = ToDoEntry.new(to_do_entry_params)

  #   respond_to do |format|
  #     if @to_do_entry.save
  #       format.html { redirect_to @to_do_entry, notice: "To do entry was successfully created." }
  #       format.json { render :show, status: :created, location: @to_do_entry }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @to_do_entry.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /to_do_entries/1 or /to_do_entries/1.json
  # def update
  #   respond_to do |format|
  #     if @to_do_entry.update(to_do_entry_params)
  #       format.html { redirect_to @to_do_entry, notice: "To do entry was successfully updated." }
  #       format.json { render :show, status: :ok, location: @to_do_entry }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @to_do_entry.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /to_do_entries/1 or /to_do_entries/1.json
  # def destroy
  #   @to_do_entry.destroy
  #   respond_to do |format|
  #     format.html { redirect_to to_do_entries_url, notice: "To do entry was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do_entry
      @to_do_entry = ToDoEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def to_do_entry_params
      params.require(:to_do_entry).permit(:title)
    end
end
