class Gene < ActiveRecord::Base
  establish_connection :pgx

  self.table_name = 'gene'

  # def diseases
  #   Disease.find_by_sql(
  #     %Q(
  #       SELECT disease.* FROM disease
  #       INNER JOIN link ON disease.disease_id = link.id_obj2
  #       WHERE link.id_link_type = 2 AND link.id_obj1 = #{self.gene_id}
  #     )
  #   )
  # end
end
