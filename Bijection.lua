
-- Useful for example, when creating a deterministic seed for a given chunk coordinate.
-- (x,y,z)->(x/1)+((x+y+1)/2)+((x+y+z+2)/3).
-- See https://math.stackexchange.com/questions/1176184/how-to-find-unique-numbers-from-3-numbers
-- https://math.stackexchange.com/questions/312879/how-to-define-a-injective-and-surjective-function-from-mathbbz-to-mathbb
-- https://en.wikipedia.org/wiki/Combination#Example_of_counting_combinations 
-- for details.
local bijection = {}
local magic = 8675309;

local function combine(n, k)
  if n >0 then
    n = 2 * n
  else
    n = (-2 * n) + 1
  end
  local c = 1;
  for i = 1, k do
    x = n - (i - 1);
    c = (x / k) * c
  end
  return c;
end

function bijection.map(x,y,z)
  z = z or 0;
  local n1 = x;
  local x1 = combine(n1, 1);

  local n2 = x + y + 1;
  local x2 = combine(n2, 2)

  local n3 = x + y + z + 2;
  local x3 = combine(n3, 3);
  
  local r = (x1 + x2 + x3) * magic
  --Faster rounding than floor.
  r = r + 0.5 - (r + 0.5) % 1;
  
  return r;
end

return bijection;