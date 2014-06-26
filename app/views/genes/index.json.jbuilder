json.array!(@genes) do |gene|
  json.extract! gene, :id, :name, :source, :description, :uniprotKB, :ensemblID, :entrezID, :pharmGkbID, :drugbankTargetID
  json.url gene_url(gene, format: :json)
end
