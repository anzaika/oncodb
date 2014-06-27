class Search < ActiveRecord::Base
  def genes
    @genes ||= find_genes
  end

  def drugs
    @drugs ||= find_drugs
  end

  def diseases
    @diseases ||= find_diseases
  end

  private

  def find_genes
    f = YAML.load(gene_fields).select{|v| v != ''}
    if f.empty?
      Gene.none
    else
      q = Gene.order(:gene_id).limit(300)
      q = q.where("name like ?", "%#{keywords}%") if f.include?('name')
      q = q.where("description like ?", "%#{keywords}%") if f.include?('description')
      q = q.where("uniprotKB like ?", "%#{keywords}%") if f.include?('uniprotKB')
      q = q.where("entrezID like ?", "%#{keywords}%") if f.include?('entrezID')
      q
    end
  end

  def find_drugs
    f = YAML.load(drug_fields).select{|v| v != ''}
    if f.empty?
      Drug.none
    else
      q = Drug.order(:drug_id).limit(300)
      q = q.where("name like ?", "%#{keywords}%") if f.include?('name')
      q = q.where("drugbankID like ?", "%#{keywords}%") if f.include?('drugbankID')
      q
    end
  end

  def find_diseases
    f = YAML.load(disease_fields).select{|v| v != ''}
    if f.empty?
      Disease.none
    else
      q = Disease.order(:disease_id).limit(300)
      q = q.where("name like ?", "%#{keywords}%") if f.include?('name')
      q = q.where("alt_names like ?", "%#{keywords}%") if f.include?('alt_names')
      q
    end
  end

end
