# @author anzaika@gmail.com
class GeneSearch
  def self.search(q)
    response = _search(q)
    if response
      records_by_id(response.hits.map(&:primary_key))
    else
      # Gene.where('gene_id > 0')
      Gene.none
    end
  end

  def self.search_for_disease(q, disease_id)
    genes = _search(q)
    if genes
      Disease.find(disease_id).genes.where('gene_id in (?)', genes)
    else
      Disease.find(disease_id).genes.where('gene_id > 0')
    end
  end

  def self.records_by_id(ids)
    Gene.where('gene_id in (?)', ids)
  end

  def self._search(q)
    if q && q.length > 1
      Gene.search do
        fulltext q
        paginate page: 1, per_page: 999_999
      end
    end
  end
end
