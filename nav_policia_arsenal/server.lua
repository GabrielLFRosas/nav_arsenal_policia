local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

emS = {}
Tunnel.bindInterface("nav_policia_arsenal",emS)


-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookarsenal = "https://discordapp.com/api/webhooks/721366831075426376/zY0DtcWSEInmNvAyymZX869QZmGr32wmoBcRWWPLzy0-pxMRR_3BCtQmTfoRUSYcYs43" 
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterCommand('arsenal',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)

	if vRP.hasPermission(user_id,"policia.permissao") then
		TriggerClientEvent('nav_policia_arsenal:blip',source)
	else
		TriggerClientEvent("Notify",source,"negado","Você não pode acessar o Arsenal!")
	end	
end)

local Pitemlist = {
	"wbody|WEAPON_CARBINERIFLE_MK2",
	"wbody|WEAPON_SMG",
	"wbody|WEAPON_COMBATPDW",
	"wbody|WEAPON_COMBATPISTOL",
	"wbody|WEAPON_STUNGUN",
	"wbody|WEAPON_FLASHLIGHT",
	"wbody|WEAPON_NIGHTSTICK",

	"wammo|WEAPON_CARBINERIFLE_MK2",
	"wammo|WEAPON_SMG",
	"wammo|WEAPON_COMBATPISTOL",
	"wammo|WEAPON_STUNGUN",
	"wammo|WEAPON_FLASHLIGHT",
	"wammo|WEAPON_NIGHTSTICK"
}

RegisterServerEvent('nav_policia_arsenal:recruta')
AddEventHandler('nav_policia_arsenal:recruta', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
			
			SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[PEGOU] O ARMAMENTO DE RECRUTA! "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			TriggerClientEvent("Notify",source,"importante","Equipamento equipado.")
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:1classe')
AddEventHandler('nav_policia_arsenal:1classe', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)	
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 100 }})
			vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
			
			SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[PEGOU] O ARMAMENTO DE CLASSE BAIXA! "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			TriggerClientEvent("Notify",source,"importante","Equipamento equipado.")
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:2classe')
AddEventHandler('nav_policia_arsenal:2classe', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 100 }})
			vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
			
			SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[PEGOU] O ARMAMENTO DE CLASSE MÉDIA! "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			TriggerClientEvent("Notify",source,"importante","Equipamento equipado.")
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:3classe')
AddEventHandler('nav_policia_arsenal:3classe', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_SPECIALCARBINE"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
			
			SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[PEGOU] O ARMAMENTO DE CLASSE ALTA! "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			TriggerClientEvent("Notify",source,"importante","Equipamento equipado.")
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:tatico')
AddEventHandler('nav_policia_arsenal:tatico', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") then
			vRPclient.giveWeapons(source,{["WEAPON_SPECIALCARBINE"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_SMG"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
			vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
			vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
			
			SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[PEGOU] O ARMAMENTO DE CLASSE TÁTICA! "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			TriggerClientEvent("Notify",source,"importante","Equipamento equipado.")
		end
	end
end)

RegisterServerEvent('nav_policia_arsenal:gequipamento')
AddEventHandler('nav_policia_arsenal:gequipamento', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local weapons = vRPclient.replaceWeapons(source,{})

		for k,v in pairs(weapons) do
			vRP.giveInventoryItem(user_id,"wbody|"..k,1)
			if v.ammo > 0 then
				vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
			end
		end

		local inv = vRP.getInventory(user_id)

		for k,v in pairs(Pitemlist) do
			local sub_items = { v }
			if string.sub(v,1,1) == "*" then
				local idname = string.sub(v,2)
				sub_items = {}
				for fidname,_ in pairs(inv) do
					if splitString(fidname,"|")[1] == idname then
						table.insert(sub_items,fidname)
					end
				end
			end

			for _,idname in pairs(sub_items) do
				local amount = vRP.getInventoryItemAmount(user_id,idname)
				if amount > 0 then
					local item_name,item_weight = vRP.getItemDefinition(idname)
					if item_name then
						if vRP.tryGetInventoryItem(user_id,idname,amount,true) then
						end
					end
				end
			end
		end

		vRPclient.setArmour(source,0)
		SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[GUARDOU] O ARMAMENTO ! "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent("Notify",source,"aviso","Equipamento guardado.")
		
	else
		TriggerClientEvent("Notify",source,"negado","Acesso negado!")
	end
end)

function emS.permissao()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"policia.permissao")
end

function emS.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"tatico.permissao")
end	