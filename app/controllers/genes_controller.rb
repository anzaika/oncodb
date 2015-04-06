class GenesController < ApplicationController
  before_action :set_gene, only: [:show, :edit, :update, :destroy]
  include SearchesHelper

  def index
    genes_smart_listing(params[:genes_filter])
  end

  def show
    diseases_smart_listing(params[:diseases_filter])
  end


  private
    def set_gene
      @gene = Gene.find(params[:id])
    end

    def gene_params
      params.require(:gene).permit(:drug_page, :disease_page, :name, :source, :description, :uniprotKB, :ensemblID, :entrezID, :pharmGkbID, :drugbankTargetID)
    end
end
