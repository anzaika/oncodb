module SearchesHelper

  def diseases_smart_listing
    if filter = params['diseases_filter']
      t = Disease.arel_table

      r = t['disease_id'].eq(0)
      r = r.or(t[:name].matches("%#{filter}%"))
      r = r.or(t[:source].matches("%#{filter}%"))

      diseases_scope = Disease.where(r).order(:disease_id)
    else
      diseases_scope = Disease.all
    end

    @diseases = smart_listing_create(:diseases, diseases_scope, partial: "diseases/list")
  end

  def genes_smart_listing
    if filter = params['genes_filter']
      t = Gene.arel_table

      r = t['gene_id'].eq(0)
      r = r.or(t[:name].matches("%#{filter}%"))
      r = r.or(t[:description].matches("%#{filter}%"))
      r = r.or(t[:uniprotKB].matches("%#{filter}%"))
      r = r.or(t[:entrezid].eq("#{filter}"))

      genes_scope = Gene.where(r).order(:gene_id)
    else
      genes_scope = Gene.all
    end

    @genes = smart_listing_create(:genes, genes_scope, partial: "genes/list")
  end
end
