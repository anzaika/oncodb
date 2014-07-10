require 'active_support/concern'

module ExportableToTsv
  extend ActiveSupport::Concern

  module ClassMethods
    def to_tsv
      CSV.generate(col_sep: "\t") do |csv|
        cols = self.column_names
        csv << cols + %W[ curated PMIDs ]
        all.each do |g|
          csv << g.attributes.values_at(*cols).append(g.curated?.to_s).append(g['PMIDs'])
        end
      end
    end
  end

end
