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
      t = Gene.arel_table

      r = t['gene_id'].eq(0)
      r = r.or(t[:name].matches("%#{keywords}%")) if f.include?('name')
      r = r.or(t[:description].matches("%#{keywords}%")) if f.include?('description')
      r = r.or(t[:uniprotKB].matches("%#{keywords}%")) if f.include?('uniprotKB')
      r = r.or(t[:entrezid].eq("#{keywords}")) if f.include?('entrezID')

      Gene.where(r)
          .paginate(page: page)
          .order(:gene_id)
    end
  end

  def find_drugs(page)
    f = YAML.load(drug_fields).select{|v| v != ''}
    if f.empty?
      Drug.none
    else
      t = Drug.arel_table

      r = t['drug_id'].eq(0)
      r = r.or(t[:name].matches("%#{keywords}%")) if f.include?('name')
      r = r.or(t[:drugbankID].matches("%#{keywords}%")) if f.include?('drugbankID')

      Drug.where(r)
          .paginate(page: page)
          .order(:drug_id)
    end
  end

  def find_diseases(page)
    f = YAML.load(disease_fields).select{|v| v != ''}
    if f.empty?
      Disease.none
    else
      t = Disease.arel_table

      r = t['disease_id'].eq(0)
      r = r.or(t[:name].matches("%#{keywords}%")) if f.include?('name')
      r = r.or(t[:alt_names].matches("%#{keywords}%")) if f.include?('alt_names')

      Disease.where(r)
             .paginate(page: page)
             .order(:disease_id)
    end
  end

end
