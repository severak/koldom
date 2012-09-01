function choice(ch)
  local rows,cols=getwidth()
  local li=rows-(#ch)-1
  local possible={}
  for _,v in pairs(ch) do
    removeline(li)
    locate(li,1)
    print(" ["..v[1].."] "..v[2])
    li=li+1
    possible[v[1]]=true
  end
  local key=""
  while (not possible[key]) do
    key=string.char(getkey())
  end
  return key
end

function oldchoice(ch)
	local choices={}
	for k,v in pairs(ch) do
		choices[#choices+1]={k,v}
	end
	return choice(choices)
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
  print(string.rep(" ",c-1))
end

function subtitle(text,int)
  sl=int or 3500
  r,c=getwidth()
  removeline(r-1)
  locate(r-1,2)
  print(text)
  sleep(sl)
end

function pause()
  r,c=getwidth()
  removeline(r-1)
  locate(r-1,1)
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
