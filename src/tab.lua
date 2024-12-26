local tab = {}

local tabClass = {}
tabClass.__index = tabClass

export type tab = typeof(setmetatable(
	{} :: {
		Name: string,

		MainFrame: Frame
	}, 
	tabClass
))

function tab.new(name: string?, frame: Frame?): tab

	local self = setmetatable(
		{
			Name = name or "NewTab",
			MainFrame = frame or Instance.new("Frame")
		}, tabClass
	)

	

	return self
end


return setmetatable(tab, tabClass)
