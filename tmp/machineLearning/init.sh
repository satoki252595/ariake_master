#!/bin/bash
set -e

# データベースの作成
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE sga_test1;
EOSQL

# バックアップファイルのリストア
pg_restore -U "$POSTGRES_USER" -d sga_test1 /docker-entrypoint-initdb.d/sga_test1_20241107.backup