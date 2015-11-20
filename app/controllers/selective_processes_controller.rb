class SelectiveProcessesController < ApplicationController
  before_action :set_selective_process, only: [:show, :edit, :update, :destroy]

  # GET /selective_processes
  # GET /selective_processes.json
  def index
    @selective_processes = SelectiveProcess.all
  end

  # GET /selective_processes/1
  # GET /selective_processes/1.json
  def show
    @selective_process = SelectiveProcess.find(params[:id])
    @responsible = User.find(@selective_process.responsible)
    @activities = @selective_process.get_activities
  end

  # GET /selective_processes/new
  def new
    @selective_process = SelectiveProcess.new
  end

  # GET /selective_processes/1/edit
  def edit
  end

  # POST /selective_processes
  # POST /selective_processes.json
  def create
    @selective_process = SelectiveProcess.new(selective_process_params)

    respond_to do |format|
      if @selective_process.save
        format.html { redirect_to @selective_process, notice: 'Selective process was successfully created.' }
        format.json { render :show, status: :created, location: @selective_process }
      else
        format.html { render :new }
        format.json { render json: @selective_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selective_processes/1
  # PATCH/PUT /selective_processes/1.json
  def update
    respond_to do |format|
      if @selective_process.update(selective_process_params)
        format.html { redirect_to @selective_process, notice: 'Selective process was successfully updated.' }
        format.json { render :show, status: :ok, location: @selective_process }
      else
        format.html { render :edit }
        format.json { render json: @selective_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selective_processes/1
  # DELETE /selective_processes/1.json
  def destroy
    @selective_process.destroy
    respond_to do |format|
      format.html { redirect_to selective_processes_url, notice: 'Selective process was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selective_process
      @selective_process = SelectiveProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selective_process_params
      params.require(:selective_process).permit(:name_process, :responsible, :deadline)
    end
end
