class DiseasesController < ApplicationController
  before_action :set_disease, only: [:show, :edit, :update, :destroy]
  include SearchesHelper

  def index
    diseases_smart_listing
    # respond_to do |format|
    #   format.tsv {send_data @diseases.to_tsv}
    #   format.html @diseases
    # end
  end

  def show
    genes_smart_listing
  end

  private
    def set_disease
      @disease = Disease.find(params[:id])
    end

    def disease_params
      params.require(:disease).permit(:gene_page, :drug_page, :name, :alt_names, :source, :type, :pharmGkbID)
    end
end
