class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  layout :resolve_layout,only:[:edit]

  before_action :signed_in_post?, only: [:create,:new]

 # load_and_authorize_resource
  #skip_authorize_resource only:[:index,:show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.paginate(page: params[:page], :per_page => 10)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new

    @interests = Interest.all

  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    #week_newsletter

    respond_to do |format|
      if @post.save
        track_activity @post
        @post.post_and_interests.create(interest_param) if !interest_param.blank?

        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy



    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end



  # The method is very useful.
  # It is used to get the photos that are not used in tinymce editor and remove those photos in the post_images
  def cleanMemory
    post_id = params[:post_id]
    photo_urls = params[:photo_urls]
    unless photo_urls.nil?
      #first get all the original photos tat are there in database
      original_place_photos = Array.new
      @post = Post.find(post_id)
      @post.post_images.all.each do |photo|
        #adding all the photos of the post
        original_place_photos << photo.image_url
      end

      #take only the path from the urls
      new_photo_urls = Array.new
      photo_urls.each do |photo_url|
        photo_url = URI(photo_url)
        photo_url = photo_url.path
        new_photo_urls << photo_url
      end


      #This gives the photos that are not being used
      removable_photos = original_place_photos - new_photo_urls

      #used to extract the path of the photos that are to be removed
      removable_urls = Array.new


      removable_photos.each do |url|
        # output :: #<URI::HTTP:0x000000087d4878 URL:http://localhost:3000/u...ge/6/shivanasamdra.jpeg>
        removable_photos = URI(url)
        #output :: "/u...ge/6/shivanasamdra.jpeg"
        removable_photos = removable_photos.path
        #output :: "shivanasamdra.jpeg"
        removable_url = removable_photos.sub /\/.+\//,''

        #addign the urls to the array
        removable_urls << removable_url
      end


      p "Photos_urls     #{photo_urls}"
      p "Original  :: #{original_place_photos}"
      p "removable Phtos :: #{ original_place_photos - photo_urls}"
      p "removable_urls    #{removable_urls}"



      @post.post_images.where(image:removable_urls).each do |post_image|
        post_image.destroy
      end
    end



    respond_to do |f|
      f.json {render json:true}
    end


  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    #its important that you include interest_tokens inside this post_parmas
    def post_params
      params.require(:post).permit(:name, :description, :postImage,:interest_tokens,:detail_description,:photo_urls)
    end

    def interest_param
      params.permit(:interest_tokens)
    end

  def resolve_layout
    'admin_layout'
  end

    def signed_in_post?
      !current_user.nil?
    end







end
