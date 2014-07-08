class Drug < ActiveRecord::Base
  establish_connection :pgx
  self.table_name = 'drug'
  self.per_page = 30

  def genes(page=1)
    sql = %Q(
      SELECT gene.*, link_curated.pmids, link_curated.isCurated FROM gene
      INNER JOIN link_curated ON gene.gene_id = link_curated.id_obj1
      WHERE link_curated.id_link_type = 1 AND link_curated.id_obj2 = #{self.drug_id}
    )
    Gene.paginate_by_sql(sql, page: page)
  end

  def diseases(page=1)
    sql = %Q(
      SELECT disease.*, link_curated.pmids, link_curated.isCurated FROM disease
      INNER JOIN link_curated ON disease.disease_id = link_curated.id_obj2
      WHERE link_curated.id_link_type = 3 AND link_curated.id_obj1 = #{self.drug_id}
    )
    Disease.paginate_by_sql(sql, page: page)
  end
end
