class FramesController < ApplicationController
  before_action :set_frame, only: [:show, :destroy]
  before_action :validate_user, only: [:create, :destroy, :index]
  skip_before_action :check_header, only: :create

  def index
    frames = @current_user.frames
    render json: frames, width_screen: request.headers["X-Image-Width"], height_size: request.headers["X-Image-Height"], meta: default_meta
  end

  def show
    render json: @frame, width_screen: request.headers["X-Image-Width"], height_size: request.headers["X-Image-Height"], meta: default_meta
  end

  def create
    frame = Frame.new(frame_params)
    frame.user_id = @current_user.id
    if frame.save
      render json: frame, status: :created, meta: default_meta
    else
      render json: frame.errors
    end
  end

  def destroy
    @frame.destroy
    head 204
  end

  private

  def set_frame
    begin
      @frame = Frame.find params[:id]
    rescue ActiveRecord::RecordNotFound
      frame = Frame.new
      frame.errors.add(:id, "Wrong ID provided")
      render_error(frame, 404) and return
    end
  end

  def frame_params
    params.require(:frame).permit(:title, :frame)
  end
end