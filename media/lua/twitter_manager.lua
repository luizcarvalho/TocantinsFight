dofile("luaxml/xml.lua")
dofile("luaxml/handler.lua")


local filename = "../data/tweets.xml"
local xmltext=""
local f,e = io.open(filename,"r")

if f then
	-- lê todo o conteúdo do arquivo
	-- *a = all (todo o arquivo)
	xmltext=f:read("*a")
else
	error(e)
end

-- Instancia o objeto que é responsável por armazenas o XML em forma de tabela lua
local xmlhandler = simpleTreeHandler()

-- xmltext é a string contendo o código XML
local xmlparser = xmlParser(xmlhandler)
-- aqui que a conversao do XML para table esta sendo feita de fato
xmlparser:parse(xmltext)

-- Xmlhandler.root é a raiz do XML

-- Imprime a tabela recursivamente automaticamente
--printable(xmlhandler.root)
function interface()
	canvas:attrFont("vera",32)	
	canvas:attrColor(255,255,255,255)
	--obtem as dimencoes do canvas atual
	local largura,altura = canvas:attrSize()
	--desenha um retangulo na tela toda, pois o nó lua ta com o tamanho da tela toda
	--MODO DE PREENCHUMENTO: fill preeche -- frame só desenha a borda
	canvas:drawRect("fill",0,0,largura,altura)
	canvas:attrColor(0,255,0,255)	
	canvas:drawText(10,10,"TESTE")
	canvas:flush();
end


function handler(evt)	
	if(evt.class=="ncl" and evt.type=="presentation" and evt.action=="start") then
		interface()
	end
end	




event.register(handler)