class Disease < ActiveRecord::Base
  establish_connection :pgx

  self.table_name = 'disease'
  self.inheritance_column = nil

  def genes
    Gene.find_by_sql(
      %Q(
        SELECT gene.*, link_curated.pmids FROM gene
        INNER JOIN link_curated ON gene.gene_id = link_curated.id_obj1
        WHERE link_curated.id_link_type = 2 AND link_curated.id_obj2 = #{self.disease_id}
      )
    )
  end

  def drugs
    Drug.find_by_sql(
      %Q(
        SELECT drug.*, link_curated.pmids FROM drug
        INNER JOIN link_curated ON drug.drug_id = link_curated.id_obj1
        WHERE link_curated.id_link_type = 3 AND link_curated.id_obj2 = #{self.disease_id}
      )
    )
  end
end
