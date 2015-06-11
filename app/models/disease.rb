class Disease < ActiveRecord::Base
  establish_connection :pgx

  self.table_name = 'disease'
  self.inheritance_column = nil

  alias_attribute :pharmgkb, :pharmGkbID

  include LinkData
  include ExportableToTsv
  include ServiceUrls

  has_many :drug_disease_links,
           foreign_key: 'id_obj2'
  has_many :drugs,
           -> { select('drug.*, link.isCurated, link.PMIDs').order('link.isCurated DESC').order('fdaApproved DESC') },
           through: :drug_disease_links,
           inverse_of: :diseases

  has_many :disease_gene_links,
           foreign_key: 'id_obj2'
  has_many :genes,
           -> { select('gene.*, link.isCurated, link.PMIDs').order('link.isCurated DESC') },
           through: :disease_gene_links,
           inverse_of: :diseases
end
