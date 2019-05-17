class CoachInvitationsController < ApplicationController
  def index
    @coach_invitations = CoachInvitation.all

    render("coach_invitation_templates/index.html.erb")
  end

  def show
    @coach_invitation = CoachInvitation.find(params.fetch("id_to_display"))

    render("coach_invitation_templates/show.html.erb")
  end

  def new_form
    @coach_invitation = CoachInvitation.new

    render("coach_invitation_templates/new_form.html.erb")
  end

  def create_row
    @coach_invitation = CoachInvitation.new

    @coach_invitation.coach_id = params.fetch("coach_id")
    @coach_invitation.plan_id = params.fetch("plan_id")

    if @coach_invitation.valid?
      @coach_invitation.save

      redirect_back(:fallback_location => "/coach_invitations", :notice => "Coach invitation created successfully.")
    else
      render("coach_invitation_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @coach_invitation = CoachInvitation.find(params.fetch("prefill_with_id"))

    render("coach_invitation_templates/edit_form.html.erb")
  end

  def update_row
    @coach_invitation = CoachInvitation.find(params.fetch("id_to_modify"))

    @coach_invitation.coach_id = params.fetch("coach_id")
    @coach_invitation.plan_id = params.fetch("plan_id")

    if @coach_invitation.valid?
      @coach_invitation.save

      redirect_to("/coach_invitations/#{@coach_invitation.id}", :notice => "Coach invitation updated successfully.")
    else
      render("coach_invitation_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_coach
    @coach_invitation = CoachInvitation.find(params.fetch("id_to_remove"))

    @coach_invitation.destroy

    redirect_to("/users/#{@coach_invitation.coach_id}", notice: "CoachInvitation deleted successfully.")
  end

  def destroy_row_from_plan
    @coach_invitation = CoachInvitation.find(params.fetch("id_to_remove"))

    @coach_invitation.destroy

    redirect_to("/plans/#{@coach_invitation.plan_id}", notice: "CoachInvitation deleted successfully.")
  end

  def destroy_row
    @coach_invitation = CoachInvitation.find(params.fetch("id_to_remove"))

    @coach_invitation.destroy

    redirect_to("/coach_invitations", :notice => "Coach invitation deleted successfully.")
  end
end
