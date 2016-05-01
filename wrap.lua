local function wrap(t)
  local wrapper = {}
  setmetatable(wrapper, {
    __index = function(w, name)
      if name == 'unwrap' then
        return function()
          return t
        end
      end
      return function(...)
        args = {...}
        args[1] = t
        t[name](unpack(args))
        return wrapper
      end
    end
    })
  return wrapper
end
 
return wrap
