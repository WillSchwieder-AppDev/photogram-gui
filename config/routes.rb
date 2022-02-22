Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username", { :controller => "users", :action => "show" })
  get("/update_user/:username", { :controller => "users", :action => "update_user" })
  get("/insert_user_record", { :controller => "users", :action => "insert_user_record" })
  get("/photos/", { :controller => "photos", :action => "index" })
  get("/photos/:photo_id", { :controller => "photos", :action => "photo_detail" })
  get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete_photo" })
  get("/insert_photo_record/", { :controller => "photos", :action => "insert_photo_record" })
  get("/update_photo/:photo_id", { :controller => "photos", :action => "update_photo_record" })
end
