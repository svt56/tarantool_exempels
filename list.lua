#!/usr/bin/env tarantool
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
    print(i .. ": " .. file)
end
