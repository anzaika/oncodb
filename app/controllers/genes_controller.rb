class GenesController < ApplicationController
  respond_to :json

  def index
    puts params.inspect
    if params[:query]
      q = "%#{params[:query]}%"
      puts q
      puts Gene.where('name like ?', q).to_sql
      respond_with Gene.where(
        'name like ? or description like ? or uniprotKB like ? or ensemblID like ?', q, q, q, q).first(100)
    else
      respond_with Gene.none
    end
  end

  private

  def gene_params
    params.require(:gene)
          .permit(:name,
                  :source,
                  :description,
                  :uniprotKB,
                  :ensemblID,
                  :entrezID,
                  :pharmGkbID,
                  :drugbankTargetID)
  end
end
