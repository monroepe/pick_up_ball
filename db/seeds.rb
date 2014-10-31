Hash.from_xml(File.read("nyc-courts.xml"))["basketball"]["facility"].inject({}) do |_result, elem|
  Location.create(name: elem["Name"], address: elem["Location"], city: "New York", state: "NY")
end
