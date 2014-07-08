class Search < ActiveRecord::Base
  def genes(page=1)
    @genes ||= find_genes(page)
  end

  def drugs(page=1)
    @drugs ||= find_drugs(page)
  end

  def diseases(page=1)
    @diseases ||= find_diseases(page)
  end

  private

  def find_genes(page)
    f = YAML.load(gene_fields).select{|v| v != ''}
    if f.empty?
      Gene.none
    else
      q = Gene.paginate(page: page).order(:gene_id)
      q = q.where("name like ?", "%#{keywords}%") if f.include?('name')
      q = q.where("description like ?", "%#{keywords}%") if f.include?('description')
      q = q.where("uniprotKB like ?", "%#{keywords}%") if f.include?('uniprotKB')
      q = q.where("entrezid = ?", "#{keywords}") if f.include?('entrezID')
      q
    end
  end

  def find_drugs(page)
    f = YAML.load(drug_fields).select{|v| v != ''}
    if f.empty?
      Drug.none
    else
      q = Drug.paginate(page: page).order(:drug_id).limit(300)
      q = q.where("name like ?", "%#{keywords}%") if f.include?('name')
      q = q.where("drugbankID like ?", "%#{keywords}%") if f.include?('drugbankID')
      q
    end
  end

  def find_diseases(page)
    f = YAML.load(disease_fields).select{|v| v != ''}
    if f.empty?
      Disease.none
    else
      q = Disease.paginate(page: page).order(:disease_id).limit(300)
      q = q.where("name like ?", "%#{keywords}%") if f.include?('name')
      q = q.where("alt_names like ?", "%#{keywords}%") if f.include?('alt_names')
      q
    end
  end

end
