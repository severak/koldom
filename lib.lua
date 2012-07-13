function choice(ch)
  rows,cols=getwidth()
  locate(rows-#ch-1,1)
  for k,v in pairs(ch) do
    print(" ["..k.."] "..v)
  end
  key=""
  while (not ch[key]) do
    key=string.char(getkey())
  end
  return key
end

function asciiplay(f)
  cls()
  for l in io.lines(f) do
    if l=="*" then
      sleep(500)
      cls()
    elseif l=="**" then
      sleep(500)
    else
      print(l)
    end
  end
end

asciiplay("start.txt")

k=choice{
  ["a"]="A",
  ["b"]="B"
}
print(k)
