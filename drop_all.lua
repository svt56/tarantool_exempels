#!/usr/bin/env tarantool
local n = box.space.speed.index[0]:max()[1] -- получаем максимальное значение инкрементного поля спейса speed
for i=1,n do
  box.space.speed:delete(i)
end
