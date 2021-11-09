local pedlist = {
	{ ['x'] = 2432.78, ['y'] = 4802.78, ['z'] = 34.82, ['h'] = 128.22, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" },
	{ ['x'] = 2440.98, ['y'] = 4794.38, ['z'] = 34.66, ['h'] = 128.22, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" },
	{ ['x'] = 2449.0, ['y'] = 4786.67, ['z'] = 34.65, ['h'] = 128.22, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" },
	{ ['x'] = 2457.28, ['y'] = 4778.75, ['z'] = 34.52, ['h'] = 128.22, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" },
	{ ['x'] = 138.84056091309, ['y'] = -1921.6223144531, ['z'] = 21.380821228027, ['h'] = 304.42, ['hash'] = 0xDB729238, ['hash2'] = "g_m_y_famdnf_01" },
	{ ['x'] = 1386.7241210938, ['y'] = -591.97698974609, ['z'] = 74.432968139648, ['h'] = 58.84, ['hash'] = 0x23B88069, ['hash2'] = "g_m_y_ballasout_01" },
	{ ['x'] = -151.3232421875, ['y'] = -1622.3146972656, ['z'] = 33.649757385254, ['h'] = 234.29, ['hash'] = 0x2930C1AB, ['hash2'] = "s_m_m_highsec_02" },
	{ ['x'] = 2464.67, ['y'] = 4770.23, ['z'] = 34.38, ['h'] = 128.22, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" }
	--[[{ ['x'] = 1197.25, ['y'] = -3253.47, ['z'] = 7.09, ['h'] = 91.02, ['hash'] = 0x59511A6C, ['hash2'] = "s_m_m_trucker_01" }, -- Caminhoneiro
	{ ['x'] = -424.28, ['y'] = -2789.86, ['z'] = 6.53, ['h'] = 314.36, ['hash'] = 0x9FC37F22, ['hash2'] = "s_m_m_ups_01" }, -- Carteiro (Empacotar)
	{ ['x'] = -393.55, ['y'] = -2763.72, ['z'] = 6.00, ['h'] = 132.79, ['hash'] = 0x9FC37F22, ['hash2'] = "s_m_m_ups_01" }, -- Carteiro (Entregar)
	{ ['x'] = 2418.50, ['y'] = 4797.19 , ['z'] = 35.14, ['h'] = 44.14, ['hash'] = 0x94562DD7, ['hash2'] = "a_m_m_farmer_01" }, -- Leiteiro (Entregar)
	{ ['x'] = 1218.74, ['y'] = -1266.87 , ['z'] = 36.42, ['h'] = 87.80, ['hash'] = 0xC5FEFADE, ['hash2'] = "s_m_y_construct_02" }, -- Lenhador (Entregar)
	{ ['x'] = 452.95,  ['y'] = -607.75 , ['z'] = 28.59, ['h'] = 263.71, ['hash'] = 0x5244247D, ['hash2'] = "u_m_y_baygor" }, -- Lenhador (Entregar)
	{ ['x'] = 1239.11, ['y'] = -2939.89, ['z'] = 9.31,  ['h'] = 178.51, ['hash'] = 0x36EA5B09, ['hash2'] = "mp_m_weapexp_01" }, -- Contrabandista
	{ ['x'] = 91.83,   ['y'] = 3756.29,  ['z'] = 40.77, ['h'] = 259.80, ['hash'] = 0x4F46D607 , ['hash2'] = "g_m_y_lost_01" }, -- Contrabandista
	{ ['x'] = 458.00,  ['y'] = -1498.07, ['z'] = 28.18, ['h'] = 112.95, ['hash'] = 0xF9FD068C , ['hash2'] = "ig_vagspeak" } -- Missão para Pegar Pólvora]]
}

Citizen.CreateThread(function()
	for k,v in pairs(pedlist) do
		RequestModel(GetHashKey(v.hash2))
		while not HasModelLoaded(GetHashKey(v.hash2)) do
			Citizen.Wait(10000)
		end

		local ped = CreatePed(4,v.hash,v.x,v.y,v.z-1,v.h,false,true)
		FreezeEntityPosition(ped,true)
		SetEntityInvincible(ped,true)

	end
end)