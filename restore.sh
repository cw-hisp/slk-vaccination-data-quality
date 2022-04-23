for tbl in `psql -qAt -c "select table_name from information_schema.views where table_schema = 'public';" vaccine6` ; do  psql -c "alter view \"$tbl\" owner to dhis2" vaccine6 ; done
for tbl in `psql -qAt -c "select sequence_name from information_schema.sequences where sequence_schema = 'public';" vaccine6` ; do  psql -c "alter sequence \"$tbl\" owner to dhis2" vaccine6 ; done
for tbl in `psql -qAt -c "select tablename from pg_tables where schemaname = 'public';" vaccine6` ; do  psql -c "alter table \"$tbl\" owner to dhis2" vaccine6 ; done

# functions
IFS=$'\n'
for fnc in `psql -qAt -c "SELECT  '\"' || p.proname||'\"' || '(' || pg_catalog.pg_get_function_identity_arguments(p.oid) || ')' FROM pg_catalog.pg_namespace n JOIN pg_catalog.pg_proc p ON p.pronamespace = n.oid WHERE n.nspname = 'public';" vaccine6`
do
  psql -c "alter function $fnc owner to dhis2" vaccine6
done
