class DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :update, :destroy]
  include SearchesHelper

  def index
    drugs_smart_listing(params[:drugs_filter])
  end

  def show
    diseases_for_drug_smart_listing(params[:diseases_filter], @drug.id)
  end

  private
    def set_drug
      @drug = Drug.find(params[:id])
    end

    def drug_params
      params.require(:drugs).permit(:disease_page, :gene_page, :name, :description, :source, :drugbankID, :pharmGkbID, :fdaApproved)
    end
end
