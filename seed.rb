require 'csv'
require 'pg'

start = Time.now.to_i
conn = PG.connect(:dbname => 'realestate')
rows = CSV.read('opa_properties_public.csv')
puts "Finished parsing #{rows.length} rows of CSV in #{Time.now.to_i - start} seconds"

start = Time.now.to_i

r = 1

while r < rows.length
  query = "INSERT INTO properties VALUES(#{r},"
  rows[r].each do |value|
    query += "'#{value.to_s.gsub("'",'').strip}',"
  end
  query = query[0..-2] + ')'

  conn.exec query
  r += 1
end

puts "Finished adding #{r} rows in #{Time.now.to_i - start} seconds"
