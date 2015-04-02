class Drug < ActiveRecord::Base
  establish_connection :pgx

  self.table_name = 'drug'

  alias_attribute :drugbank, :drugbankID
  alias_attribute :pharmgkb, :pharmGkbID

  include LinkData
  include ExportableToTsv
  include ServiceUrls

  has_many :drug_disease_links,
           foreign_key: 'id_obj1'
  has_many :diseases,
           -> { select('disease.*, link.isCurated, link.PMIDs').order('link.isCurated DESC') },
           through: :drug_disease_links,
           inverse_of: :drugs

  has_many :drug_gene_links,
           foreign_key: 'id_obj2'
  has_many :genes,
           -> { select('gene.*, link.isCurated, link.PMIDs').order('link.isCurated DESC') },
           through: :drug_gene_links,
           inverse_of: :drugs
end
