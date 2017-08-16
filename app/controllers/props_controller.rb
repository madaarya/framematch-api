class PropsController < ApplicationController
  before_action :set_prop, only: [:show, :destroy]
  before_action :validate_user, only: [:create, :destroy, :index]
  skip_before_action :check_header, only: :create

  def index
    props = @current_user.props
    render json: props, meta: default_meta
  end

  def show
    render json: @prop, meta: default_meta
  end

  def create
    prop = Prop.new(prop_params)
    prop.user_id = @current_user.id
    if prop.save
      render json: prop, status: :created, meta: default_meta
    else
      render json: prop.errors
    end
  end

  def destroy
    @prop.destroy
    head 204
  end

  private

  def set_prop
    begin
      @prop = Prop.find params[:id]
    rescue ActiveRecord::RecordNotFound
      prop = Prop.new
      prop.errors.add(:id, "Wrong ID provided")
      render_error(prop, 404) and return
    end
  end

  def prop_params
    params.require(:prop).permit(:title, :prop)
  end
end
