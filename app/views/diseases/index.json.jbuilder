json.array!(@diseases) do |disease|
  json.extract! disease, :id, :name, :alt_names, :pharmGkbID, :source, :type
  json.url disease_url(disease, format: :json)
end
