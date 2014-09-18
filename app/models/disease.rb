class Disease < ActiveRecord::Base
  establish_connection :pgx

  self.table_name = 'disease'
  self.inheritance_column = nil

  def genes
    Gene.find_by_sql(
      %Q(
        SELECT gene.* FROM gene
        INNER JOIN link ON gene.gene_id = link.id_obj1
        WHERE link.id_link_type = 2 AND link.id_obj2 = #{self.disease_id}
      )
    )
  end

  def drugs
    Drug.find_by_sql(
      %Q(
        SELECT drug.* FROM drug
        INNER JOIN link ON drug.drug_id = link.id_obj1
        WHERE link.id_link_type = 3 AND link.id_obj2 = #{self.disease_id}
      )
    )
  end
end
