class PlansController < ApplicationController
  before_action :current_user_must_be_plan_owner, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_plan_owner
    plan = Plan.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == plan.owner
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Plan.ransack(params[:q])
    @plans = @q.result(:distinct => true).includes(:owner, :goals, :coaches, :plan_comments).page(params[:page]).per(10)

    render("plan_templates/index.html.erb")
  end

  def show
    @plan_comment = PlanComment.new
    @coach_invitation = CoachInvitation.new
    @goal = Goal.new
    @plan = Plan.find(params.fetch("id_to_display"))

    render("plan_templates/show.html.erb")
  end

  def new_form
    @plan = Plan.new

    render("plan_templates/new_form.html.erb")
  end

  def create_row
    @plan = Plan.new

    @plan.description = params.fetch("description")
    @plan.status = params.fetch("status")
    @plan.owner_id = params.fetch("owner_id")

    if @plan.valid?
      @plan.save

      redirect_back(:fallback_location => "/plans", :notice => "Plan created successfully.")
    else
      render("plan_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @plan = Plan.find(params.fetch("prefill_with_id"))

    render("plan_templates/edit_form.html.erb")
  end

  def update_row
    @plan = Plan.find(params.fetch("id_to_modify"))

    @plan.description = params.fetch("description")
    @plan.status = params.fetch("status")
    

    if @plan.valid?
      @plan.save

      redirect_to("/plans/#{@plan.id}", :notice => "Plan updated successfully.")
    else
      render("plan_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_owner
    @plan = Plan.find(params.fetch("id_to_remove"))

    @plan.destroy

    redirect_to("/users/#{@plan.owner_id}", notice: "Plan deleted successfully.")
  end

  def destroy_row
    @plan = Plan.find(params.fetch("id_to_remove"))

    @plan.destroy

    redirect_to("/plans", :notice => "Plan deleted successfully.")
  end
end
