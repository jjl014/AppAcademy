require_relative "board"
require_relative "display"

b = Board.new
d = Display.new(b)
d.render

while true
  system("clear")
  d.render
  d.cursor.get_input
end
