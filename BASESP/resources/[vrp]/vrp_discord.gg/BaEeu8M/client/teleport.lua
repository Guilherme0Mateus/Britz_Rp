-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local Teleport = {

	["CARTEL"] = { 
		positionFrom = { ['x'] = -167.95, ['y'] = 915.98, ['z'] = 235.66, ['perm'] = "perna.permissao" },
		positionTo = { ['x'] = -145.14, ['y'] = 898.91, ['z'] = 226.42, ['perm'] = "perna.permissao" },
	},

	["PF"] = { -- 
		positionFrom = { ['x'] = 456.02, ['y'] = -1103.85, ['z'] = 29.39, ['perm'] = "pfederal.permissao" },
		positionTo = { ['x'] = 478.31, ['y'] = -1100.96, ['z'] = 38.70, ['perm'] = "pfederal.permissao" },
	},

--	["HP"] = { -- 
--		positionFrom = { ['x'] = -490.48, ['y'] = -327.84, ['z'] = 42.30, ['perm'] = "paramedico.permissao" },
--		positionTo = { ['x'] = -443.74, ['y'] = -331.99, ['z'] = 78.16, ['perm'] = "paramedico.permissao" },  
--	},
	
	["PF"] = {  
		positionFrom = { ['x'] = 416.81, ['y'] = -1084.26, ['z'] = 30.05, ['perm'] = "pfederal.permissao" }, 
		positionTo = { ['x'] = 467.87, ['y'] = -1097.54, ['z'] = 38.70, ['perm'] = "pfederal.permissao" },
	}
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,j in pairs(Teleport) do
			local px,py,pz = table.unpack(GetEntityCoords(PlayerPedId(),true))
			local unusedBool,coordz = GetGroundZFor_3dCoord(j.positionFrom.x,j.positionFrom.y,j.positionFrom.z,1)
			local unusedBool,coordz2 = GetGroundZFor_3dCoord(j.positionTo.x,j.positionTo.y,j.positionTo.z,1)
			local distance = GetDistanceBetweenCoords(j.positionFrom.x,j.positionFrom.y,coordz,px,py,pz,true)
			local distance2 = GetDistanceBetweenCoords(j.positionTo.x,j.positionTo.y,coordz2,px,py,pz,true)

			if distance <= 30 then
				DrawMarker(1,j.positionFrom.x,j.positionFrom.y,j.positionFrom.z-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
				if distance <= 1.5 then
					if IsControlJustPressed(0,38) then
						SetEntityCoords(PlayerPedId(),j.positionTo.x,j.positionTo.y,j.positionTo.z-0.50)
					end
				end
			end

			if distance2 <= 30 then
				DrawMarker(1,j.positionTo.x,j.positionTo.y,j.positionTo.z-1,0,0,0,0,0,0,1.0,1.0,1.0,255,255,255,50,0,0,0,0)
				if distance2 <= 1.5 then
					if IsControlJustPressed(0,38) then
						SetEntityCoords(PlayerPedId(),j.positionFrom.x,j.positionFrom.y,j.positionFrom.z-0.50)
					end
				end
			end
		end
	end
end)