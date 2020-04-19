class BoosterSetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @booster_sets = BoosterSet.all
  end
end
