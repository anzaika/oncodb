class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.boolean :gene
      t.boolean :drug
      t.boolean :disease
      t.string :gene_fields
      t.string :drug_fields
      t.string :disease_fields

      t.timestamps
    end
  end
end
