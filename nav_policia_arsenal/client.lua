local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

emS = Tunnel.getInterface("nav_policia_arsenal")
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
local menuactive = false
function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "recruta" then
		TriggerServerEvent('nav_policia_arsenal:recruta', user_id)
		ToggleActionMenu()

	elseif data == "1classe" then
		TriggerServerEvent('nav_policia_arsenal:1classe', user_id)
		ToggleActionMenu()
	elseif data == "2classe" then
		TriggerServerEvent('nav_policia_arsenal:2classe', user_id)
		ToggleActionMenu()

	elseif data == "3classe" then
		TriggerServerEvent('nav_policia_arsenal:3classe', user_id)
		ToggleActionMenu()
	
	elseif data == "tatico" then
		if emS.checkPermission() then
			TriggerServerEvent('nav_policia_arsenal:tatico', user_id)
			ToggleActionMenu()
		else
			TriggerEvent("Notify","negado","Você não tem acesso a este armamento! ")
		end
			
	elseif data == "gequipamento" then
		local ped = PlayerPedId()
	    RemoveAllPedWeapons(ped,true)
		TriggerServerEvent('nav_policia_arsenal:gequipamento', user_id)
		ToggleActionMenu()
		
	elseif data == "fechar" then
		ToggleActionMenu()
	end
end)


RegisterNetEvent('nav_policia_arsenal:menu')
AddEventHandler('nav_policia_arsenal:menu',function()
	ToggleActionMenu()
end)

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)


RegisterNetEvent('nav_policia_arsenal:blip')
AddEventHandler('nav_policia_arsenal:blip',function()
	
	local ped = GetPlayerPed()
	local playerPos = GetEntityCoords(ped,true)

	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),451.87,-980.14,30.68,true) < 1 or GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),118.93,-729.29,242.15,true) < 1 then
		TriggerEvent('nav_policia_arsenal:menu')
	end		

end)
--[[--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)

      local ped = GetPlayerPed(-1)
      local playerPos = GetEntityCoords(ped, true)
      
      DrawMarker(23, 452.36, -979.96, 30.68-0.97,0,0,0,0,0,0,1.0,1.0,0.5,34,126,255,50,0,0,0,0)
      if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 452.36, -979.96, 30.68, true ) < 1 then
        if(IsControlJustPressed(1, 38)) and emS.permissao() then
          TriggerEvent('nav_policia_arsenal:menu')
        end
      end
    end
end)
]]--