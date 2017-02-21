require "./hl1_mapgen/*"

module Hl1Mapgen
  puts "Half-Life 1 Terrain Generator v.#{VERSION} #{BRANCH}"
  mapfile = MapFile.new("enter your wads here", 10)
  output = mapfile.get_output
  puts "Output: #{output}"
end
