--pcall for error handling
function runit()
  dofile("lib.lua")
  dofile("game.lua")
  start()
end

ok,msg=pcall(runit)
if not ok then
  cls()
  print("ERROR!")
  print(msg)
end