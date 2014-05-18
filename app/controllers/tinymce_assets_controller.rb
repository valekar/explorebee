class TinymceAssetsController < ApplicationController
  before_action :get_id

  def create
    #temp = TempPlacePhotos.new(image:params[:file])
    hint = params[:hint]

    p "Hint"
    p hint


    #this regex is used for getting the model name out of URL
    resource = URI(hint)
    resource = resource.path
    resource = resource.reverse
    resource = resource.sub /[a-zA-Z0-9]+\/[0-9]+\//,''
    resource = resource.reverse
    resource = resource.sub /\//, ''

    resource = resource.singularize.classify


    id = URI(hint)
    id = id.path
    id = id.gsub /[a-z\/]/,''




    #all_resources = Array.new
    #all_resources = AllModels


    #all_resources.each do |model_name|
      if(resource == 'Place')
        @place = Place.find(id)
        obj = @place.place_albums.new(image:params[:file])
        elsif(resource == 'Post')
          @post = Post.find(id)
          obj = @post.post_images.new(image:params[:file])
        end
    #end

    if obj.save

      render json: {
          image:{
              url:obj.image_url.to_s,
              width:"250".to_i,
              height:"250".to_i
          }

      },layout: false, content_type: "text/html"
    end




  end



  private

  def get_id
    p "ID"
    p request.path
  end

end
