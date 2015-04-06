module SearchesHelper
  include DiseasesHelper
  include GenesHelper

  def simple_query(klass:, filter:, all: true)
    k = Object.const_get(klass.capitalize)

    if filter
      query = send("arel_for_#{klass}", filter)
      k.where(query).order("#{klass}_id")
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

  def genes_for_disease_smart_listing(filter, disease_id)
    genes_scope =
      dependant_query(base_class: 'disease', base_id: disease_id, deps_class: 'gene', filter: filter)
    @genes = smart_listing_create(:genes, genes_scope, partial: "genes/list")
  end

  def diseases_smart_listing(query)
    diseases_scope = simple_query(klass: 'disease', filter: query)
    @diseases = smart_listing_create(:diseases, diseases_scope, partial: "diseases/list")
  end

  def genes_smart_listing(query)
    genes_scope = simple_query(klass: 'gene', filter: query)
    @genes = smart_listing_create(:genes, genes_scope, partial: "genes/list")
  end
end

