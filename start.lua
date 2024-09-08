#!/usr/bin/env tarantool
-- выделяем 400 ГБ под мемх 429496729600, 
box.cfg({memtx_memory = 329496729600})
-- созадть пользователя
box.schema.user.create('user', { password = 'user' })
-- пердоставить права на все пользователю
box.schema.user.grant('user','read,write,create,execute,session,alter,drop,usage','universe')
-- блокируем guest

-- пароль на администратора
box.schema.user.passwd('admin', 'admin')
-- мигрируем под юзера
box.session.su('user')
-- создаем базу данных speed
box.schema.space.create('speed')
-- определяем формат
box.space.speed:format({
                           { name = 'id', type = 'unsigned' },
                           { name = 'phone', type = 'string' },
                           { name = 'email', type = 'string' },
                           { name = 'fio', type = 'string' },
                           { name = 'f', type = 'string' },
                           { name = 'n', type = 'string' },
                           { name = 's', type = 'string' },
                           { name = 'fidor', type = 'string' },
                           { name = 'pass', type = 'string' },
                           { name = 'grz', type = 'string' },
                           { name = 'vk', type = 'string' },
                           { name = 'vu', type = 'string' },
                           { name = 'tg', type = 'string' },
                           { name = 'tgid', type = 'string' },
                           { name = 'fb', type = 'string' },
                           { name = 'inn', type = 'string' },                                     
                           { name = 'firm', type = 'string' },
                           { name = 'base', type = 'string' },
                           { name = 'adres', type = 'string' },
                           { name = 'json', type = 'string' },

                       })
-- создаем счетчик
box.schema.sequence.create('id_speed',{min=1})
-- привязываем счетчик к полю id в таблице
box.space.speed:create_index('id',{ sequence = 'id_speed' })
-- делаем индексы к поисковым полям
box.space.speed:create_index('phone_in', { parts = { 'phone' }, type = 'tree', unique = false})
box.space.speed:create_index('email_in', { parts = { 'email' }, type = 'tree', unique = false})
box.space.speed:create_index('fio_in', { parts = { 'fio' }, type = 'tree', unique = false})
box.space.speed:create_index('f_in', { parts = { 'f' }, type = 'tree', unique = false})
box.space.speed:create_index('n_in', { parts = { 'n' }, type = 'tree', unique = false})
box.space.speed:create_index('s_in', { parts = { 's' }, type = 'tree', unique = false})
box.space.speed:create_index('fidor_in', { parts = { 'fidor' }, type = 'tree', unique = false})
box.space.speed:create_index('pass_in', { parts = { 'pass' }, type = 'tree', unique = false})
box.space.speed:create_index('grz_in', { parts = { 'grz' }, type = 'tree', unique = false})
box.space.speed:create_index('vk_in', { parts = { 'vk' }, type = 'tree', unique = false})
box.space.speed:create_index('vu_in', { parts = { 'vu' }, type = 'tree', unique = false})
box.space.speed:create_index('tg_in', { parts = { 'tg' }, type = 'tree', unique = false})
box.space.speed:create_index('tgid_in', { parts = { 'tgid' }, type = 'tree', unique = false})
box.space.speed:create_index('fb_in', { parts = { 'fb' }, type = 'tree', unique = false})
box.space.speed:create_index('inn_in', { parts = { 'inn' }, type = 'tree', unique = false})
box.space.speed:create_index('firm_in', { parts = { 'firm' }, type = 'tree', unique = false})
box.space.speed:create_index('base_in', { parts = { 'base' }, type = 'tree', unique = false})

