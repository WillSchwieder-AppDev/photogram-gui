class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    @url_username = params.fetch("username")

    @matching_usernames = User.where({ :username => @url_username })

    @the_user = @matching_usernames.first

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show.html.erb" })
    end
  end

  def update_user
    @url_username = params.fetch("username")

    @matching_usernames = User.where({ :username => @url_username })

    new_username = params.fetch("input_username")

    the_user = matching_usernames.at(0)
    # the_user.username = new_username

    # the_user.save

    redirect_to("/users/anisa")
  end

  def insert_user_record
    username = params.fetch("input_username")
    
    a_new_user = User.new

    a_new_user.username = username
  
    a_new_user.save

    redirect_to("/users/" + a_new_user.username.to_s)
  end
end
