class BoosterPacksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    find_booster_packs
  end

  def show
    find_booster_packs
    @commons = @booster_packs.select{|rarity| rarity.card_rarity == "Common"}
    @rares = @booster_packs.select{|rarity| rarity.card_rarity == "Rare"}
    @extra = @booster_packs.reject{|rarity| rarity.card_rarity == "Rare"}
    @pack = []
    7.times do
      @pack << @commons.sample
    end
    @pack << @rares.sample
    @pack << @extra.sample
  end

  private

  def find_booster_packs
    @booster_packs = BoosterPack.where(booster_set_id: params[:booster_set_id]).sort
  end
end
