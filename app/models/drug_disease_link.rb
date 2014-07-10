class DrugDiseaseLink < Link
  default_scope {where('id_link_type=3')}
  belongs_to :drug, foreign_key: 'id_obj1'
  belongs_to :disease, foreign_key: 'id_obj2'
end
