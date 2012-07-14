function choice(ch)
  rows,cols=getwidth()
  cnt=0
  for k,v in pairs(ch) do
    cnt=cnt+1
  end
  li=rows-cnt-1
  for k,v in pairs(ch) do
    removeline(li)
    locate(li,1)
    print(" ["..k.."] "..v)
    li=li+1
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

function removeline(n)
  r,c=getwidth()
  locate(n,1)
  print(string.rep(" ",c))
end

function subtitle(text)
  r,c=getwidth()
  removeline(r-1)
  locate(r-1,2)
  print(text)
  sleep(2000)
end

function pause()
  r,c=getwidth()
  removeline(r)
  locate(r,1)
  print("stisknete cokoliv pro pokracovani...")
  getkey() 
end

function background(f)
  cls()
  for l in io.lines(f) do
    print(l)
  end
end

--asciiplay("start.txt")

--background("txt/afrika.txt")

--pause()

--subtitle("AA")
--subtitle("B")

--k=choice{["a"]="A",["b"]="B"}
--print(k)
