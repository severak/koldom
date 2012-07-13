#include once "Lua/lua.bi"
#include once "Lua/lauxlib.bi"
#include once "Lua/lualib.bi"

function curses_cls cdecl (byval L as lua_State ptr) as integer
  cls
  curses_cls=0
end function

function curses_getkey cdecl (byval L as lua_State ptr) as integer
	lua_pushnumber(L,getkey)
	curses_getkey=1
end function

function curses_locate cdecl (byval L as lua_State ptr) as integer
	dim x as integer
	dim y as integer
	dim show as integer
	x=lua_tointeger(L,1)
	y=lua_tointeger(L,2)
	show=lua_toboolean(L,3)
	locate x,y,show
	curses_locate=0
end function

function curses_sleep cdecl (byval L as lua_State ptr) as integer
	dim ms as integer
	ms=lua_tointeger(L,1)
	sleep ms
	curses_sleep=0
end function

function plotcolor cdecl (byval L as lua_State ptr) as integer
  dim r as integer
  dim g as integer
  dim b as integer
  r=lua_tointeger(L,1)
  g=lua_tointeger(L,2)
  b=lua_tointeger(L,3)
  Color RGB(r,g,b)
  plotcolor=0
end function

function curses_csrlin cdecl (byval L as lua_State ptr) as integer
	lua_pushnumber(L,csrlin)
	curses_csrlin=1
end function

function curses_pos cdecl (byval L as lua_State ptr) as integer
	lua_pushnumber(L,pos)
	curses_pos=1
end function

function curses_getwidth cdecl (byval L as lua_State ptr) as integer
  Dim As Integer w
  w = Width
  lua_pushnumber(L,HiWord(w))
  lua_pushnumber(L,LoWord(w))
  curses_getwidth=2
end function

function curses_setwidth cdecl (byval L as lua_State ptr) as integer
  dim rows as integer
  dim cols as integer
  rows=lua_tointeger(L,1)
  cols=lua_tointeger(L,2)
  width rows,cols
  curses_setwidth=0
end function

dim L as lua_state ptr

L = lua_open( )
' load the base lua library (needed for 'print')
luaL_openlibs( L )
lua_register( L, "cls", @curses_cls )
lua_register( L, "getkey", @curses_getkey )
lua_register( L, "locate", @curses_locate )
lua_register( L, "sleep", @curses_sleep )
'lua_register( L, "color", @plotcolor )
lua_register( L, "csrlin", @curses_csrlin )
lua_register( L, "pos", @curses_pos )
lua_register( L, "getwidth", @curses_getwidth )
lua_register( L, "setwidth", @curses_setwidth )
luaL_dofile( L, "koldom.lua" )
lua_close( L )
sleep