class Drug < ActiveRecord::Base
  establish_connection :pgx
  self.table_name = 'drug'

  def genes
    Gene.find_by_sql(
      %Q(
        SELECT gene.*, link_curated.pmids, link_curated.isCurated FROM gene
        INNER JOIN link_curated ON gene.gene_id = link_curated.id_obj1
        WHERE link_curated.id_link_type = 1 AND link_curated.id_obj2 = #{self.drug_id}
      )
    )
  end

  def diseases
    Disease.find_by_sql(
      %Q(
        SELECT disease.*, link_curated.pmids, link_curated.isCurated FROM disease
        INNER JOIN link_curated ON disease.disease_id = link_curated.id_obj2
        WHERE link_curated.id_link_type = 3 AND link_curated.id_obj1 = #{self.drug_id}
      )
    )
  end
end
