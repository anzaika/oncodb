ActiveAdmin.register Gene do
  config.per_page = 10

  index do
    column 'name' do |g|
      link_to(g.name, admin_gene_path(g))
    end
    column :description
    column :source
    column 'drugs' do |g|
      g.drugs.all.size
    end
    column 'uniprot' do |g|
      attr_link(:uniprot, g)
    end
    column 'ensembl' do |g|
      attr_link(:ensembl, g)
    end
    column 'entrez' do |g|
      attr_link(:entrez, g)
    end
    column 'pharmgkb' do |g|
      attr_link(:pharmgkb, g)
    end
  end

  filter :name
  filter :description

  show do |gene|
    columns do

      column span: 1 do
        panel 'Description' do
          attributes_table_for gene do
            row :name
            row :description
            row :source
          end
        end

      end

      column span: 1 do

      end

    end

    panel 'Drugs: ' + gene.drugs.all.size.to_s do
      render partial: 'admin/drugs/table', locals: {gene: gene}
    end

    panel 'Diseases: ' + gene.diseases.all.size.to_s do
      render partial: 'admin/drugs/table', locals: {gene: gene}
    end

  end

end
