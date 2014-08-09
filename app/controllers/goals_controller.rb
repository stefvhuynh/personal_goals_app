class GoalsController < ApplicationController
  before_filter :require_logged_in!, except: [:index, :show]

  def index
    @goals = Goal.all
    render :index
  end

  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = current_user.goals.build(goal_params)

    if @goal.save
      redirect_to user_goal_url(@goal.user, @goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    render :edit
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal && @goal.update(user_params)
      redirect_to user_goal_url(@goal.user, @goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :plan, :shared, :completed)
  end

end


