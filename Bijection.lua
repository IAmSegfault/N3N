-- Useful for example, when creating a deterministic seed for a given chunk coordinate.
-- (x,y,z)->(x combine 1)+((x+y+1) combine 2)+((x+y+z+2) combine 3).
-- See https://math.stackexchange.com/questions/1176184/how-to-find-unique-numbers-from-3-numbers
-- https://math.stackexchange.com/questions/312879/how-to-define-a-injective-and-surjective-function-from-mathbbz-to-mathbb
-- https://en.wikipedia.org/wiki/Combination#Example_of_counting_combinations 
-- for details.
local bijection = {}
local maxint = 262144;
-- abs(magic) must not exceed 68719476735
local maxmagic = 68719476735
local magic = 9001;

local function constraint(j)
  if j >0 then
    j = 2 * j 
  else
    j = (-2 * j) + 1
  end
  return j
end


local function combine(n, k)
  local c = 1;
  for i = 1, k do
  local x = n - (i - 1);
    c = (x / i) * c
  end
  return c;
end

function bijection.map(x,y,z,w)
  
  w = w or false
  z = z or 0;
  x = constraint(x)
  y = constraint(y)
  z = constraint(z)
  
  local n1 = x;
  local x1 = combine(n1, 1);

  local n2 = x + y + 1;
  local x2 = combine(n2, 2)
  
  local n3 = x + y + z + 2;
  local x3 = combine(n3, 3);
  
  local r = x1 + x2 + x3
  if r > maxint then
    return nil
  end
  
  if w and math.abs(w) <= maxmagic then
    r = r * w;
  else
    r = r * magic
  end
  
  --Faster rounding than floor.
  r = r + 0.5 - (r + 0.5) % 1;
  
  return r;
end

return bijection;