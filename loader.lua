local owenn = loadstring(game:HttpGet("https://raw.githubusercontent.com/Companion/owenn/refs/heads/main/owennui.lua"))()

local ui = owenn:window("Loader", 380, 220, {
	keys = { "owennwtf" },
	discord = "https://discord.gg/owen",
	skipLoader = true,
})
ui.hide()

local BASE = "https://raw.githubusercontent.com/Companion/Scripts/refs/heads/main/"

local registry = {
	place = {
		[111835260646713]  = "generic-blood-ragdoll-fighting.lua",
		[103854444055060]  = "silent-assassins.lua",
		[893973440]        = "flee-the-facility.lua",
		[7871169780]       = "bLockerman's-Minesweeper.lua",
		[5244411056]       = "bloxy-bingo.lua",
		[108843562394237]  = "monkey-tag.lua",
		[101272402522756]  = "bbq-battles.lua",
		[109509628648368]  = "merge-vs-mobs.lua",
		[73814003954154]   = "pickaxe-tycoon.lua",
		[93794424681636]   = "my-baddie-restaurant.lua",
		[90568084448279]   = "one-tap.lua",
		[93833944515093]   = "between-colors.lua",
		[93404836354142]   = "phonk-clicker.lua",
		[112490729816320]  = "spin-a-soccer-card.lua",
	},
	game = {
		[9534705677] = "sniper-arena.lua",
		[7200297228] = "loot-hero.lua",
		[8786713187] = "oil-empire.lua",
	},
}
local DEFAULT = "universal.lua"

local placeId, gameId = game.PlaceId, game.GameId
local file = registry.place[placeId] or registry.game[gameId] or DEFAULT
local isDefault = (file == DEFAULT)

ui.toast(("Loading %s..."):format(file), 2, "bottom", "info")

local function fetch(url)
	local body
	local ok, err = pcall(function() body = game:HttpGet(url) end)
	if not ok or type(body) ~= "string" then return nil, tostring(err or "request failed") end
	if body:sub(1, 4) == "404:" then return nil, "404 (script not on GitHub)" end
	return body
end

local body, err = fetch(BASE .. file)

if not body and not isDefault then
	warn(("[loader] %s missing (%s) falling back to %s"):format(file, err, DEFAULT))
	ui.toast(("%s not found, loading universal"):format(file), 3, "bottom", "warning")
	body, err = fetch(BASE .. DEFAULT)
end

if not body then
	warn("[loader] fetch failed:", err)
	ui.toast("Loader failed: " .. tostring(err), 4, "bottom", "error")
	ui.destroy()
	return
end

local runOk, runErr = pcall(function() loadstring(body)() end)
if not runOk then
	warn("[loader] script error:", runErr)
	ui.toast("Script error: " .. tostring(runErr):sub(1, 80), 5, "bottom", "error")
end

ui.destroy()
