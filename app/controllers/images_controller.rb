class ImagesController < ApplicationController
  skip_before_action :authenticate_request
  before_action  only: %i[show create update destroy]

  # GET /images
  def index
    @images = Image.all
    render json: @images, status: :ok
  end

  # GET /images/1
  def show
    # @image = Image.find(params[:id])
    # render json: @image, status: :ok

    # @images = Image.find_each(params[:id])

    @images = Image.where(gallery_id: params[:id]  .split(','))

    render json: @images, status: :ok
  end


  # POST /images
  def create
    @image = Image.new(image_params)

    if @image.save
      render json: @image, status: :created, location: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
  end

  

  private
  
  def set_image
    @image = Image.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def image_params
    params.permit(:id, :image_url, :alt_text, :gallery_id)
  end
end
