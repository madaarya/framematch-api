class FramesController < ApplicationController
  before_action :set_frame, only: [:show, :update, :destroy]
  before_action :validate_user, only: [:create, :update, :destroy, :index]
  skip_before_action :check_header, only: [:create, :update]

  def index
    frames = @current_user.frames
    render json: frames, meta: default_meta
  end

  def show
    render json: @frame, meta: default_meta
  end

  def create
    frame = Frame.new(frame_params)
    if frame.save
      render json: frame, status: :created, meta: default_meta
    else
      render_error(frame, :unprocessable_entity)
    end
  end

  def update
    if @frame.update_attributes(frame_params)
      render json: @frame, status: :ok, meta: default_meta
    else
      render_error(@frame, :unprocessable_entity)
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
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end