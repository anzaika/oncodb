# @author anzaika@gmail.com
class DrugSearch
  def self.search(q)
    if q && q.length > 1
      s = Drug.search do
        fulltext q
        paginate page: 1, per_page: 999_999
      end
      records_by_id(s.hits.map(&:primary_key))
    else
      # Drug.where('drug_id > 0')
      Drug.none
    end
  end

  def self.records_by_id(ids)
    Drug.where('drug_id in (?)', ids)
  end
end
