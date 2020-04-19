class CardsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @card = Card.find(params[:id])
  end
end
