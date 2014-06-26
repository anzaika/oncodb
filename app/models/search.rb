class Search < ActiveRecord::Base
  def genes
    @genes ||= find_genes
  end

  private

  def find_genes
    g = Gene.order(:gene_id)
    g = g.where("description like ?", "%#{keywords}%") if keywords.present?
    g
  end

end
