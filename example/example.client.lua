local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TableLib = require(ReplicatedStorage.tabslib)


local tabs = Instance.new("Frame", Instance.new("ScreenGui", Players.LocalPlayer.PlayerGui))


local t = TableLib.new(tabs)

t:AddTab(TableLib.tab.new())
t:AddTab(TableLib.tab.new())
t:AddTab(TableLib.tab.new())
