class DrugGeneLink < Link
  default_scope {where('id_link_type=1')}
  belongs_to :drug, foreign_key: 'id_obj2'
  belongs_to :gene, foreign_key: 'id_obj1'
end
