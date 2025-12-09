function Split(str, sep)
	local t = {}
	for s in string.gmatch(str, "([^" .. sep .. "]+)") do
		table.insert(t, s)
	end
	return t
end

function Trim(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end
