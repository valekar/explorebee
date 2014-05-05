class TinymceAssetsController < ApplicationController
  before_action :get_id

  def create
    temp = TempPlacePhotos.new(image:params[:file])
    hint = params[:hint]

    hint = hint.slice("/");


    p "hintsss"
    p hint

    if temp.save

      #p temp.image_url(:normal).to_s
     # p "Testing tempppppp"

      render json: {
          image:{
              url:temp.image_url.to_s,
              width:"250".to_i,
              height:"250".to_i
          }

      },layout: false, content_type: "text/html"
    end

  end



  private

  def get_id
    p "IIDDDDD"
    p request.path
  end

end
