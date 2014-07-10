
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
    @genes = @search.genes(params[:gene_page])
    @drugs = @search.drugs(params[:drug_page])
    @diseases = @search.diseases(params[:disease_page])
  end

  private

  def user_params
    params[:search][:gene_fields] ||= []
    params[:search][:drug_fields] ||= []
    params[:search][:disease_fields] ||= []
    params.require(:search).permit(:gene_page, :disease_page, :drug_page, :keywords, gene_fields: [], drug_fields: [], disease_fields: [])
  end
end
