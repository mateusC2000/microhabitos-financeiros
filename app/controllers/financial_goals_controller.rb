class FinancialGoalsController < ApplicationController
  before_action :set_financial_goal, only: %i[show edit update destroy]

  def index
    @financial_goals = FinancialGoal.all
  end

  def show; end

  def new
    @financial_goal = FinancialGoal.new
  end

  def edit; end

  def create
    @financial_goal = FinancialGoal.new(financial_goal_params)

    if @financial_goal.save
      redirect_to @financial_goal, notice: "Meta financeira criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @financial_goal.update(financial_goal_params)
      redirect_to @financial_goal, notice: "Meta financeira atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @financial_goal.destroy
    redirect_to financial_goals_url, notice: "Meta financeira removida com sucesso."
  end

  private

  def set_financial_goal
    @financial_goal = FinancialGoal.find(params[:id])
  end

  def financial_goal_params
    params.require(:financial_goal).permit(:title, :description, :target_value, :due_date, :user_id)
  end
end
