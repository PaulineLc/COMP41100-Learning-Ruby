class AdoptionController < ApplicationController
  def kittenlisting
  end

  def adopt
    @kitty_name = params[:cat]
  end
end
