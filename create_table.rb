require 'csv'
require 'pg'

start = Time.now.to_i
conn = PG.connect(:dbname => 'realestate')
rows = CSV.read('opa_properties_public.csv')
columns = rows[0]
puts "Finished parsing #{rows.length} rows of CSV in #{Time.now.to_i - start} seconds"

create_table_query = columns.map do |c|
  c + ' varchar(100)'
end

create_table_query = create_table_query.join(', ')
create_table_query = 'CREATE TABLE properties(id INTEGER PRIMARY KEY, ' + create_table_query + ')'
conn.exec create_table_query
puts create_table_query
