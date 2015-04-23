ActiveAdmin.register Disease do
  index do
    column :name do |d|
      link_to(d.name, admin_disease_path(d))
    end
    column :description
    column :source
  end

  filter :name
  filter :description

end
