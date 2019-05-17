class GoalCommentsController < ApplicationController
  def index
    @goal_comments = GoalComment.all

    render("goal_comment_templates/index.html.erb")
  end

  def show
    @goal_comment = GoalComment.find(params.fetch("id_to_display"))

    render("goal_comment_templates/show.html.erb")
  end

  def new_form
    @goal_comment = GoalComment.new

    render("goal_comment_templates/new_form.html.erb")
  end

  def create_row
    @goal_comment = GoalComment.new

    @goal_comment.comment = params.fetch("comment")
    @goal_comment.author_id = params.fetch("author_id")
    @goal_comment.goal_id = params.fetch("goal_id")

    if @goal_comment.valid?
      @goal_comment.save

      redirect_back(:fallback_location => "/goal_comments", :notice => "Goal comment created successfully.")
    else
      render("goal_comment_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @goal_comment = GoalComment.find(params.fetch("prefill_with_id"))

    render("goal_comment_templates/edit_form.html.erb")
  end

  def update_row
    @goal_comment = GoalComment.find(params.fetch("id_to_modify"))

    @goal_comment.comment = params.fetch("comment")
    @goal_comment.author_id = params.fetch("author_id")
    @goal_comment.goal_id = params.fetch("goal_id")

    if @goal_comment.valid?
      @goal_comment.save

      redirect_to("/goal_comments/#{@goal_comment.id}", :notice => "Goal comment updated successfully.")
    else
      render("goal_comment_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_author
    @goal_comment = GoalComment.find(params.fetch("id_to_remove"))

    @goal_comment.destroy

    redirect_to("/users/#{@goal_comment.author_id}", notice: "GoalComment deleted successfully.")
  end

  def destroy_row_from_goal
    @goal_comment = GoalComment.find(params.fetch("id_to_remove"))

    @goal_comment.destroy

    redirect_to("/goals/#{@goal_comment.goal_id}", notice: "GoalComment deleted successfully.")
  end

  def destroy_row
    @goal_comment = GoalComment.find(params.fetch("id_to_remove"))

    @goal_comment.destroy

    redirect_to("/goal_comments", :notice => "Goal comment deleted successfully.")
  end
end
