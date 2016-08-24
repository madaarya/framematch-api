class SessionsController < ApplicationController
  def create
    data = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    user = User.where(username: data[:username]).first
    head 406 and return unless user
    if user.authenticate(data[:password])
      user.regenerate_token
      @current_user = user
      render json: user, status: :created, meta: default_meta, serializer: ActiveModel::Serializer::SessionSerializer and return
    end
    head 403
  end

  def destroy
    user = User.where(token: params[:id]).first
    head 404 and return unless user
    user.regenerate_token
    head 204
  end
end