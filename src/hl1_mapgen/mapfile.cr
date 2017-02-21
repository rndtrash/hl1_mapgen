require "perlin_noise"

class MapFile

  def initialize(@wads : String, @height : Int32)
    p = PerlinNoise.new(rand(0..2147483647))
    p.height(0, 0, @height)
    puts p.noise(0, 1).to_s
  end

  def gen_header()
    "{\n\"classname\" \"worldspawn\"\n\"sounds\" \"1\"\n\"MaxRange\" \"32768\"\n\"newunit\" \"1\"\n\"scversion2\" \"510\"\n\"mapversion\" \"220\"\n\"wad\" \"#{@wads}\"\n"
  end

  def gen_blocks(x : Int32, y : Int32, size_x : Int32, size_y : Int32)
    "{\n( -64 64 64 ) ( 64 64 64 ) ( 64 -64 64 ) AAATRIGGER [ 1 0 0 0 ] [ 0 -1 0 0 ] 0 1 1 \n( -64 -64 -64 ) ( 64 -64 -64 ) ( 64 64 -64 ) AAATRIGGER [ 1 0 0 0 ] [ 0 -1 0 0 ] 0 1 1 \n( -64 64 64 ) ( -64 -64 64 ) ( -64 -64 -64 ) AAATRIGGER [ 0 1 0 0 ] [ 0 0 -1 0 ] 0 1 1 \n( 64 64 -64 ) ( 64 -64 -64 ) ( 64 -64 64 ) AAATRIGGER [ 0 1 0 0 ] [ 0 0 -1 0 ] 0 1 1 \n( 64 64 64 ) ( -64 64 64 ) ( -64 64 -64 ) AAATRIGGER [ 1 0 0 0 ] [ 0 0 -1 0 ] 0 1 1 \n( 64 -64 -64 ) ( -64 -64 -64 ) ( -64 -64 64 ) AAATRIGGER [ 1 0 0 0 ] [ 0 0 -1 0 ] 0 1 1 \n}"
  end

  def plc_entity(x : Int32, y : Int32, z : Int32, angle_x : Int32, angle_y : Int32, angle_z : Int32, entity : String)
    "{\n\"classname\" \"#{entity}\"\n\"angles\" \"#{angle_y} #{angle_x} #{angle_z}\"\n\"origin\" \"#{y} #{x} #{z}\"\n}"
  end

  def get_output()
    @output = "#{gen_header}\n#{gen_blocks(1, 1, 10, 10)}\n}\n#{plc_entity(128, -128, 48, 0, 0, 0, "info_player_deathmatch")}\n"
    @output
  end
end
