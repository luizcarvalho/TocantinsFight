local largura_canvas,altura_canvas = canvas:attrSize()
global_middle = largura_canvas/2
global_space = 20

function load_header()
	local header = canvas:new("../images/header.png")
	--centralizar
	local largura_header,altura_header = header:attrSize()
	
	local x_header = global_middle-largura_header/2
	local y_header = 0 --esquerda	
	canvas:compose(x_header,y_header,header)
end

function load_fight(posicao,lutador_esquerda,lutador_direita,horario)
	local luta_base = canvas:new("/images/luta.png")
	local largura_luta,altura_luta luta_base:attrSize()
	
end


function interface()
	local largura,altura = canvas:attrSize()
	load_header()
	canvas:flush();
end


function handler(evt)	
	if(evt.class=="ncl" and evt.type=="presentation" and evt.action=="start") then
		interface()
	end
end	




event.register(handler)