class MapFile
  def initialize(wads : String)
    @wads = wads
  end

  def gen_header()
    "\"wad\" \"#{@wads}\""
  end

  def gen_blocks(x : Int32, y : Int32, size_x : Int32, size_y : Int32)
    "coming soon"
  end

  def plc_entity(x : Int32, y : Int32, z : Int32, angle_x : Int32, angle_y : Int32, angle_z : Int32, entity : String)
    "{\n\"classname\" \"#{entity}\"\n\"angles\" \"#{angle_y} #{angle_x} #{angle_z}\"\n\"origin\" \"#{y} #{x} #{z}\"\n}"
  end

  def get_output()
    @output = "#{gen_header}\n#{plc_entity(128, -128, 48, 0, 0, 0, "info_player_deathmatch")}"
    @output
  end
end
