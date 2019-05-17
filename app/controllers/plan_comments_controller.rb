class PlanCommentsController < ApplicationController
  def index
    @q = PlanComment.ransack(params[:q])
    @plan_comments = @q.result(:distinct => true).includes(:author, :plan).page(params[:page]).per(10)

    render("plan_comment_templates/index.html.erb")
  end

  def show
    @plan_comment = PlanComment.find(params.fetch("id_to_display"))

    render("plan_comment_templates/show.html.erb")
  end

  def new_form
    @plan_comment = PlanComment.new

    render("plan_comment_templates/new_form.html.erb")
  end

  def create_row
    @plan_comment = PlanComment.new

    @plan_comment.comment = params.fetch("comment")
    @plan_comment.author_id = params.fetch("author_id")
    @plan_comment.plan_id = params.fetch("plan_id")

    if @plan_comment.valid?
      @plan_comment.save

      redirect_back(:fallback_location => "/plan_comments", :notice => "Plan comment created successfully.")
    else
      render("plan_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_plan
    @plan_comment = PlanComment.new

    @plan_comment.comment = params.fetch("comment")
    @plan_comment.author_id = params.fetch("author_id")
    @plan_comment.plan_id = params.fetch("plan_id")

    if @plan_comment.valid?
      @plan_comment.save

      redirect_to("/plans/#{@plan_comment.plan_id}", notice: "PlanComment created successfully.")
    else
      render("plan_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @plan_comment = PlanComment.find(params.fetch("prefill_with_id"))

    render("plan_comment_templates/edit_form.html.erb")
  end

  def update_row
    @plan_comment = PlanComment.find(params.fetch("id_to_modify"))

    @plan_comment.comment = params.fetch("comment")
    @plan_comment.author_id = params.fetch("author_id")
    @plan_comment.plan_id = params.fetch("plan_id")

    if @plan_comment.valid?
      @plan_comment.save

      redirect_to("/plan_comments/#{@plan_comment.id}", :notice => "Plan comment updated successfully.")
    else
      render("plan_comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_author
    @plan_comment = PlanComment.find(params.fetch("id_to_remove"))

    @plan_comment.destroy

    redirect_to("/users/#{@plan_comment.author_id}", notice: "PlanComment deleted successfully.")
  end

  def destroy_row_from_plan
    @plan_comment = PlanComment.find(params.fetch("id_to_remove"))

    @plan_comment.destroy

    redirect_to("/plans/#{@plan_comment.plan_id}", notice: "PlanComment deleted successfully.")
  end

  def destroy_row
    @plan_comment = PlanComment.find(params.fetch("id_to_remove"))

    @plan_comment.destroy

    redirect_to("/plan_comments", :notice => "Plan comment deleted successfully.")
  end
end
