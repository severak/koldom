mista={
  {bck=""}
}

function start()
  cls()
  background("txt/afrika.txt")
  v=choice{
    n="nova hra",
    p="pokracovat v ulozene",
    k="konec"
  }
  if v=="n" then
    cls()
    intro()
    main()
  else
    print("konec")
  end
end

function intro()  
end

function main()
  jedeme=1
  while(jedeme) do
    cls()
    ch=choice{z="zkoumat",n="vzit",p="polozit",j="odejit",k="konec hry"}
    if ch=="k" then
      jedeme=false
    end
  end
end