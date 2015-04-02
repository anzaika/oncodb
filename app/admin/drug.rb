ActiveAdmin.register Drug do
  index do
    column :name do |d|
      link_to(d.name, admin_drug_path(d))
    end
    column :description
    column :source
    column 'genes' do |d|
      d.genes.all.size
    end
    column 'diseases' do |d|
      d.diseases.all.size
    end
    column 'drugbank' do |d|
      attr_link(:drugbank, d)
    end
    column 'pharmgkb' do |d|
      attr_link(:pharmgkb, d)
    end
  end

  filter :name
  filter :description

end
