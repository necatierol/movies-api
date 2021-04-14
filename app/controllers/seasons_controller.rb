class SeasonsController < ApplicationController
  before_action :set_content
  before_action :set_content_season, only: [:show, :update, :destroy]

  # GET /contents/:content_id/seasons
  def index
    json_response(@content.seasons)
  end

  # GET /contents/:content_id/seasons/:id
  def show
    json_response(@season)
  end

  # POST /contents/:content_id/seasons
  def create
    @content.seasons.create!(season_params)
    json_response(@content, :created)
  end

  # PUT /contents/:content_id/seasons/:id
  def update
    @season.update(season_params)
    head :no_content
  end

  # DELETE /contents/:content_id/seasons/:id
  def destroy
    @season.destroy
    head :no_content
  end

  private

  def season_params
    params.permit(:title)
  end

  def set_content
    @content = Content.find(params[:content_id])
  end

  def set_content_season
    @season = @content.seasons.find_by!(id: params[:id]) if @content
  end
end