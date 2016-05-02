module GenesHelper
  def arel_for_gene(_filter)
    # t = Gene.arel_table
    #
    # r = t['gene_id'].eq(0)
    # r = r.or(t[:name].matches("%#{filter}%"))
    # r = r.or(t[:description].matches("%#{filter}%"))
    # r = r.or(t[:uniprotKB].matches("%#{filter}%"))
    # r = r.or(t[:entrezid].eq("#{filter}"))

    # Gene.__elasticsearch__.search(query: { match: { name: 'filter' } }).records
    Gene.where('id = 2')
  end
end
