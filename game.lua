map={
  hriste={
    bck="txt/hriste.txt",
    exits={s="vratnice",j="vlecka"}
  },
  vlecka={
    bck="txt/vlecka.txt",
    action=function()
      subtitle("tady bysme nemeli zbytecne lizt....")
      subtitle("nebo nas neco prejede")
    end,
    exits={s="hriste"}
  },
  vratnice={
    bck="txt/vratnice.txt",
    exits={j="hriste",z="kolektiv"}
  },
  kolektiv={
    bck="txt/kolektiv.txt",
    exits={v="vratnice"}
  }
}

function start()
  cls()
  print("Koldom")
  print("-====-")
  v=choice{
    n="nova hra",
    p="pokracovat v ulozene",
    k="konec"
  }
  if v=="n" then
    game={place="hriste",visited={}}
    main(game)
  else
    print("konec")
  end
end

function intro()
  background("txt/intro.txt")
  pause()
  background("txt/porada.txt")
  sleep(1500)
  subtitle("Lucie: Tak co s tim udelame?")
  subtitle("Milan: A co s tim jako chces delat?")
  subtitle("Lucie: To je proste mily Watsone...")
  subtitle("Lucie: vysetrit to!")
end

function odejit(state)
  cls()
  local possible_dirs={s="sever",j="jih",v="vychod",z="zapad",d="dovnitr"}
  local ldirs={}
  local exits=map[state.place].exits
  for k,v in pairs(exits) do
    ldirs[k]=possible_dirs[k]  
  end
  ch=choice(ldirs)
  return exits[ch]    
end

function main(state)
  jedeme=1
  while(jedeme) do
    cls()
    background(map[state.place].bck)
    if type(map[state.place].action)=="function" then
      map[state.place].action()  
    end
    ch=choice{z="zkoumat",n="vzit",p="polozit",j="odejit",k="konec hry"}
    if ch=="j" then
      state.place=odejit(state)
    elseif ch=="k" then
      cls()
      print("Nashledanou!")
      jedeme=false
    end
  end
end