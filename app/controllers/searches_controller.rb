class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @search = Search.create!(user_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def user_params
    params.require(:search).permit(:keywords, :gene, :drug, :disease, :gene_fields, :drug_fields, :disease_fields)
  end


end
