local M = {}

function M.merge(t1, t2)
  for k, v in pairs(t2) do
    print(vim.inspect(k), vim.inspect(v))
    t1[k] = v
  end
  return t1
end

function M.deepMerge(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == "table" and type(t1[k]) == "table" then
      M.deepMerge(t1[k], v)
    else
      t1[k] = v
    end
  end
  return t1
end

return M
