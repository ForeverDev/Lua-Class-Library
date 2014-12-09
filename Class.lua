local module = {}
module.__index = module

function copy(array)
	local new = {}
	for i, v in pairs(array) do
		new[i] = type(v) == "table" and copy(v) or v
	end
	return new
end

function module.__newindex(self, key, value)
	if key == "extends" then
		local meta = getmetatable(self).__index = function(this, key)
			return rawget(value, key) or rawget(module, key)
		end
	elseif key:sub(1, 2) == "__" then
		getmetatable(self)[key] = value
	else
		rawset(self, key, value)
	end
end

function module.__call(self, ...)
	local new = setmetatable(copy(self), copy(getmetatable(self)))
	if new.init then
		new:init(...)
	end
	return new
end

setmetatable(module, {__call = function() return setmetatable({}, module) end})

return module
