class Gene < ActiveRecord::Base
  establish_connection :pgx

  self.table_name = 'gene'
  self.per_page = 30

  def diseases(page=1)
    sql = %Q(
        SELECT disease.*, link.pmids, link.isCurated FROM disease
        INNER JOIN link ON disease.disease_id = link.id_obj2
        WHERE link.id_link_type = 2 AND link.id_obj1 = #{self.gene_id}
    )
    Disease.paginate_by_sql(sql, page: page)
  end

  def drugs(page=1)
    sql = %Q(
        SELECT drug.*, link.pmids, link.isCurated FROM drug
        INNER JOIN link ON drug.drug_id = link.id_obj2
        WHERE link.id_link_type = 1 AND link.id_obj1 = #{self.gene_id}
    )
    Drug.paginate_by_sql(sql, page: page)
  end
end
