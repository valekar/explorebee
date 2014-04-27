class FeedBacksController < ApplicationController
  before_action :set_feed_back, only: [:show, :edit, :update, :destroy]

  # GET /feed_backs
  # GET /feed_backs.json
  def index
    @feed_backs = FeedBack.all
  end

  # GET /feed_backs/1
  # GET /feed_backs/1.json
  def show
  end

  # GET /feed_backs/new
  def new
    @feed_back = FeedBack.new
  end

  # GET /feed_backs/1/edit
  def edit
  end

  # POST /feed_backs
  # POST /feed_backs.json
  def create
    @feed_back = FeedBack.new(feed_back_params)

    respond_to do |format|
      if @feed_back.save
        format.html { redirect_to root_path, notice: 'Feed back was successfully sent. Thank you very much for your feedback' }
        format.json { render action: 'show', status: :created, location: @feed_back }
      else
        format.html { render action: 'new' }
        format.json { render json: @feed_back.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feed_backs/1
  # PATCH/PUT /feed_backs/1.json
  def update
    respond_to do |format|
      if @feed_back.update(feed_back_params)
        format.html { redirect_to @feed_back, notice: 'Feed back was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feed_back.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feed_backs/1
  # DELETE /feed_backs/1.json
  def destroy
    @feed_back.destroy
    respond_to do |format|
      format.html { redirect_to feed_backs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed_back
      @feed_back = FeedBack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_back_params
      params.require(:feed_back).permit(:email, :subject, :content)
    end
end
