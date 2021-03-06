local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

local chatInputActive = false
local chatInputActivating = false
local chatHidden = true
local chatLoaded = false

RegisterNetEvent('chatMessage')
RegisterNetEvent('chat:addTemplate')
RegisterNetEvent('chat:addMessage')
RegisterNetEvent('chat:addSuggestion')
RegisterNetEvent('chat:addSuggestions')
RegisterNetEvent('chat:clear')
RegisterNetEvent('__cfx_internal:serverPrint')
RegisterNetEvent('_chat:messageEntered')

--RegisterNetEvent('chatMessageProximity')
--AddEventHandler('chatMessageProximity',function(id,name,firstname,message)
	--local myId = PlayerId()
	--local pid = GetPlayerFromServerId(id)
	--if pid == myId then
		--TriggerEvent('chatMessage',""..name.." "..firstname.." - ",{131,174,0},message)
	--elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)),GetEntityCoords(GetPlayerPed(pid))) < 10.999 then
		--TriggerEvent('chatMessage',""..name.." "..firstname.." - ",{131,174,0},message)
	--end
--end)

AddEventHandler('chatMessage', function(author, color, text)
	local args = { text }
	if author ~= "" then
		table.insert(args, 1, author)
	end
	SendNUIMessage({ type = 'ON_MESSAGE', message = { color = color, multiline = true, args = args } })
end)

AddEventHandler('__cfx_internal:serverPrint', function(msg)
	SendNUIMessage({ type = 'ON_MESSAGE', message = { templateId = 'print', multiline = true, args = { msg } } })
end)

AddEventHandler('chat:addMessage', function(message)
	SendNUIMessage({ type = 'ON_MESSAGE', message = message })
end)

--AddEventHandler('chat:addSuggestion', function(name, help, params)
	--SendNUIMessage({ type = 'ON_SUGGESTION_ADD', suggestion = { name = name, help = help, params = params or nil } })
--end)

AddEventHandler('chat:addSuggestion', function(name, help, params)
  SendNUIMessage({
    type = 'ON_SUGGESTION_ADD',
    suggestion = {
      name = name,
      help = help,
      params = params or nil
    }
  })
end)

AddEventHandler('chat:addSuggestions', function(suggestions)
	SendNUIMessage({ type = 'ON_SUGGESTION_ADD', suggestion = suggestion })
end)

AddEventHandler('chat:removeSuggestion', function(name)
	SendNUIMessage({ type = 'ON_SUGGESTION_REMOVE', name = name })
end)

AddEventHandler('chat:addTemplate', function(id, html)
	SendNUIMessage({ type = 'ON_TEMPLATE_ADD',template = { id = id, html = html } })
end)

AddEventHandler('chat:clear', function(name)
	SendNUIMessage({ type = 'ON_CLEAR' })
end)

RegisterNUICallback('chatResult', function(data, cb)
	chatInputActive = false
	SetNuiFocus(false)

	if not data.canceled then
		local id = PlayerId()
		local r, g, b = 0, 0x99, 255

		if data.message:sub(1, 1) == '/' then
			ExecuteCommand(data.message:sub(2))
		else
			TriggerServerEvent('_chat:messageEntered', GetPlayerName(id), { r, g, b }, data.message)
		end
	end

	cb('ok')
end)

local function refreshCommands()
  if GetRegisteredCommands then
    local registeredCommands = GetRegisteredCommands()

    local suggestions = {}

    for _, command in ipairs(registeredCommands) do
        if IsAceAllowed(('command.%s'):format(command.name)) then
            table.insert(suggestions, {
                name = '/' .. command.name,
                help = ''
            })
        end
    end

    TriggerEvent('chat:addSuggestions', suggestions)
  end
end

local function refreshThemes()
	local themes = {}

	for resIdx = 0, GetNumResources() - 1 do
		local resource = GetResourceByFindIndex(resIdx)

		if GetResourceState(resource) == 'started' then
			local numThemes = GetNumResourceMetadata(resource, 'chat_theme')

			if numThemes > 0 then
				local themeName = GetResourceMetadata(resource, 'chat_theme')
				local themeData = json.decode(GetResourceMetadata(resource, 'chat_theme_extra') or 'null')

				if themeName and themeData then
					themeData.baseUrl = 'nui://' .. resource .. '/'
					themes[themeName] = themeData
				end
			end
		end
	end
	SendNUIMessage({ type = 'ON_UPDATE_THEMES', themes = themes })
end

AddEventHandler('onClientResourceStart', function(resName)
  Wait(500)

  refreshCommands()
  refreshThemes()
end)

AddEventHandler('onClientResourceStop', function(resName)
  Wait(500)

  refreshCommands()
  refreshThemes()
end)

RegisterNUICallback('loaded', function(data, cb)
  TriggerServerEvent('chat:init');

  refreshCommands()
  refreshThemes()

  chatLoaded = true

  cb('ok')
end)

Citizen.CreateThread(function()
	SetTextChatEnabled(false)
	SetNuiFocus(false)

	while true do
		Citizen.Wait(1)
		if not chatInputActive then
			if IsControlPressed(0,245) then
				chatInputActive = true
				chatInputActivating = true

				SendNUIMessage({ type = 'ON_OPEN' })
			end
		end

		if chatInputActivating then
			if not IsControlPressed(0,245) then
				SetNuiFocus(true)
				chatInputActivating = false
			end
		end

		if chatLoaded then
			local shouldBeHidden = false

			if IsScreenFadedOut() or IsPauseMenuActive() then
				shouldBeHidden = true
			end

			if (shouldBeHidden and not chatHidden) or (not shouldBeHidden and chatHidden) then
				chatHidden = shouldBeHidden
				SendNUIMessage({ type = 'ON_SCREEN_STATE_CHANGE', shouldHide = shouldBeHidden })
			end
		end
	end
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/chamar', 'Executar um chamado.', {{ name="god",help="ADM."}})
    TriggerEvent('chat:addSuggestion', '/re', 'Para reanimar o paciente em coma.')
    TriggerEvent('chat:addSuggestion', '/tratamento', 'Para curar o paciente.')
	TriggerEvent('chat:addSuggestion', '/reanimar', 'Para reanimar americano.')
	TriggerEvent('chat:addSuggestion', '/cv', 'Para colocar dentro do ve??culo.')
	TriggerEvent('chat:addSuggestion', '/rv', 'Para tirar do ve??culo.')
	TriggerEvent('chat:addSuggestion', '/attachs', 'Para fazer melhorias no armamento.')
	TriggerEvent('chat:addSuggestion', '/id', 'Para ver o passaporte da pessoa.', {{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/revistar', 'Para revistar um civil.')
	TriggerEvent('chat:addSuggestion', '/apreender', 'Apreens??o de todos os itens.')
	TriggerEvent('chat:addSuggestion', '/prender', 'Envia um jogador para a pris??o.', {{ name="PASSAPORTE"},{ name="TEMPO"}})
	TriggerEvent('chat:addSuggestion', '/enviar', 'Envia dinheiro ao jogador mais pr??ximo.', {{ name="QUANTIA"}})
    TriggerEvent('chat:addSuggestion', '/placa', 'Mostra a placa do ve??culo mais pr??ximo.')
	TriggerEvent('chat:addSuggestion', '/multar', 'Aplicar multa no jogador destinado.')
	TriggerEvent('chat:addSuggestion', '/detido', 'Deixa o ve??culo na deten????o.')
	TriggerEvent('chat:addSuggestion', '/rmascara', 'Retirar a mascara da pessoa pr??xima.')
	TriggerEvent('chat:addSuggestion', '/rchapeu', 'Retirar o chap??u da pessoa pr??xima.')
	TriggerEvent('chat:addSuggestion', '/rcapuz', 'Retirar o capuz da pessoa pr??xima.')
	TriggerEvent('chat:addSuggestion', '/cone', 'Coloca um cone a sua frente.')
	TriggerEvent('chat:addSuggestion', '/procurado', 'Saber se voc?? est?? sendo procurado pela policia.')
	TriggerEvent('chat:addSuggestion', '/cone d', 'Retira um cone a sua frente.')
    TriggerEvent('chat:addSuggestion', '/barreira', 'Coloca uma barreira a sua frente.')
    TriggerEvent('chat:addSuggestion', '/barreira d', 'Retira uma barreira a sua frente.')
	TriggerEvent('chat:addSuggestion', '/spike', 'Coloca um espinho a sua frente.')
	TriggerEvent('chat:addSuggestion', '/spike d', 'Retira um espinho a sua frente.')
	TriggerEvent('chat:addSuggestion', '/reparar', 'Para reparar um ve??culo.')
	TriggerEvent('chat:addSuggestion', '/motor', 'Para reparar um motor.')
	TriggerEvent('chat:addSuggestion', '/malas', 'Para abrir/fechar o porta malas.')
	TriggerEvent('chat:addSuggestion', '/capo', 'Para abrir/fechar o capo.')
	TriggerEvent('chat:addSuggestion', '/portas', 'Para abrir/fechar as portas.')
	TriggerEvent('chat:addSuggestion', '/vidros', 'Abrir e fechar os vidros do ve??culo.')
	TriggerEvent('chat:addSuggestion', '/garmas', 'Para desequipar todas as armas do invent??rio.')
	TriggerEvent('chat:addSuggestion', '/gcolete', 'Para guarda o colete no invent??rio.')
	TriggerEvent('chat:addSuggestion', '/jcolete', 'Para jogar o colete danificado fora.')
	TriggerEvent('chat:addSuggestion', '/roubar', 'Para roubar um cidad??o pr??ximo.')
	TriggerEvent('chat:addSuggestion', '/sequestro', 'Coloca a pessoa no porta-malas.')
	TriggerEvent('chat:addSuggestion', '/sequestro2', 'Coloca o americano no porta-malas.')
	TriggerEvent('chat:addSuggestion', '/cloneplate', 'Clona a placa do ve??culo utilizado.')
	TriggerEvent('chat:addSuggestion', '/dv', 'Deleta um ve??culo mais pr??ximo.')
	TriggerEvent('chat:addSuggestion', '/fix', 'Reparar um ve??culo.')
	TriggerEvent('chat:addSuggestion', '/god', 'Reviver um jogador.', {{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/godall', 'Reviver todos os jogador.')
	TriggerEvent('chat:addSuggestion', '/arma', 'Pegar uma arma tempor??rio com base no, [wiki.rage.mp].')
    TriggerEvent('chat:addSuggestion', '/pon', 'Ver quais IDs est??o online.')
	TriggerEvent('chat:addSuggestion', '/unwl', 'Tirar da whitelist.', {{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/wl', 'Adicionar na whitelist.', {{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/kick', 'Kickar um jogador.', {{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/kickall', 'Kickar todos os jogadores.')
	TriggerEvent('chat:addSuggestion', '/ban', 'Banir um jogador.', {{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/unban', 'Desbanir um jogador.', {{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/nc', 'NoClip, fica invis??vel e atravessa paredes.')
    TriggerEvent('chat:addSuggestion', '/tpcds', 'Teleportar para uma cordenada.')
	TriggerEvent('chat:addSuggestion', '/cds', 'Pegar uma cordenada.')
	TriggerEvent('chat:addSuggestion', '/hud', 'Para voc?? desabilitar as hud.')
	TriggerEvent('chat:addSuggestion', '/som ligar', 'Para ligar o r??dio do ve??culo.')
	TriggerEvent('chat:addSuggestion', '/som musica', 'Para colocar o link de uma m??sica.')
	TriggerEvent('chat:addSuggestion', '/som desligar', 'Para desligar o r??dio do ve??culo.')
	TriggerEvent('chat:addSuggestion', '/som volume', 'Para alterar o volume da m??sica.')
	TriggerEvent('chat:addSuggestion', '/fps on', 'Para Otimizar o FPS.')
	TriggerEvent('chat:addSuggestion', '/fps off', 'Para desligar a Otimizacao de FPS.')
	TriggerEvent('chat:addSuggestion', '/vtuning', 'Ver a porcentagem do ve??culo.')
	TriggerEvent('chat:addSuggestion', '/group', 'Para colocar o jogador em algum grupo.', {{ name="PASSAPORTE"},{ name="GRUPO"}})
	TriggerEvent('chat:addSuggestion', '/ungroup', 'Para tirar o grupo de algum jogador.', {{ name="PASSAPORTE"},{ name="GRUPO"}})
	TriggerEvent('chat:addSuggestion', '/tptome', 'Puxar um jogador at?? voc??.', {{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/tpto', 'Ir at?? um jogador.', {{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/tpway', 'Teleporte para lugar do mapa marcado.')
	TriggerEvent('chat:addSuggestion', '/car', 'Criar um carro tempor??rio com base no, [wiki.rage.mp].', {{ name="VE??CULO"}})
	TriggerEvent('chat:addSuggestion', '/delnpcs', 'Deletar NPCs mais pr??ximos.')
	TriggerEvent('chat:addSuggestion', '/adm', 'Colocar an??ncio global, [ADM VERMELHO].')
	TriggerEvent('chat:addSuggestion', '/money', 'Pegar dinheiro.', {{ name="QUANTIDADE"}})
    TriggerEvent('chat:addSuggestion', '/e', 'Executa uma anima????o, [/e dancar]', {{ name="NOME DA ANIMA????O"}})
	TriggerEvent('chat:addSuggestion', '/e2', 'Executa uma anima????o no jogador mais pr??ximo.', {{ name="NOME DA ANIMA????O"}})
	TriggerEvent('chat:addSuggestion', '/addcar', 'Adicionar um ve??culo para o jogador.', {{ name="VE??CULOS"},{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/remcar', 'Remover um ve??culo para o jogador.', {{ name="VE??CULOS"},{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/carcolor', 'Alterar temporariamente a cor do ve??culo, usando tabela, [RGB].')
	TriggerEvent('chat:addSuggestion', '/limparinv', 'Limpar invent??rio de um jogador.', {{ name="PASSAPORTE"}})
    TriggerEvent('chat:addSuggestion', '/limpararea', 'Limpar area mais pr??xima.')
	TriggerEvent('chat:addSuggestion', '/colete', 'Dar colete para um jogador.', {{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/hash', 'Pegar hash de um ve??culo.')
	TriggerEvent('chat:addSuggestion', '/admin', 'Falar no chat como adimistrador.', {{ name="TEXTO"}})
	TriggerEvent('chat:addSuggestion', '/vroupas', 'Ver os IDs das roupas que esta vestido.')
	TriggerEvent('chat:addSuggestion', '/pack', 'Pegar caminho de entrega da carga do caminhoneiro.', {{ name="CARGA"  , help="ilha,GAS,CARS,WOODS,SHOW"}})
	TriggerEvent('chat:addSuggestion', '/cr', 'Travar/Destravar velecidade do ve??culo.', {{ name="VELECIDADE"}})
    TriggerEvent('chat:addSuggestion', '/me', 'Falar no pensamento.', {{ name="TEXTO"}})
	TriggerEvent('chat:addSuggestion', '/help', 'Abrir um ticket para staff.')
	TriggerEvent('chat:addSuggestion', '/cmec', 'Mandar mensagem na central da mec??nica.', {{ name="TEXTO"}})
	TriggerEvent('chat:addSuggestion', '/mr', 'Chat interno entre os mec??nicos.', {{ name="TEXTO"}})
	TriggerEvent('chat:addSuggestion', '/staff', 'Chat interno entre os staffs.', {{ name="TEXTO"}})
	TriggerEvent('chat:addSuggestion', '/pd', 'Chat interno entre os policiais.', {{ name="TEXTO"}})
	TriggerEvent('chat:addSuggestion', '/pr', 'Chat interno entre os paramedico.', {{ name="TEXTO"}})
    TriggerEvent('chat:addSuggestion', '/card', 'Mostrar uma carta para jogadores pr??ximos.')
	TriggerEvent('chat:addSuggestion', '/mascara', 'Trocar m??scara com base do [wiki.rage.mp], ?? necess??rio ter o item Roupas.')
	TriggerEvent('chat:addSuggestion', '/blusa', 'Trocar blusa com base do [wiki.rage.mp], ?? necess??rio ter o item Roupas.')
	TriggerEvent('chat:addSuggestion', '/jaqueta', 'Trocar jaqueta com base do [wiki.rage.mp], ?? necess??rio ter o item Roupas.')
	TriggerEvent('chat:addSuggestion', '/maos', 'Trocar m??o com base do [wiki.rage.mp], ?? necess??rio ter o item Roupas.')
	TriggerEvent('chat:addSuggestion', '/calca', 'Trocar cal??a com base do [wiki.rage.mp], ?? necess??rio ter o item Roupas.')
	TriggerEvent('chat:addSuggestion', '/acessorios', 'Trocar acess??rios com base do [wiki.rage.mp], ?? necess??rio ter o item Roupas.')
    TriggerEvent('chat:addSuggestion', '/sapatos', 'Trocar sapatos com base do [wiki.rage.mp], ?? necess??rio ter o item Roupas.')
    TriggerEvent('chat:addSuggestion', '/chapeu', 'Trocar chap??u com base do [wiki.rage.mp], ?? necess??rio ter o item Roupas.')
	TriggerEvent('chat:addSuggestion', '/oculos', 'Trocar oculos com base do [wiki.rage.mp], ?? necess??rio ter o item Roupas.')
	TriggerEvent('chat:addSuggestion', '/roupas', 'Para colocar uma roupa pre-setada.', {{ name="NOME"}})
	TriggerEvent('chat:addSuggestion', '/vehs', 'Para voc?? ver sua lista de ve??culos.')
	TriggerEvent('chat:addSuggestion', '/vehs', 'Para voc?? vender seu ve??culo para outra pessoa.', {{ name="NOME DO VE??CULO"},{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/item', 'Colocar um Item no seu Inventario.', {{ name="NOME"},{ name="QUANTIDADE"}})
	TriggerEvent('chat:addSuggestion', '/vporte', 'Para verificar se o jogador tem o porte.', {{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/mporte', 'Para verificar se vc tem Porte')
    TriggerEvent('chat:addSuggestion', '/rporte', 'Para remover o porte de um jogador.', {{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/carregar', 'Para carregar um jogador nas costas.')
	TriggerEvent('chat:addSuggestion', '/cavalinho', 'Para carregar um jogador como cavalinho.')
    TriggerEvent('chat:addSuggestion', '/prefem', 'Para pegar um jogador como ref??m.')
	TriggerEvent('chat:addSuggestion', '/anuncio', 'Fazer um anuncio para os jogadores.')
	TriggerEvent('chat:addSuggestion', '/entrar', 'Caso a casa esteja dispon??vel aparece o valor para comprar.')
	TriggerEvent('chat:addSuggestion', '/homes add', 'Adiciona a permiss??o da resid??ncia para o passaporte escolhido.', {{ name="RESID??NCIA"},{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/homes check', 'Mostra todas as permiss??es da resid??ncia.', {{ name="RESID??NCIA"}})
	TriggerEvent('chat:addSuggestion', '/homes transfer', 'Transfere a resid??ncia ao passaporte escolhido.', {{ name="RESID??NCIA"},{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/homes rem', 'Remove a permiss??o da resid??ncia do passaporte escolhido.', {{ name="RESID??NCIA"},{ name="PASSAPORTE"}})
	TriggerEvent('chat:addSuggestion', '/homes tax', 'Efetua o pagamento da Property Tax da resid??ncia.', {{ name="RESID??NCIA"}})
	TriggerEvent('chat:addSuggestion', '/homes garage', 'Permite a garagem por 50.000 d??lares.', {{ name="RESID??NCIA"},{ name="PASSAPORTE"}})
    TriggerEvent('chat:addSuggestion', '/homes list', 'Mostra no mapa todas as resid??ncias dispon??veis a venda na cidade.')
    TriggerEvent('chat:addSuggestion', '/outfit', 'Mostra todos os outfits.')
	TriggerEvent('chat:addSuggestion', '/outfit save', 'Para adicionar um outfit ao seu Guarda-Roupas.', {{ name="NOME"}})
	TriggerEvent('chat:addSuggestion', '/outfit rem', 'Para remover um outfit ao seu Guarda-Roupas.', {{ name="NOME"}})
	TriggerEvent('chat:addSuggestion', '/outfit apply', 'Para colocar um outfit do seu Guarda-Roupas.', {{ name="NOME"}})
	TriggerEvent('chat:addSuggestion', '/sair', 'Para sair da casa.')
	TriggerEvent('chat:addSuggestion', '/bau', 'Para acessar o ba?? da casa.')
	--TriggerEvent('chat:addSuggestion', '/chest', 'Para acessar o ba?? de uma organiza????o.')
	TriggerEvent('chat:addSuggestion', '/homem', 'Andar com um soar de homem.')
	TriggerEvent('chat:addSuggestion', '/mulher', 'Andar com um soar de mulher.')
	TriggerEvent('chat:addSuggestion', '/depressivo', 'Andar com um soar depressivo.')
	TriggerEvent('chat:addSuggestion', '/depressiva', 'Andar com um soar depressiva.')
	TriggerEvent('chat:addSuggestion', '/empresario', 'Andar com um soar empres??rio.')
	TriggerEvent('chat:addSuggestion', '/determinado', 'Andar com um soar determinado.')
	TriggerEvent('chat:addSuggestion', '/descontraido', 'Andar com um soar descontra??do.')
	TriggerEvent('chat:addSuggestion', '/farto', 'Andar com um soar farto.')
	TriggerEvent('chat:addSuggestion', '/estiloso', 'Andar com um soar estiloso.')
	TriggerEvent('chat:addSuggestion', '/ferido', 'Andar com um soar ferido.')
	TriggerEvent('chat:addSuggestion', '/arrogante', 'Andar com um soar arrogante.')
	TriggerEvent('chat:addSuggestion', '/nervoso', 'Andar com um soar nervoso.')
	TriggerEvent('chat:addSuggestion', '/desleixado', 'Andar com um soar desleixado.')
	TriggerEvent('chat:addSuggestion', '/infeliz', 'Andar com um soar infeliz.')
	TriggerEvent('chat:addSuggestion', '/musculoso', 'Andar com um soar musculoso.')
	TriggerEvent('chat:addSuggestion', '/desligado', 'Andar com um soar desligado.')
	TriggerEvent('chat:addSuggestion', '/fadiga', 'Andar com um soar fadiga.')
	TriggerEvent('chat:addSuggestion', '/apressado', 'Andar com um soar apressado.')
	TriggerEvent('chat:addSuggestion', '/descolado', 'Andar com um soar descolado.')
	TriggerEvent('chat:addSuggestion', '/bebado', 'Andar com um soar bebado.')
	TriggerEvent('chat:addSuggestion', '/bebado2', 'Andar com um soar bebado2.')
	TriggerEvent('chat:addSuggestion', '/bebado3', 'Andar com um soar bebado3.')
	TriggerEvent('chat:addSuggestion', '/irritado', 'Andar com um soar irritado.')
	TriggerEvent('chat:addSuggestion', '/intimidado', 'Andar com um soar intimidado.')
	TriggerEvent('chat:addSuggestion', '/poderosa', 'Andar com um soar poderosa.')
	TriggerEvent('chat:addSuggestion', '/chateado', 'Andar com um soar chateado.')
	TriggerEvent('chat:addSuggestion', '/estilosa', 'Andar com um soar estilosa.')
	TriggerEvent('chat:addSuggestion', '/sensual', 'Andar com um soar sensual.')
	TriggerEvent('chat:addSuggestion', '/corridinha', 'Fazer uma corridinha .')
	TriggerEvent('chat:addSuggestion', '/piriguete', 'Andar com um soar piriguete.')
	TriggerEvent('chat:addSuggestion', '/petulante', 'Andar com um soar petulante.')
end)