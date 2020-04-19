class BoosterPacksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @booster_packs = BoosterPack.where(booster_set_id: params[:booster_set_id])
  end
end
