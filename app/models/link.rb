class Link < ActiveRecord::Base
  establish_connection :pgx
  self.table_name = 'link'
  self.inheritance_column = nil
  self.primary_key = :id_link
end
