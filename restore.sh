for tbl in `psql -qAt -c "select table_name from information_schema.views where table_schema = 'public';" vaccine6` ; do  psql -c "alter view \"$tbl\" owner to dhis2" vaccine6 ; done
for tbl in `psql -qAt -c "select sequence_name from information_schema.sequences where sequence_schema = 'public';" vaccine6` ; do  psql -c "alter sequence \"$tbl\" owner to dhis2" vaccine6 ; done
for tbl in `psql -qAt -c "select tablename from pg_tables where schemaname = 'public';" vaccine6` ; do  psql -c "alter table \"$tbl\" owner to dhis2" vaccine6 ; done
