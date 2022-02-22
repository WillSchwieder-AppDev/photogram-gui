class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })
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

    redirect_to("/photos")
  end

  def insert_photo_record
    owner_id = params.fetch("input_owner_id")
    caption_id = params.fetch("input_caption")
    photo_url = params.fetch("input_image")

    a_new_photo = Photo.new

    a_new_photo.image = photo_url
    a_new_photo.owner_id = owner_id
    a_new_photo.caption = caption_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update_photo_record
    image = params.fetch("input_image")
    caption = params.fetch("input_caption")
    photo_id = params.fetch("photo_id")

    matching_photos = Photo.where({ :id => photo_id })

    the_photo = matching_photos.at(0)

    the_photo.image = image
    the_photo.caption = caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def insert_comment_record
    
  end

end
