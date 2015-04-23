module SearchesHelper
  include DiseasesHelper
  include GenesHelper
  include DrugsHelper

  def simple_query(klass:, filter:, all: true)
    k = Object.const_get(klass.capitalize)

    if filter
      query = send("arel_for_#{klass}", filter)
      k.where(query)
    elsif all
      k.all
    else
      k.none
    end
  end

  def dependant_query(base_class:, base_id:, deps_class:, filter:)
    k = Object.const_get(base_class.capitalize)

    if filter
      query = send("arel_for_#{deps_class}", filter)
      k.find(base_id)
       .send(deps_class.pluralize)
       .where(query)
    else
      k.find(base_id)
       .send(deps_class.pluralize)
       .all
    end
  end


  def diseases_for_gene_smart_listing(filter, gene_id)
    diseases_scope =
      dependant_query(base_class: 'gene', base_id: gene_id, deps_class: 'disease', filter: filter)
    @diseases = smart_listing_create(:diseases, diseases_scope, partial: "diseases/list")
  end

  def diseases_for_drug_smart_listing(filter, drug_id)
    diseases_scope =
      dependant_query(base_class: 'drug', base_id: drug_id, deps_class: 'disease', filter: filter)
    @diseases = smart_listing_create(:diseases, diseases_scope, partial: "diseases/list")
  end

  def genes_for_disease_smart_listing(filter, disease_id)
    genes_scope = GeneSearch.search_for_disease(filter, disease_id)
    @genes = smart_listing_create(:genes, genes_scope, partial: "genes/list")
  end

  def diseases_smart_listing(query)
    diseases_scope = DiseaseSearch.search(query, params)
    @diseases = smart_listing_create(:diseases, diseases_scope, partial: "diseases/list")
  end

  def genes_smart_listing(query)
    genes_scope = GeneSearch.search(query)
    @genes = smart_listing_create(:genes, genes_scope, partial: "genes/list")
  end

  def drugs_smart_listing(query)
    drugs_scope = DrugSearch.search(query)
    @drugs = smart_listing_create(:drugs, drugs_scope, partial: "drugs/list")
  end
end
