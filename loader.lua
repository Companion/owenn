
local owenn = loadstring(game:HttpGet("https://raw.githubusercontent.com/Companion/owenn/refs/heads/main/owennui.lua"))()

local ui = owenn:window("Loader", 380, 220, {
	keys = { "owenn.wtf" },
	discord = "https://discord.gg/brq2hJtwEU",
	skipLoader = true,
})
ui.hide()

local placeId = game.PlaceId
local scripts = {
	[111835260646713] = "https://raw.githubusercontent.com/Companion/Scripts/refs/heads/main/generic-blood-ragdoll-fighting.lua",
	[103854444055060] = "https://raw.githubusercontent.com/Companion/Scripts/refs/heads/main/silent-assassins.lua",
	[122446657157717] = "https://raw.githubusercontent.com/Companion/Scripts/refs/heads/main/sniper-duels.lua",
	default = "https://raw.githubusercontent.com/Companion/Scripts/refs/heads/main/universal.lua",
}

local src = scripts[placeId] or scripts.default
if src then
	local ok, err = pcall(function()
		loadstring(game:HttpGet(src))()
	end)
	if not ok then warn("Load err:", err) ui.toast("Failed to load script", 2, "bottom", "error") end
	ui.destroy()
else
	ui.toast("Game not supported (PlaceId: " .. placeId .. ")", 2, "bottom", "warning")
end
