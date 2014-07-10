require 'active_support/concern'

module LinkData
  extend ActiveSupport::Concern

  # link_data?
  def ld?
    self['isCurated']
  end

  def curated?
    self['isCurated'] == "\x01" ? true : false
  end

  def pmids
    val = self['PMIDs'].split(',')
    return nil if val.first.to_i == 0
    {
      ids:   val.first(3),
      count: val.size
    }
  end
end
