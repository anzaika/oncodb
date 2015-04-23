# @author anzaika@gmail.com
class DiseaseSearch
  def self.search(q, params)
    if q && q.length > 1
      s = Disease.search do
        fulltext q
        paginate page: 1, per_page: 999_999
      end
      records_by_id(s.hits.map(&:primary_key))
    else
      Disease.where('disease_id > 0')
    end
  end

  def self.records_by_id(ids)
    Disease.where('disease_id in (?)', ids)
  end
end
