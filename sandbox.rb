require 'csv'

puts 'Parsing CSV, please wait...'
ROWS = CSV.read('./opa_properties_public.csv')
puts 'Ready!'
