class GeneSerializer < ActiveModel::Serializer
  attributes :id, :name, :source, :description

  attribute :uniprotKB, key: :uniprotkb
  attribute :ensemblID, key: :ensemblid
  attribute :entrezID, key: :entrezid
  attribute :pharmGkbID, key: :pharmgkbid
  attribute :drugbankTargetID, key: :drugbanktargetid
end
