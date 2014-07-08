class Gene < ActiveRecord::Base
  establish_connection :pgx

  self.table_name = 'gene'

  def diseases
    Disease.find_by_sql(
      %Q(
        SELECT disease.*, link_curated.pmids, link_curated.isCurated FROM disease
        INNER JOIN link_curated ON disease.disease_id = link_curated.id_obj2
        WHERE link_curated.id_link_type = 2 AND link_curated.id_obj1 = #{self.gene_id}
      )
    )
  end

  def drugs
    Drug.find_by_sql(
      %Q(
        SELECT drug.*, link_curated.pmids, link_curated.isCurated FROM drug
        INNER JOIN link_curated ON drug.drug_id = link_curated.id_obj2
        WHERE link_curated.id_link_type = 1 AND link_curated.id_obj1 = #{self.gene_id}
      )
    )
  end
end
