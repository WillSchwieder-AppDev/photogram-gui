class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :asc })
    render({ :template => "photo_templates/index.html.erb" })
  end

  def photo_detail
    @photo_id = params.fetch("photo_id")

    @matching_photo = Photo.where({ :id => @photo_id })

    @the_photo = @matching_photo.first

    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/photo_details.html.erb" })
    end
  end

  def delete_photo
    photo_id = params.fetch("photo_id")

    matching_photos = Photo.where({ :id => photo_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    redirect_to("/photos/")
  end
end
