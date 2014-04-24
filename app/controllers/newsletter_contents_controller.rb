class NewsletterContentsController < ApplicationController
  before_action :set_newsletter_content, only: [:show, :edit, :update, :destroy]

  # GET /newsletter_contents
  # GET /newsletter_contents.json
  def index
    @newsletter_contents = NewsletterContent.all
  end

  # GET /newsletter_contents/1
  # GET /newsletter_contents/1.json
  def show
  end

  # GET /newsletter_contents/new
  def new
    @newsletter_content = NewsletterContent.new
  end

  # GET /newsletter_contents/1/edit
  def edit
  end

  # POST /newsletter_contents
  # POST /newsletter_contents.json
  def create
    @newsletter_content = NewsletterContent.new(newsletter_content_params)

    respond_to do |format|
      if @newsletter_content.save
        format.html { redirect_to @newsletter_content, notice: 'Newsletter content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @newsletter_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @newsletter_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsletter_contents/1
  # PATCH/PUT /newsletter_contents/1.json
  def update
    respond_to do |format|
      if @newsletter_content.update(newsletter_content_params)
        format.html { redirect_to @newsletter_content, notice: 'Newsletter content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @newsletter_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletter_contents/1
  # DELETE /newsletter_contents/1.json
  def destroy
    @newsletter_content.destroy
    respond_to do |format|
      format.html { redirect_to newsletter_contents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter_content
      @newsletter_content = NewsletterContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_content_params
      params.require(:newsletter_content).permit(:name, :description)
    end
end
