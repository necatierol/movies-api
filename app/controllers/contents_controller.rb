class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :update, :destroy]

  # GET /contents
  def index
    @contents = Content.all
    json_response(@contents)
  end

  # POST /contents
  def create
    @content = Content.create!(content_params)
    json_response(@content, :created)
  end

  # GET /contents/:id
  def show
    json_response(@content)
  end

  # PUT /contents/:id
  def update
    @content.update(content_params)
    head :no_content
  end

  # DELETE /contents/:id
  def destroy
    @content.destroy
    head :no_content
  end

  private

  def content_params
    # whitelist params
    params.permit(:title, :description)
  end

  def set_content
    @content = Content.find(params[:id])
  end
end
