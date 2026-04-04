
local owenn = loadstring(game:HttpGet("https://raw.githubusercontent.com/Companion/owenn/refs/heads/main/owennui.lua"))()

local ui = owenn:window("Loader", 380, 220, {
	keys = { "owenn.wtf" },
	discord = "https://discord.gg/brq2hJtwEU",
	skipLoader = true,
})
ui.hide()

local placeId = game.PlaceId
local gameId = game.GameId
local byPlace = {
	[111835260646713] = "https://raw.githubusercontent.com/Companion/Scripts/refs/heads/main/generic-blood-ragdoll-fighting.lua",
	[103854444055060] = "https://raw.githubusercontent.com/Companion/Scripts/refs/heads/main/silent-assassins.lua",
	[893973440] = "https://raw.githubusercontent.com/Companion/Scripts/refs/heads/main/flee-the-facility.lua",
	[7871169780] = "https://raw.githubusercontent.com/Companion/Scripts/refs/heads/main/bLockerman's-Minesweeper.lua",
}
local byGameId = {
	[9534705677] = "https://raw.githubusercontent.com/Companion/Scripts/refs/heads/main/sniper-arena.lua",
	[7200297228] = "https://raw.githubusercontent.com/Companion/Scripts/refs/heads/main/loot-hero.lua",
}
local default = "https://raw.githubusercontent.com/Companion/Scripts/refs/heads/main/universal.lua"

local src = byPlace[placeId] or byGameId[gameId] or default
local ok, err = pcall(function()
	loadstring(game:HttpGet(src))()
end)
if not ok then warn("Load err:", err) ui.toast("Failed to load script", 2, "bottom", "error") end
ui.destroy()
