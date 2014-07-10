class Gene < ActiveRecord::Base
  establish_connection :pgx

  self.table_name = 'gene'
  self.per_page = 30

  include LinkData
  include ExportableToTsv

  has_many :drug_gene_links,
           foreign_key: 'id_obj1'
  has_many :drugs,
           -> { select('drug.*, link.isCurated, link.PMIDs').order('link.isCurated DESC') },
           through: :drug_gene_links,
           inverse_of: :genes

  has_many :disease_gene_links,
           foreign_key: 'id_obj1'
  has_many :diseases,
           -> { select('disease.*, link.isCurated, link.PMIDs').order('link.isCurated DESC') },
           through: :disease_gene_links,
           inverse_of: :genes
end
