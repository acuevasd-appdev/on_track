class StepsController < ApplicationController
  before_action :set_step, only: %i[ show edit update destroy ]

  # GET /steps or /steps.json
  def index
    @steps = Step.all
  end

  # GET /steps/1 or /steps/1.json
  def show
  end

  # GET /steps/new
  def new
    @step = Step.new
  end

  # GET /steps/1/edit
  def edit
  end

  # POST /steps or /steps.json
  def create
    @step = Step.new(step_params)

    #For future: new step to update progress and top streak
    #if @step.save
      #habit = @step.habit
      #Review that last step was on track for the goal (for future reference)
      #habit.current_progress += 1 
      #if habit.top_streak < habit.current_progress
        #habit.top_streak = habit.current_progress
      #end
    #end

    respond_to do |format|
      if @step.save
        format.html { redirect_to step_url(@step), notice: "Step was successfully created." }
        format.json { render :show, status: :created, location: @step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1 or /steps/1.json
  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to step_url(@step), notice: "Step was successfully updated." }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1 or /steps/1.json
  def destroy
    @step.destroy

    respond_to do |format|
      format.html { redirect_to steps_url, notice: "Step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def step_params
      params.require(:step).permit(:caption, :image, :comments_count, :supports_count, :habit_id, :date_completion)
    end
end
