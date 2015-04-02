require 'active_support/concern'

module ServiceUrls
  extend ActiveSupport::Concern

  UNIPROT_URL  = 'http://www.uniprot.org/uniprot/'
  ENSEMBL_URL  = 'http://www.ensembl.org/Homo_sapiens/Gene/Summary?db=core;g='
  ENTREZ_URL   = 'http://www.ncbi.nlm.nih.gov/gene/?term='
  PHARMGKB_URL = 'http://www.pharmgkb.org/gene/'
  DRUGBANK_URL = 'http://www.drugbank.ca/drugs/'

  def uniprot_link
    link_for(:uniprot)
  end

  def ensembl_link
    link_for(:ensembl)
  end

  def entrez_link
    link_for(:entrez)
  end

  def pharmgkb_link
    link_for(:pharmgkb)
  end

  def drugbank_link
    link_for(:drugbank)
  end

  private

  def link_for(attr)
    if id = self.send(attr)
      ServiceUrls.const_get((attr.to_s+"_url").upcase)  + id
    else
      nil
    end
  end

end
