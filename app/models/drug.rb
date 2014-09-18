class Drug < ActiveRecord::Base
  establish_connection :pgx
  self.table_name = 'drug'
end
