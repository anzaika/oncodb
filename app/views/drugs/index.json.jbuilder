json.array!(@drugs) do |drug|
  json.extract! drug, :id, :name, :description, :drugbankID, :pharmGkbID, :fdaApproved, :source
  json.url drug_url(drug, format: :json)
end
