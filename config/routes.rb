Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "plans#index"
  # Routes for the Goal comment resource:

  # CREATE
  get("/goal_comments/new", { :controller => "goal_comments", :action => "new_form" })
  post("/create_goal_comment", { :controller => "goal_comments", :action => "create_row" })

  # READ
  get("/goal_comments", { :controller => "goal_comments", :action => "index" })
  get("/goal_comments/:id_to_display", { :controller => "goal_comments", :action => "show" })

  # UPDATE
  get("/goal_comments/:prefill_with_id/edit", { :controller => "goal_comments", :action => "edit_form" })
  post("/update_goal_comment/:id_to_modify", { :controller => "goal_comments", :action => "update_row" })

  # DELETE
  get("/delete_goal_comment/:id_to_remove", { :controller => "goal_comments", :action => "destroy_row" })
  get("/delete_goal_comment_from_goal/:id_to_remove", { :controller => "goal_comments", :action => "destroy_row_from_goal" })
  get("/delete_goal_comment_from_author/:id_to_remove", { :controller => "goal_comments", :action => "destroy_row_from_author" })

  #------------------------------

  # Routes for the Plan comment resource:

  # CREATE
  get("/plan_comments/new", { :controller => "plan_comments", :action => "new_form" })
  post("/create_plan_comment", { :controller => "plan_comments", :action => "create_row" })

  # READ
  get("/plan_comments", { :controller => "plan_comments", :action => "index" })
  get("/plan_comments/:id_to_display", { :controller => "plan_comments", :action => "show" })

  # UPDATE
  get("/plan_comments/:prefill_with_id/edit", { :controller => "plan_comments", :action => "edit_form" })
  post("/update_plan_comment/:id_to_modify", { :controller => "plan_comments", :action => "update_row" })

  # DELETE
  get("/delete_plan_comment/:id_to_remove", { :controller => "plan_comments", :action => "destroy_row" })
  get("/delete_plan_comment_from_plan/:id_to_remove", { :controller => "plan_comments", :action => "destroy_row_from_plan" })
  get("/delete_plan_comment_from_author/:id_to_remove", { :controller => "plan_comments", :action => "destroy_row_from_author" })

  #------------------------------

  # Routes for the Coach invitation resource:

  # CREATE
  get("/coach_invitations/new", { :controller => "coach_invitations", :action => "new_form" })
  post("/create_coach_invitation", { :controller => "coach_invitations", :action => "create_row" })

  # READ
  get("/coach_invitations", { :controller => "coach_invitations", :action => "index" })
  get("/coach_invitations/:id_to_display", { :controller => "coach_invitations", :action => "show" })

  # UPDATE
  get("/coach_invitations/:prefill_with_id/edit", { :controller => "coach_invitations", :action => "edit_form" })
  post("/update_coach_invitation/:id_to_modify", { :controller => "coach_invitations", :action => "update_row" })

  # DELETE
  get("/delete_coach_invitation/:id_to_remove", { :controller => "coach_invitations", :action => "destroy_row" })
  get("/delete_coach_invitation_from_plan/:id_to_remove", { :controller => "coach_invitations", :action => "destroy_row_from_plan" })
  get("/delete_coach_invitation_from_coach/:id_to_remove", { :controller => "coach_invitations", :action => "destroy_row_from_coach" })

  #------------------------------

  # Routes for the Action step resource:

  # CREATE
  get("/action_steps/new", { :controller => "action_steps", :action => "new_form" })
  post("/create_action_step", { :controller => "action_steps", :action => "create_row" })

  # READ
  get("/action_steps", { :controller => "action_steps", :action => "index" })
  get("/action_steps/:id_to_display", { :controller => "action_steps", :action => "show" })

  # UPDATE
  get("/action_steps/:prefill_with_id/edit", { :controller => "action_steps", :action => "edit_form" })
  post("/update_action_step/:id_to_modify", { :controller => "action_steps", :action => "update_row" })

  # DELETE
  get("/delete_action_step/:id_to_remove", { :controller => "action_steps", :action => "destroy_row" })
  get("/delete_action_step_from_goal/:id_to_remove", { :controller => "action_steps", :action => "destroy_row_from_goal" })

  #------------------------------

  # Routes for the Goal resource:

  # CREATE
  get("/goals/new", { :controller => "goals", :action => "new_form" })
  post("/create_goal", { :controller => "goals", :action => "create_row" })

  # READ
  get("/goals", { :controller => "goals", :action => "index" })
  get("/goals/:id_to_display", { :controller => "goals", :action => "show" })

  # UPDATE
  get("/goals/:prefill_with_id/edit", { :controller => "goals", :action => "edit_form" })
  post("/update_goal/:id_to_modify", { :controller => "goals", :action => "update_row" })

  # DELETE
  get("/delete_goal/:id_to_remove", { :controller => "goals", :action => "destroy_row" })
  get("/delete_goal_from_plan/:id_to_remove", { :controller => "goals", :action => "destroy_row_from_plan" })

  #------------------------------

  # Routes for the Plan resource:

  # CREATE
  get("/plans/new", { :controller => "plans", :action => "new_form" })
  post("/create_plan", { :controller => "plans", :action => "create_row" })

  # READ
  get("/plans", { :controller => "plans", :action => "index" })
  get("/plans/:id_to_display", { :controller => "plans", :action => "show" })

  # UPDATE
  get("/plans/:prefill_with_id/edit", { :controller => "plans", :action => "edit_form" })
  post("/update_plan/:id_to_modify", { :controller => "plans", :action => "update_row" })

  # DELETE
  get("/delete_plan/:id_to_remove", { :controller => "plans", :action => "destroy_row" })
  get("/delete_plan_from_owner/:id_to_remove", { :controller => "plans", :action => "destroy_row_from_owner" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
