class PlansController < ApplicationController
  def index
    @plans = Plan.all

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
    @plan.owner_id = params.fetch("owner_id")

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
