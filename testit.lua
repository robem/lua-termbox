tb = require "termbox"

if not tb.init() then 
  print("FAIL: tb_init")
  return 
end

cell = {}
cell.ch = ' '
cell.fg = tb.WHITE 
cell.bg = tb.GREEN

tb.change_cell(5,5,'X',tb.RED,tb.WHITE) -- no return val

tb.put_cell(3,2,cell)

cells = {}
repeat table.insert(cells, cell) until #cells == 10

tb.blit(0,7,10,1,cells) -- no return val

tb.present() -- no return val

t={}
repeat
  et=tb.peek_event(t,1000)
  if et==tb.EVENT_KEY then 
    tb.change_cell(5,5,'K',tb.WHITE,tb.YELLOW)
  elseif et==tb.EVENT_RESIZE then
    tb.change_cell(5,5,'R',tb.WHITE,tb.BLUE)
  else
    tb.change_cell(5,5,'X',tb.WHITE,tb.RED)
  end
  tb.present()

  if t.ch == 'q' then break end
until not et

-- wait for ANY event
tb.clear()
tb.present()
tb.poll_event(t)

tb.shutdown() -- no return val

