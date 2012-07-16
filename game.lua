map={
  hriste={
    bck="txt/afrika.txt",
    dirs={d="dovnitr na vratnici"},
    exits={d="vratnice"}
  },
  vratnice={
    bck="txt/vratnice.txt",
    dirs={v="ven"},
    exits={v="hriste"}
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
    cls()
    intro()
    game={place="hriste"}
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
  ch=choice(map[state.place].dirs)
  return map[state.place].exits[ch]    
end

function main(state)
  jedeme=1
  while(jedeme) do
    cls()
    background(map[state.place].bck)
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