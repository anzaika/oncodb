class Disease < ActiveRecord::Base
  establish_connection :pgx

  self.table_name = 'disease'
  self.inheritance_column = nil
  self.per_page = 30

  def genes(page=1)
    sql = %Q(
      SELECT gene.*, link.pmids, link.isCurated FROM gene
      INNER JOIN link ON gene.gene_id = link.id_obj1
      WHERE link.id_link_type = 2 AND link.id_obj2 = #{self.disease_id}
    )
    Gene.paginate_by_sql(sql, page: page)
  end

  def drugs(page=1)
    sql = %Q(
      SELECT drug.*, link.pmids, link.isCurated FROM drug
      INNER JOIN link ON drug.drug_id = link.id_obj1
      WHERE link.id_link_type = 3 AND link.id_obj2 = #{self.disease_id}
    )
    Drug.paginate_by_sql(sql, page: page)
  end
end
