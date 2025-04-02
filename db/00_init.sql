-- Создаём пользователя для репликации
CREATE USER replicator WITH REPLICATION ENCRYPTED PASSWORD 'replicator_password';

-- Создаём слот репликации (если его нет)
SELECT * FROM pg_create_physical_replication_slot('replication_slot');

-- Разрешаем подключение для репликации (уже есть в POSTGRES_HOST_AUTH_METHOD, но можно явно указать)
ALTER SYSTEM SET listen_addresses = '*';
ALTER SYSTEM SET wal_level = 'replica';
ALTER SYSTEM SET max_wal_senders = 10;
ALTER SYSTEM SET max_replication_slots = 10;
ALTER SYSTEM SET hot_standby = 'on';
