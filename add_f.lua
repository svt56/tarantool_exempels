#!/usr/bin/env tarantool
local csvfile = require "simplecsv" --внешняя библиотека для обработки csv https://nocurve.com/2014/03/05/simple-csv-read-and-write-using-lua/
--local file = '/home/user/Avito_avito_res_tr.csv' --назначем имя файла
local file = '/home/user/base/instances.enabled/speed/NIZHNOV2015_two_tr.csv' --назначем имя файла
local m = csvfile.read(file,'|',false,'') --задаем парметы название файла, разделить, читаь пустые строки или нет, подстановочное значение если ячейка пустая
-- цикл подсчета строк
local en = 0
for _ in io.lines(file) do
  en = en + 1
end
-- цикл ввода данны
for i=1,en do
  box.begin()
  box.space.speed:insert{nil,tostring(m[i][1]),tostring(m[i][2]),tostring(m[i][3]),tostring(m[i][4]),tostring(m[i][5]),tostring(m[i][6]),tostring(m[i][7]),tostring(m[i][8]),tostring(m[i][9]),tostring(m[i][10]),tostring(m[i][11]),tostring(m[i][12]),tostring(m[i][13]),tostring(m[i][14]),tostring(m[i][15]),tostring(m[i][16]),tostring(m[i][17]),tostring(m[i][18]),tostring(m[i][19])}
  box.commit()
end
