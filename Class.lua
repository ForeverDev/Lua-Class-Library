local module = {}
module.__index = module

function copy(array)
	local new = {}
	for i, v in pairs(array) do
		new[i] = v
	end
	return new
end

function module.__newindex(self, key, value)
	if key == "extends" then
		local meta = getmetatable(self)
		meta.__index = function(this, key)
			return rawget(value, key) or rawget(module, key)
		end
		return setmetatable(self, meta)
	elseif key:sub(1, 2) == "__" then
		local meta = getmetatable(self)
		meta[key] = value
		return setmetatable(self, meta)
	else
		rawset(self, key, value)
	end
end

function module.__call(self, ...)
	local new = setmetatable(copy(self), getmetatable(self))
	if new.init then
		new:init(...)
	end
	return new
end

setmetatable(module, {__call = function() return setmetatable({}, module) end})

return module
