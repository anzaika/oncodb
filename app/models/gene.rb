class Gene < ActiveRecord::Base
  establish_connection :pgx

  self.table_name = 'gene'

  # has_many :links, :foreign_key => 'id_obj1'
  # has_many :diseases, :through => :links

  # has_and_belongs_to_many :diseases,
  #   -> { where(id_link_type: 2)},
  #   :join_table => 'link',
  #   :foreign_key => 'id_obj1',
  #   :association_foreign_key => 'id_obj2'

  def diseases
    Disease.find_by_sql(
      %Q(
        SELECT disease.* FROM disease
        INNER JOIN link ON disease.disease_id = link.id_obj2
        WHERE link.id_link_type = 2 AND link.id_obj1 = #{self.gene_id}
      )
    )
  end
end
