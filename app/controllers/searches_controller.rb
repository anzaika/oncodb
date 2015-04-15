class SearchesController < ApplicationController
  include SearchesHelper

  def index
    diseases_smart_listing(params[:query])
    genes_smart_listing(params[:query])
    drugs_smart_listing(params[:query])
  end

  private

  def user_params
    params.require(:search).permit(:filter)
  end
end
