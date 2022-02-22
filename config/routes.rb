Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username", { :controller => "users", :action => "show" })
  get("/photos/", { :controller => "photos", :action => "index" })
  get("/photos/:photo_id", { :controller => "photos", :action => "photo_detail" })
  get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete_photo" })
end
