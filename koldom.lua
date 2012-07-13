--pcall for error handling
function runit()
  dofile("lib.lua")
end

ok,msg=pcall(runit)
if not ok then
  cls()
  print("ERROR!")
  print(msg)
end