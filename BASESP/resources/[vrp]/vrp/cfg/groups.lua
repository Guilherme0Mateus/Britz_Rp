local cfg = {} --- BASE EVOLUTION MUITO IGUAL

cfg.groups = {
	["darixstore"] = { -- Pode mudar
		_config = {
			title = "Admin Super"--
		},
		"mindmaster.permissao",
		"admin.permissao",
		"addcar.permissao",
		"remcar.permissao",
		"money.permissao",
		"moderador.permissao",
		"nc.permissao",
		"tpway.permissao",
		"kick.permissao",
		"unwl.permissao",
		"mensagemadm.permissao",
		"dv.permissao",
		"wall.permissao",
		"car.permissao",
		"chamados.permissao",
		"krawk.permissao",  -- Pode mudar
		"wl.permissao"
	},
	["darixstorefolga"] = {  -- Pode mudar
		_config = {
			title = "Admin Super folga"--
		},
		"krawk.paisana"  -- Pode mudar
	},
	["admin"] = {
		_config = {
			title = "Admin"
		},
		"admin.permissao",
		"moderador.permissao",
		"nc.permissao",
		"tpway.permissao",
		"kick.permissao",
		"unwl.permissao",
		"mensagemadm.permissao",
		"dv.permissao",
		"car.permissao",
		"chamados.permissao",
		"admset.permissao",
		"wl.permissao"
	},
	["adminfolga"] = {
		_config = {
			title = "Admin Folga"
		},
		"ademiro.paisana"
	},
	["moderadorgeral"] = {
		_config = {
			title = "Moderador Geral"
		},
		"admin.permissao",
		"moderador.permissao",
		"nc.permissao",
		"tpway.permissao",
		"kick.permissao",
		"unwl.permissao",
		"mensagemadm.permissao",
		"dv.permissao",
		"car.permissao",
		"mdgrlset.permissao",
		"chamados.permissao",
		"wl.permissao"
	},
	["moderadorgeralfolga"] = {
		_config = {
			title = "Moderador Geral Folga"
		},
		"mdgrl.paisana"
	},
	["moderador"] = {
		_config = {
			title = "Moderador"
		},
		"moderador.permissao",
		"nc.permissao",
		"tpway.permissao",
		"kick.permissao",
		"unwl.permissao",
		"mensagemadm.permissao",
		"dv.permissao",
		"modset.permissao",
		"chamados.permissao",
		"wl.permissao"
	},
	["moderadorfolga"] = {
		_config = {
			title = "Moderador Folga"
		},
		"mod.paisana"
	},
	["suporte"] = {
		_config = {
			title = "Suporte"
		},
		"suporte.permissao",
		"nc.permissao",
		"tpway.permissao",
		"kick.permissao",
		"unwl.permissao",
		"mensagemadm.permissao",
		"dv.permissao",
		"chamados.permissao",
		"supset.permissao",
		"wl.permissao"
	},
	["suportefolga"] = {
		_config = {
			title = "Suporte Folga"
		},
		"sup.paisana"
	},
	["auxiliar"] = {
		_config = {
			title = "Auxiliar"
		},
		"nc.permissao",
		"mensagemadm.permissao",
		"wl.permissao",
		"unwl.permissao",
		"tpway.permissao",
		"dv.permissao",	
		"auxiliarset.permissao",	
		"chamados.permissao",
		"tpto.permissao"
	},
	------------------------STAFF
	["auxiliarfolga"] = {
		_config = {
			title = "Auxiliar folga"
		},
		"auxiliar.paisana"
	},
	--------------------------------------
	["ajudante"] = {
		_config = {
			title = "Ajudante"
		},
		"wl.permissao",
		"tpway.permissao",
		"estagiarioset.permissao",
		"nc.permissao"
	},
	----------------------- -STAFF
    ["ajudantefolga"] = {
		_config = {
			title = "Ajudante folga"
		},
		"estagiario.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Setagens Vips ]----------------------------------------------------------
	-----------------------------------------------------------------------------
	["prata"] = {
		_config = {
			title = "VIP - Prata",
			gtype = "vip"
		},
		"prata.paycheck",
		"mochila.permissao"
	},
	-----------------------------------------------------------------------------
	["ouro"] = {
		_config = {
			title = "VIP - Ouro",
			gtype = "vip"
		},
		"ouro.paycheck",
		"mochila.permissao"
	},
	-----------------------------------------------------------------------------
	["platina"] = {
		_config = {
			title = "VIP - Platina",
			gtype = "vip"
		},
		"dv.permissao",
		"platina.paycheck",
		"mochila.permissao"
	},
-----------------------------------------------------------------------------
	["permanente"] = {
		_config = {
			title = "VIP - Permanente",
			gtype = "vip"
		},
		"dv.permissao",
		"fix.permissao",
		"permanente.paycheck",
		"mochila.permissao"
	},
	-----------------------------------------------------------------------------
	["grande"] = {
		_config = {
			title = "VIP - Grande",
			gtype = "vip"
		},
		"dv.permissao",
		"insane.paycheck",
		"fix.permissao",
		"mochila.permissao"
	},
-----------------------------------------------------------------------------
	["megasuper"] = {
		_config = {
			title = "VIP - Mega Super",
			gtype = "vip"
		},
		"dv.permissao",
		"insanesuper.paycheck",
		"fix.permissao",
		"mochila.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Departamento de Justiça ]------------------------------------------------
	-----------------------------------------------------------------------------
	["juiz"] = {
		_config = {
			title = "Juiz(a)",
			gtype = "job"
		},
		"juiz.permissao",
		"juiz.paycheck"
	},
		["Desembargador"] = {
		_config = {
			title = "Desembargador (a)",
			gtype = "job"
		},
		"juiz.permissao",
		"juiz.paycheck"
	},
	["advogado"] = {
		_config = {
			title = "Advogado(a)",
			gtype = "job"
		},
		"advogado.permissao",
		"advogado.paycheck"
	},
	-----------------------------------------------------------------------------
	--[	Empregos Cidade ]--------------------------------------------------------
	-----------------------------------------------------------------------------
	["dononews"] = {
		_config = {
			title = "Dono News",
			gtype = "job"
		},
		"news.permissao",
		"chefenews.paycheck"
	},

	["dononews.paycheck"] = {
		_config = {
			title = "Dono News",
			gtype = "job"
		},
		"news.permissao",
		"insanenews.paycheck"
	},

	-----------------------------------------------------------------------------
	--[	Policia Militar ]--
	-----------------------------------------------------------------------------
	-----------------------------------------------------------------------------
	--[	Policia Militar ]--
	-----------------------------------------------------------------------------
	["recrutapmesp"] = {
		_config = {
			title = "Recruta - Policia Militar",
			gtype = "job"
		},
		"policia.permissao",
		"pmesp.permissao",
		"pmespbau.permissao",
		"recrutapmesp.paycheck",
		"recruta.permissao"
	},
	-----------------------------------------------------------------------------
	["paisanapmesprecruta"] = {
		_config = {
			title = "Policia Militar - Apaisana",
			gtype = "job"
		},
		"paisanarecrutapmesp.permissao"
	},
	-----------------------------------------------------------------------------
	["soldadopmesp"] = {
		_config = {
			title = "Soldado - Policia Militar",
			gtype = "job"
		},
		"policia.permissao",
		"pmespbau.permissao",
		"pmesp.permissao",
		"soldadopmesp.paycheck"
	},
	-----------------------------------------------------------------------------
	["soldadopmesp-apaisana"] = {
		_config = {
			title = "Policia Militar - Apaisana",
			gtype = "job"
		},
		"paisana-soldadopmesp.permissao"
	},
    -----------------------------------------------------------------------------
	["cabopmesp"] = {
		_config = {
			title = "Cabo - Policia Militar",
			gtype = "job"
		},
		"policia.permissao",
		"pmespbau.permissao",
		"pmesp.permissao",
		"cabopmesp.paycheck"
	},
	-----------------------------------------------------------------------------
	["cabopmesp-apaisana"] = {
		_config = {
			title = "Policia Militar - Apaisana",
			gtype = "job"
		},
		"paisana-cabopmesp.permissao"
	},
    -----------------------------------------------------------------------------
	["sargentopmesp"] = {
		_config = {
			title = "Sargento - Policia Militar",
			gtype = "job"
		},
		"policia.permissao",
		"pmespbau.permissao",
		"pmesp.permissao",
		"sargentopmesp.paycheck"
	},
	-----------------------------------------------------------------------------
	["sargentopmesp-apaisana"] = {
		_config = {
			title = "Policia Militar - Apaisana",
			gtype = "job"
		},
		"paisana-sargentopmesp.permissao"
	},
    -----------------------------------------------------------------------------
	["tenentepmesp"] = {
		_config = {
			title = "Tenente - Policia Militar",
			gtype = "job"
		},
		"policia.permissao",
		"pmespbau.permissao",
		"pmesp.permissao",
		"pmespsuperior.permissao",
		"tenentepmesp.paycheck"
	},
	-----------------------------------------------------------------------------
	["tenentepmesp-apaisana"] = {
		_config = {
			title = "Policia Militar - Apaisana",
			gtype = "job"
		},
		"paisana-tenentepmesp.permissao"
	},
    -----------------------------------------------------------------------------
	["capitaopmesp"] = {
		_config = {
			title = "Capitao - Policia Militar",
			gtype = "job"
		},
		"policia.permissao",
		"pmespbau.permissao",
		"pmesp.permissao",
		"pmespsuperior.permissao",
		"capitaopmesp.paycheck"
	},
	-----------------------------------------------------------------------------
	["capitaopmesp-apaisana"] = {
		_config = {
			title = "Policia Militar - Apaisana",
			gtype = "job"
		},
		"paisana-capitaopmesp.permissao"
	},
    -----------------------------------------------------------------------------
	["majorpmesp"] = {
		_config = {
			title = "Major - Policia Militar",
			gtype = "job"
		},
		"policia.permissao",
		"pmespbau.permissao",
		"pmesp.permissao",
		"pmespsuperior.permissao",
		"majorpmesp.paycheck"
	},
	-----------------------------------------------------------------------------
	["majorpmesp-apaisana"] = {
		_config = {
			title = "Policia Militar - Apaisana",
			gtype = "job"
		},
		"paisana-majorpmesp.permissao"
	},
    -----------------------------------------------------------------------------
	["tencoronelpmesp"] = {
		_config = {
			title = "Tenente Coronel - Policia Militar",
			gtype = "job"
		},
		"policia.permissao",
		"pmespbau.permissao",
		"pmesp.permissao",
		"pmespsuperior.permissao",
		"tencoronelpmesp.paycheck"
	},
	-----------------------------------------------------------------------------
	["tencoronelpmesp-apaisana"] = {
		_config = {
			title = "Policia Militar - Apaisana",
			gtype = "job"
		},
		"paisana-tenentecoronelpmesp.permissao"
	},
    -----------------------------------------------------------------------------
	["coronelpmesp"] = {
		_config = {
			title = "Coronel - Policia Militar",
			gtype = "job"
		},
		"policia.permissao",
		"pmesp.permissao",
		"pmespbau.permissao",
		"pmespsuperior.permissao",
		"coronelpmesp.paycheck"
	},
	-----------------------------------------------------------------------------
	["coronelpmesp-apaisana"] = {
		_config = {
			title = "Policia Militar - Apaisana",
			gtype = "job"
		},
		"paisana-coronelpmesp.permissao"
	},
    -----------------------------------------------------------------------------
	["comandantepmesp"] = {
		_config = {
			title = "Comandante - Policia Militar",
			gtype = "job"
		},
		"policia.permissao",
		"pmespbau.permissao",
		"pmesp.permissao",
		"pmespsuperior.permissao",
		"comandantepmesp.paycheck"
	},

	["comandantegeral"] = {
		_config = {
			title = "Comandante - GERAL",
			gtype = "job"
		},
		"policia.permissao",
		"pmespbau.permissao",
		"pmespsuperior.permissao",
		"comandantepmesp.paycheck"
	},

	["comandantegeral-apaisana"] = {
		_config = {
			title = "APAISANA - GERAL",
			gtype = "job"
		},
		"policia.permissao",
		"pmesp.permissao",
		"rota.permissao",
		"pmesp.permissao",
		"bope.permissao",
		"comandantepmesp.paycheck"
	},
	-----------------------------------------------------------------------------
	["comandantepmesp-apaisana"] = {
		_config = {
			title = "Policia Militar - Apaisana",
			gtype = "job"
		},
		"paisana-comandantepmesp.permissao"
	},
    -----------------------------------------------------------------------------
	-----------------------------------------------------------------------------
	--[	RONDAS OSTENSIVAS ]
	-----------------------------------------------------------------------------
	["soldadorota"] = {
		_config = {
			title = "Soldado - Rondas Ostensivas",
			gtype = "job"
		},
		"policia.permissao",
		"rota.permissao",
		"soldadorota.paycheck"
	},
	-----------------------------------------------------------------------------
	["soldadorota-apaisana"] = {
		_config = {
			title = "Rondas Ostensivas - Apaisana",
			gtype = "job"
		},
		"paisanasoldadorota.permissao"
	},
	-----------------------------------------------------------------------------
    ["caborota"] = {
		_config = {
			title = "Cabo - Rondas Ostensivas",
			gtype = "job"
		},
		"policia.permissao",
		"rota.permissao",
		"caborota.paycheck"
	},
	-----------------------------------------------------------------------------
	["caborota-apaisana"] = {
		_config = {
			title = "Rondas Ostensivas - Apaisana",
			gtype = "job"
		},
		"paisana-caborota.permissao"
	},
    -----------------------------------------------------------------------------
	["sargentorota"] = {
		_config = {
			title = "Sargento - Rondas Ostensivas",
			gtype = "job"
		},
		"policia.permissao",
		"rota.permissao",
		"sargentorota.paycheck"
	},
	-----------------------------------------------------------------------------
	["sargentorota-apaisana"] = {
		_config = {
			title = "Rondas Ostensivas - Apaisana",
			gtype = "job"
		},
		"paisana-sargentorota.permissao"
	},
    -----------------------------------------------------------------------------
	["tenenterota"] = {
		_config = {
			title = "Tenente - Rondas Ostensivas",
			gtype = "job"
		},
		"policia.permissao",
		"rota.permissao",
		"tenenterota.paycheck"
	},
	-----------------------------------------------------------------------------
	["tenenterota-apaisana"] = {
		_config = {
			title = "Rondas Ostensivas - Apaisana",
			gtype = "job"
		},
		"paisana-tenenterota.permissao"
	},
    -----------------------------------------------------------------------------
	["capitaorota"] = {
		_config = {
			title = "Capitao - Rondas Ostensivas",
			gtype = "job"
		},
		"policia.permissao",
		"rota.permissao",
		"capitaorota.paycheck"
	},
	-----------------------------------------------------------------------------
	["capitaorota-apaisana"] = {
		_config = {
			title = "Rondas Ostensivas - Apaisana",
			gtype = "job"
		},
		"paisana-capitaorota.permissao"
	},
    -----------------------------------------------------------------------------
	["majorrota"] = {
		_config = {
			title = "Major - Rondas Ostensivas",
			gtype = "job"
		},
		"policia.permissao",
		"rota.permissao",
		"majorrota.paycheck"
	},
	-----------------------------------------------------------------------------
	["majorrota-apaisana"] = {
		_config = {
			title = "Rondas Ostensivas - Apaisana",
			gtype = "job"
		},
		"paisana-majorrota.permissao"
	},
    -----------------------------------------------------------------------------
	["tencoronelrota"] = {
		_config = {
			title = "Tenente Coronel - Rondas Ostensivas",
			gtype = "job"
		},
		"policia.permissao",
		"rota.permissao",
		"tencoronelrota.paycheck"
	},
	-----------------------------------------------------------------------------
	["tencoronelrota-apaisana"] = {
		_config = {
			title = "Rondas Ostensivas - Apaisana",
			gtype = "job"
		},
		"paisana-tencoronelrota.permissao"
	},
    -----------------------------------------------------------------------------
	["coronelrota"] = {
		_config = {
			title = "Coronel - Rondas Ostensivas",
			gtype = "job"
		},
		"policia.permissao",
		"rota.permissao",
		"coronelrota.paycheck"
	},
	-----------------------------------------------------------------------------
	["coronelrota-apaisana"] = {
		_config = {
			title = "Rondas Ostensivas - Apaisana",
			gtype = "job"
		},
		"paisana-coronelrota.permissao"
	},
    -----------------------------------------------------------------------------
	["comandanterota"] = {
		_config = {
			title = "Comandante - Rondas Ostensivas",
			gtype = "job"
		},
		"policia.permissao",
		"rota.permissao",
		"comandanterota.paycheck"
	},
	-----------------------------------------------------------------------------
	["comandanterota-apaisana"] = {
		_config = {
			title = "Rondas Ostensivas - Apaisana",
			gtype = "job"
		},
		"paisana-comandanterota.permissao"
	},
	-----------------------------------------------------------------------------
	--[	ft ]
	-----------------------------------------------------------------------------
--[[	["soldadoft"] = {
		_config = {
			title = "Soldado - FT",
			gtype = "job"
		},
		"policia.permissao",  
		"bope.permissao",
		"soldadoft.paycheck"
	},
	-----------------------------------------------------------------------------
	["soldadoft-apaisana"] = {
		_config = {
			title = "FT - Apaisana",
			gtype = "job"
		},
		"paisanasoldadobope.permissao"
	},
	-----------------------------------------------------------------------------
    ["caboft"] = {
		_config = {
			title = "Cabo - FT",
			gtype = "job"
		},
		"policia.permissao",
		"bope.permissao",
		"caboft.paycheck"
	},
	-----------------------------------------------------------------------------
	["caboft-apaisana"] = {
		_config = {
			title = "FT - Apaisana",
			gtype = "job"
		},
		"paisana-cabobope.permissao"
	},
    -----------------------------------------------------------------------------
	["sargentoft"] = {
		_config = {
			title = "Sargento - FT",
			gtype = "job"
		},
		"policia.permissao",
		"bope.permissao",
		"sargentoft.paycheck"
	},
	-----------------------------------------------------------------------------
	["sargentoft-apaisana"] = {
		_config = {
			title = "FT - Apaisana",
			gtype = "job"
		},
		"paisana-sargentobope.permissao"
	},
    -----------------------------------------------------------------------------
	["tenenteft"] = {
		_config = {
			title = "Tenente - FT",
			gtype = "job"
		},
		"policia.permissao",
		"bope.permissao",
		"tenenteft.paycheck"
	},
	-----------------------------------------------------------------------------
	["tenenteft-apaisana"] = {
		_config = {
			title = "FT - Apaisana",
			gtype = "job"
		},
		"paisana-tenentebope.permissao"
	},
    -----------------------------------------------------------------------------
	["capitaoft"] = {
		_config = {
			title = "Capitao - FT",
			gtype = "job"
		},
		"policia.permissao",
		"bope.permissao",
		"capitaoft.paycheck"
	},
	-----------------------------------------------------------------------------
	["capitaoft-apaisana"] = {
		_config = {
			title = "FT - Apaisana",
			gtype = "job"
		},
		"paisana-capitaobope.permissao"
	},
    -----------------------------------------------------------------------------
	["majorft"] = {
		_config = {
			title = "Major - FT",
			gtype = "job"
		},
		"policia.permissao",
		"bope.permissao",
		"majorft.paycheck"
	},
	-----------------------------------------------------------------------------
	["majorft-apaisana"] = {
		_config = {
			title = "FT - Apaisana",
			gtype = "job"
		},
		"paisana-majorbope.permissao"
	},
    -----------------------------------------------------------------------------
	["tencoronelft"] = {
		_config = {
			title = "Tenente Coronel - FT",
			gtype = "job"
		},
		"policia.permissao",
		"bope.permissao",
		"tencoronelft.paycheck"
	},
	-----------------------------------------------------------------------------
	["tencoronelft-apaisana"] = {
		_config = {
			title = "FT - Apaisana",
			gtype = "job"
		},
		"paisana-tencoronelbope.permissao"
	},
    -----------------------------------------------------------------------------
	["coronelft"] = {
		_config = {
			title = "Coronel - FT",
			gtype = "job"
		},
		"policia.permissao",
		"bope.permissao",
		"coronelft.paycheck"
	},
	-----------------------------------------------------------------------------
	["coronelft-apaisana"] = {
		_config = {
			title = "FT - Apaisana",
			gtype = "job"
		},
		"paisana-coronelbope.permissao"
	},
    -----------------------------------------------------------------------------
	["comandanteft"] = {
		_config = {
			title = "Comandante - FT",
			gtype = "job"
		},
		"policia.permissao",
		"bope.permissao",
		"comandanteft.paycheck"
	},
	-----------------------------------------------------------------------------
	["comandanteft-apaisana"] = {
		_config = {
			title = "FT - Apaisana",
			gtype = "job"
		},
		"paisana-comandantebope.permissao"
	},]]
	-----------------------------------------------------------------------------
	-----------------------------------------------------------------------------
	--[ Policia Civil]
	-----------------------------------------------------------------------------
	["agentepc"] = {
			_config = {
				title = "Agente - Policia Civil",
				gtype = "job"
			},
			"policia.permissao",
			"agentepc.paycheck",
			"agentepai.paycheck",
			"pcivil.permissao"
		},
	["agente-apaisana"] = {
			_config = {
				title = "Policia Civil - Apaisana",
				gtype = "job"
			},
			"agenteapaisana.permissao"
		},
		-----------------------------------------------------------------------------
	["investigadorpc"] = {
			_config = {
				title = "Investigador - Policia Civil",
				gtype = "job"
			},
			"policia.permissao",
			"investigador.paycheck",
			"investigadorpai.permissao",
			"pcivil.permissao",
			"investigador.paycheck"
		},
		-----------------------------------------------------------------------------
	["investigador-apaisana"] = {
			_config = {
				title = "Policia Civil - Apaisana",
				gtype = "job"
			},
			"investigadorpaisana.permissao"
		},
		-----------------------------------------------------------------------------
	["delegadopc"] = {
			_config = {
				title = "Delegado - Policia Civil",
				gtype = "job"
			},
			"policia.permissao",
			"delegado.paycheck",
			"delegadopai.permissao",
			"pcivil.permissao"
		},
		-----------------------------------------------------------------------------
	["delegado-apaisana"] = {
			_config = {
				title = "Policia Civil - Apaisana",
				gtype = "job"
			},
			"delegadopcivil.permissao"
		},
	-----------------------------------------------------------------------------
	--[ Policia Civil]
	-----------------------------------------------------------------------------
	["agentepf"] = {
			_config = {
				title = "Agente - Policia Federal",
				gtype = "job"
			},
			"policia.permissao",
			"agentepf.paycheck",
			"agentepai.paycheck",
			"federal.permissao"
		},
	["agentepf-apaisana"] = {
			_config = {
				title = "Policia Federal - Apaisana",
				gtype = "job"
			},
			"agenteapaisanafederal.permissao"
		},
		-----------------------------------------------------------------------------
	["investigadorpf"] = {
			_config = {
				title = "Investigador - Policia Federal",
				gtype = "job"
			},
			"policia.permissao",
			"investigadorpf.paycheck",
			"investigadorpai.permissao",
			"federal.permissao",
			"investigador.paycheck"
		},
		-----------------------------------------------------------------------------
	["investigadorpf-apaisana"] = {
			_config = {
				title = "Policia Federal - Apaisana",
				gtype = "job"
			},
			"investigadorapaisanafederal.permissao"
		},
		-----------------------------------------------------------------------------
	["delegadopf"] = {
			_config = {
				title = "Delegado - Policia Federal",
				gtype = "job"
			},
			"policia.permissao",
			"delegadopf.paycheck",
			"delegadopai.permissao",
			"federal.permissao"
		},
		-----------------------------------------------------------------------------
	["delegadopf-apaisana"] = {
			_config = {
				title = "Policia Federal - Apaisana",
				gtype = "job"
			},
			"delegadoapaisanafederal.permissao"
		},
	-----------------------------------------------------------------------------
	--[	Hospital PARAMEDICO ]----------------------------------------------------
	-----------------------------------------------------------------------------
	["enfermeirosamu"] = {
		_config = {
			title = "Enfermeiro - Samu",
			gtype = "job"
		},
		"paramedico.permissao",
		"portahospital.permissao",
		"enfermeiro.paycheck"
	}, 
    -----------------------------------------------------------------------------
	["enfermeiropaisana"] = {
		_config = {
			title = "Enfermeiro - Folga",
			gtype = "job"
		},
		"paisana-enfermeiro.permissao"
	},
    -----------------------------------------------------------------------------
	["paramedicosamu"] = {
		_config = {
			title = "Paramedico - Samu",
			gtype = "job"
		},
		"paramedico.permissao",
		"portahospital.permissao",
		"paramedico.paycheck"
	}, 
    -----------------------------------------------------------------------------
	["paramedico-paisana"] = {
		_config = {
			title = "Paramedico - Folga",
			gtype = "job"
		},
		"paisana-paramedico.permissao"
	},
    -----------------------------------------------------------------------------
	["medicosamu"] = {
		_config = {
			title = "Medico - Samu",
			gtype = "job"
		},
		"paramedico.permissao",
		"portahospital.permissao",
		"medico.paycheck"
	}, 
    -----------------------------------------------------------------------------
	["medicosamu-paisana"] = {
		_config = {
			title = "Medico - Folga",
			gtype = "job"
		},
		"paisana-medico.permissao"
	},
    -----------------------------------------------------------------------------
	["psicologosamu"] = {
		_config = {
			title = "Psicologo - Samu",
			gtype = "job"
		},
		"paramedico.permissao",
		"portahospital.permissao",
		"psicologo.paycheck"
	}, 
    -----------------------------------------------------------------------------
	["psicologo-paisana"] = {
		_config = {
			title = "Psicologo - Folga",
			gtype = "job"
		},
		"paisana-psicologo.permissao"
	},
    -----------------------------------------------------------------------------
	["subdiretorsamu"] = {
		_config = {
			title = "Subdiretor - Samu",
			gtype = "job"
		},
		"paramedico.permissao",
		"portahospital.permissao",
		"subdiretor.paycheck"
	}, 
    -----------------------------------------------------------------------------
	["subdiretor-paisana"] = {
		_config = {
			title = "Subdiretor - Folga",
			gtype = "job"
		},
		"paisana-subdiretor.permissao"
	},
    -----------------------------------------------------------------------------
	["diretorsamu"] = {
		_config = {
			title = "Diretor - Samu",
			gtype = "job"
		},
		"paramedico.permissao",
		"portahospital.permissao",
		"diretor.paycheck"
	}, 
    -----------------------------------------------------------------------------
	["diretor-paisana"] = {
		_config = {
			title = "Diretor - Folga",
			gtype = "job"
		},
		"paisana-diretor.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Bennys ]
	-----------------------------------------------------------------------------
	["donomec"] = {
		_config = {
			title = "Dono Mecânico",
			gtype = "job"
		},
		"mecanico.permissao",
		"donomec.paycheck",
		"chefebennys.permissao",
		"bennys.permissao"
	},
	-----------------------------------------------------------------------------
	["gerentemec"] = {
		_config = {
			title = "Gerente Mecânico",
			gtype = "job"
		},
		"mecanico.permissao",
		"gerentemec.paycheck",
		"gerentebennys.permissao",
		"bennys.permissao"
	},
	-----------------------------------------------------------------------------
	["mec"] = {
		_config = {
			title = "Funcionario - Mecânico",
			gtype = "job"
		},
		"mecanico.permissao",
		"mec.paycheck",
		"bennys.permissao"
	},
-----------------------------------------------------------------------------
	["donomecfolga"] = {
		_config = {
			title = "Mecânico de folga",
			gtype = "job"
		},
		"paisana-chefebennys.permissao"
	},
-----------------------------------------------------------------------------
	["gerentemecfolga"] = {
		_config = {
			title = "Mecânico de folga",
			gtype = "job"
		},
		"paisana-gerentebennys.permissao"
	},
-----------------------------------------------------------------------------
	["mecfolga"] = {
		_config = {
			title = "Mecânico de folga",
			gtype = "job"
		},
		"paisana-bennys.permissao"
	},
-----------------------------------------------------------------------------
	----------------------------TAXI
	-----------------------------------------------------------------------------
--[[  	["chefetaxi"] = {
		_config = {
			title = "Chefe - Taxista",
			gtype = "job",
		},
		"chefetaxi.permissao",
		"taxi.permissao"
	},

	["chefetaxi-paisana"] = {
		_config = {
			title = "Apaisana - Taxista",
			gtype = "job",
		},
		"chefetaxi.paisana"
	},
---------------------------------------------------------------------------------------
	["gerentetaxi"] = {
		_config = {
			title = "Gerente - Taxista",
			gtype = "job",
		},
		"gerentetaxi.permissao",
		"taxi.permissao"
	},

	["gerentetaxi-paisana"] = {
		_config = {
			title = "Apaisana - Taxista",
			gtype = "job",
		},
		"gerentetaxi.paisana"
	},
---------------------------------------------------------------------------------------
	["taxi"] = {
		_config = {
			title = "Membro - Taxista",
			gtype = "job",
		},
		"taxista.permissao",
		"taxi.permissao"
	},

	["taxi-paisana"] = {
		_config = {
			title = "Apaisana - Taxista",
			gtype = "job",
		},
		"taxista.paisana"
	}, ]]
	-----------------------------------------------------------------------------
	--[	Organização de produção e venda de drogas ]------------------------------
	-----------------------------------------------------------------------------
	--[[["liderparceiro"] = {
		_config = {
			title = "Lider - Parceiro",
			gtype = "job",
		},
		"parceiro.permissao"
	},

	["subliderparceiro"] = {
		_config = {
			title = "Sub-Lider - Parceiro",
			gtype = "job",
		},
		"parceiro.permissao"
	},

	["gerenteparceiro"] = {
		_config = {
			title = "Gerente - Parceiro",
			gtype = "job",
		},
		"parceiro.permissao"
	},

	["parceiro"] = {
		_config = {
			title = "Membro - Parceiro",
			gtype = "job",
		},
		"parceiro.permissao"
	},]]
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
	["liderpcc"] = {
		_config = {
			title = "Lider - Primeiro Comando da Capital",
			gtype = "job",
		},
		"pccc.permissao"
	},

	["subliderpcc"] = {
		_config = {
			title = "Sub-Lider - Primeiro Comando da Capital",
			gtype = "job",
		},
		"pccc.permissao"
	},

	["gerentepcc"] = {
		_config = {
			title = "Gerente - Primeiro Comando da Capital",
			gtype = "job",
		},
		"pccc.permissao"
	},

	["pcc"] = {
		_config = {
			title = "Membro - Primeiro Comando da Capital",
			gtype = "job",
		},
		"pccc.permissao"
	},
-------------------------------------------------------------------------------------------------------------
-----COMANDO VERMELHO
----------------------------------------------------------------------------------------------------------------
	["lidercv"] = {
		_config = {
			title = "Lider - CV",
			gtype = "job",
		},
		"desmanche.permissao",
		"dv.permissao",
		"cv.permissao"
	},

	["sublidercv"] = {
		_config = {
			title = "Sub-Lider - CV",
			gtype = "job",
		},
		"desmanche.permissao",
		"dv.permissao",
		"cv.permissao"
	},

	["gerentecv"] = {
		_config = {
			title = "Gerente - CV",
			gtype = "job",
		},
		"desmanche.permissao",
		"dv.permissao",
		"cv.permissao"
	},

	["cv"] = {
		_config = {
			title = "Membro - CV",
			gtype = "job",
		},
		"desmanche.permissao",
		"dv.permissao",
		"cv.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Organização de produção e venda de drogas ]------------------------------
	-----------------------------------------------------------------------------
	["liderada"] = {
		_config = {
			title = "Lider - ADA",
			gtype = "job",
		},
		"caveira.permissao"
	},

	["subliderada"] = {
		_config = {
			title = "Sub-Lider - ADA",
			gtype = "job",
		},
		"caveira.permissao"
	},

	["gerenteada"] = {
		_config = {
			title = "Gerente - ADA",
			gtype = "job",
		},
		"caveira.permissao"
	},

	["ada"] = {
		_config = {
			title = "Membro - ADA",
			gtype = "job",
		},
		"caveira.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Organização de produção e venda de armas ]-------------------------------
	-----------------------------------------------------------------------------
	["liderbratva"] = {
		_config = {
			title = "Lider - Bratva",
			gtype = "job",
		},
		"okaida.permissao"
	},

	["subliderbratva"] = {
		_config = {
			title = "Sub-Lider - Bratva",
			gtype = "job",
		},
		"okaida.permissao"
	},

	["gerenteobratva"] = {
		_config = {
			title = "Gerente - Bratva",
			gtype = "job",
		},
		"okaida.permissao"
	},

	["bratva"] = {
		_config = {
			title = "Membro - Bratva",
			gtype = "job",
		},
		"okaida.permissao"
	},
	----------------------------------------------------------------------------
	--[	Organização de produção e venda de armas ]-------------------------------
	-----------------------------------------------------------------------------
	["lidercartel"] = {
		_config = {
			title = "Lider - Cartel",
			gtype = "job",
		},
		"perna.permissao"
	},

	["sublidercartel"] = {
		_config = {
			title = "Sub-Lider - Cartel",
			gtype = "job",
		},
		"perna.permissao"
	},

	["gerentecartel"] = {
		_config = {
			title = "Gerente - Cartel",
			gtype = "job",
		},
		"perna.permissao"
	},

	["cartel"] = {
		_config = {
			title = "Membro - Cartel",
			gtype = "job",
		},
		"perna.permissao"
	},
	-----------------------------------------------------------------------------
	--[	LAVAGEM DE DINHEIRO E DESMANCHE ]----------------------------
	-----------------------------------------------------------------------------
	["lidervanilla"] = {
		_config = {
			title = "Lider - Vanilla",
			gtype = "job",
		},
		"vanilla.permissao",
		"desmanche.permissao"
	},

	["sublidervanilla"] = {
		_config = {
			title = "Sub-Lider - Vanilla",
			gtype = "job",
		},
		"vanilla.permissao",
		"desmanche.permissao"
	},

	["gerentevanilla"] = {
		_config = {
			title = "Gerente - Vanilla",
			gtype = "job",
		},
		"vanilla.permissao",
		"desmanche.permissao"
	},

	["vanilla"] = {
		_config = {
			title = "Membro - Vanilla",
			gtype = "job",
		},
		"vanilla.permissao",
		"desmanche.permissao"
	},

	-----------------------------------------------------------------------------
	--[	LAVAGEM DE DINHEIRO ]----------------------------
	-----------------------------------------------------------------------------
	["liderbahamas"] = {
		_config = {
			title = "Lider - Bahamas",
			gtype = "job",
		},
		"bahamas.permissao"
	},

	["subliderbahamas"] = {
		_config = {
			title = "Sub-Lider - Bahamas",
			gtype = "job",
		},
		"bahamas.permissao"
	},

	["gerentebahamas"] = {
		_config = {
			title = "Gerente - Bahamas",
			gtype = "job",
		},
		"bahamas.permissao"
	},

	["bahamas"] = {
		_config = {
			title = "Membro - Bahamas",
			gtype = "job",
		},
		"bahamas.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Organização de produção e venda de munições ]----------------------------
	-----------------------------------------------------------------------------
	["lidercoreia"] = {
		_config = {
			title = "Lider - Coreia",
			gtype = "job",
		},
		"israel.permissao"
	},

	["sublidercoreia"] = {
		_config = {
			title = "Sub-Lider - Coreia",
			gtype = "job",
		},
		"israel.permissao"
	},

	["gerentecoreia"] = {
		_config = {
			title = "Gerente - Coreia",
			gtype = "job",
		},
		"israel.permissao"
	},

	["coreia"] = {
		_config = {
			title = "Membro - Coreia",
			gtype = "job",
		},
		"israel.permissao"
	},

	["civil"] = {
		_config = {
			title = "Cidadão",
			gtype = "job"
		},
		"gas.permissao"
	},
	-----------------------------------------------------------------------------
	--[	Org Da Prod Armas ]------------------------------------------------------
	-----------------------------------------------------------------------------
	["basilischi"] = {
		_config = {
			title = "Máfia Basilischi",
			gtype = "job",
		},
		"basilischi.permissao"
	}
}

cfg.users = {
	[1] = { "darixstore" }
}

cfg.selectors = {}

return cfg