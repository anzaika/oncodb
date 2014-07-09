class Drug < ActiveRecord::Base
  establish_connection :pgx
  self.table_name = 'drug'
  self.per_page = 30

  def genes(page=1)
    sql = %Q(
      SELECT gene.*, link.pmids, link.isCurated FROM gene
      INNER JOIN link ON gene.gene_id = link.id_obj1
      WHERE link.id_link_type = 1 AND link.id_obj2 = #{self.drug_id}
    )
    Gene.paginate_by_sql(sql, page: page)
  end

  def diseases(page=1)
    sql = %Q(
      SELECT disease.*, link.pmids, link.isCurated FROM disease
      INNER JOIN link ON disease.disease_id = link.id_obj2
      WHERE link.id_link_type = 3 AND link.id_obj1 = #{self.drug_id}
    )
    Disease.paginate_by_sql(sql, page: page)
  end
end
