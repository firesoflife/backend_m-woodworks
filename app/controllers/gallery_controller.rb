class GalleryController < ApplicationController
  skip_before_action :authenticate_request

  #GET /galleries
  def index
    @galleries = Gallery.all

    render json: @galleries
  end

  # GET /galleries/1
  def show
    render json: @project
  end

  # POST /galleries
  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      render json: @gallery, status: :created
    else
      render json: @current_gallery.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /galleries/1
  def update
    if @gallery.update(project_params)
      render json: @gallery
    else
      render json: @gallery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @gallery.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gallery_params

      params.permit(:id, :image_url, :cover_image_url, :project_id)

    end
end
