class CardsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @card = Card.find(params[:format])
  end
end
