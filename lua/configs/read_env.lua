_G.read_env = function(name)
  if vim.env[name] and vim.env[name] ~= "" then
    return vim.env[name]
  end

  local file = io.open(vim.fn.stdpath "config" .. "/.env", "r")
  if not file then
    return nil
  end

  for line in file:lines() do
    local key, value = line:match "^%s*export%s+([%w_]+)%s*=%s*(.-)%s*$"

    if not key then
      key, value = line:match "^%s*([%w_]+)%s*=%s*(.-)%s*$"
    end

    if key == name then
      file:close()

      value = value:gsub("%s+#.*$", ""):gsub("^%s+", ""):gsub("%s+$", "")

      local first, last = value:sub(1, 1), value:sub(-1)

      if (first == '"' and last == '"') or (first == "'" and last == "'") then
        value = value:sub(2, -2)
      end

      return value
    end
  end

  file:close()

  return nil
end
