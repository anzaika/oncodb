class DiseaseGeneLink < Link
  default_scope {where('id_link_type=2')}
  belongs_to :disease, foreign_key: 'id_obj2'
  belongs_to :gene, foreign_key: 'id_obj1'
end
