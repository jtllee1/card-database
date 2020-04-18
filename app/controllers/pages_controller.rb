class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @booster_sets = BoosterSet.all
  end
end
