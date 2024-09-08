#!/usr/bin/env tarantool
local csvfile = require "simplecsv" --внешняя библиотека для обработки csv https://nocurve.com/2014/03/05/simple-csv-read-and-write-using-lua/
local input_path = "/home/user/lua/input/"  -- Путь к папке с файлами
-- Функция для чтения файлов из директории с фильтром по расширению
function read_csv_files(path)
    local files = {}
    -- Проверяем операционную систему для корректного формата команды
    local command = "ls -1 " .. path .. "*.csv"  -- Выполняем команду list по зданному каталогу
    -- Используем io.popen для выполнения команды и получения вывода
    local pfile = io.popen(command)
    for filename in pfile:lines() do
        table.insert(files, filename)
    end
    pfile:close()
    return files
end
-- Читаем список файлов .csv
local csv_files = read_csv_files(input_path)
-- Выводим полученный список файлов
for i, file in ipairs(csv_files) do
  local m = csvfile.read(file,'|',false,'') --задаем парметы название файла, разделить, читаь пустые строки или нет, подстановочное значение если ячейка пустая
  -- цикл подсчета строк
  local en = 0
  for _ in io.lines(file) do
    en = en + 1
  end
--  return (file .. ":" .. en .. ":" .. m[1][2]) 
 -- цикл ввода данны
  for i=1,en do
    box.begin() -- начало коммита
    box.space.speed2:insert{nil,tostring(m[i][1]),tostring(m[i][2]),tostring(m[i][3]),tostring(m[i][4]),tostring(m[i][5]),tostring(m[i][6]),tostring(m[i][7]),tostring(m[i][8]),tostring(m[i][9]),tostring(m[i][10]),tostring(m[i][11]),tostring(m[i][12]),tostring(m[i][13]),tostring(m[i][14]),tostring(m[i][15]),tostring(m[i][16]),tostring(m[i][17]),tostring(m[i][18]),tostring(m[i][19])}
    box.commit() -- конец коммита
  end
end
return box.space.speed2:len() -- показываем сколько записей после ввода данных
