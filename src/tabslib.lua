local tab = require(script.Parent.tab)
local tabsController = require(script.Parent.tabsController)
return setmetatable(tabsController, {tab = tab})
