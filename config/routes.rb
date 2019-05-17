Rails.application.routes.draw do
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

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
