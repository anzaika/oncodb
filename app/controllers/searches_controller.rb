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
    params[:search][:gene_fields] ||= []
    params[:search][:drug_fields] ||= []
    params[:search][:disease_fields] ||= []
    params.require(:search).permit(:keywords, gene_fields: [], drug_fields: [], disease_fields: [])
  end
end
