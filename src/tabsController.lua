local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages

local TableLib = require(Packages.tablelib)


local tab = require(script.Parent.tab)

local tabsController = {}

local tabsControllerClass = {}
tabsControllerClass.__index = tabsControllerClass

export type tabsController = typeof(setmetatable(
	{} :: {
		--[[
			Список фреймов вкладок
		]]
		_tabs: {
			[number]: tab.tab
		},

		--[[
		
		]]
		_activeTab: NumberValue,

		--[[
		
		]]
		_ButtonsArea: TableLib.Table,

		--[[
		
		]]
		_tabsArea: Frame
	}, tabsController
))


function tabsControllerClass.new(frameArea: Frame, tabsArea: Frame?): tabsController
	
	local self: tabsController = setmetatable(
		{
			_tabs = {},
			_activetab = Instance.new("NumberValue"),
			_ButtonsArea = TableLib.new(frameArea, {X = 1, Y = 1}, nil, "TextButton"),
			_tabsArea = tabsArea or Instance.new("Frame")
		}, 
		tabsControllerClass
	)

	local lastActiveTab: number = self._activetab.Value
	self._activetab.Changed:Connect(function(a0: number) 
		
		self._tabs[lastActiveTab].MainFrame.Visible = true

		self._tabs[self._activetab.Value]._MainFrame.Visible = true

		lastActiveTab = self._activetab.Value
	end)

	return self
end

function tabsControllerClass.addTab(self: tabsController, newTab: tab.tab)
	newTab.MainFrame.Parent = self._tabsArea
	newTab.MainFrame.Visible = false

	self._ButtonsArea:AddNewColumn()

	local n = #self._ButtonsArea.Data[1]

	self._ButtonsArea.Data[1][n].Text = newTab.Name
	
	table.insert(self._tabs, newTab)
end


return setmetatable(tabsController, tabsControllerClass)
