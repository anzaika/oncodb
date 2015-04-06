module SearchesHelper

  def query_diseases(filter, all: true)
    if filter
      t = Disease.arel_table

      r = t['disease_id'].eq(0)
      r = r.or(t[:name].matches("%#{filter}%"))
      r = r.or(t[:source].matches("%#{filter}%"))

       Disease.where(r).order(:disease_id)
    elsif all
      Disease.all
    else
      Disease.none
    end
  end

  def query_genes(filter, all: true)
    if filter
      t = Gene.arel_table

      r = t['gene_id'].eq(0)
      r = r.or(t[:name].matches("%#{filter}%"))
      r = r.or(t[:description].matches("%#{filter}%"))
      r = r.or(t[:uniprotKB].matches("%#{filter}%"))
      r = r.or(t[:entrezid].eq("#{filter}"))

      Gene.where(r).order(:gene_id)
    elsif all
      Gene.all
    else
      Gene.none
    end
  end

  def diseases_smart_listing(query)
    diseases_scope = query_diseases(query)
    @diseases = smart_listing_create(:diseases, diseases_scope, partial: "diseases/list")
  end

  def genes_smart_listing(query)
    genes_scope = query_genes(query)
    @genes = smart_listing_create(:genes, genes_scope, partial: "genes/list")
  end

  def link_for_object(o)
    path_helper = o.class.to_s.downcase+"_path"
    link_to(o.name, send(path_helper, o))
  end
end

