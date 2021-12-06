#!/bin/bash

set -e
cd "$(dirname $0)/.."
master_file="src/db.changelog-master.xml"
changes_dir="src/sql"

if [ $# -ne 1 ]; then
  echo "Usage: $0 name-of-the-migration"
  exit 1
fi

migration_name=$1
migration_id="$(date +%Y%m%d%H%M%S)-$migration_name"
migration_file="$migration_id.xml"
migration_path="$changes_dir/$migration_file"

cat > "$migration_path" <<EOF
<databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ext="http://www.liquibase.org/xml/ns/dbchangelog-ext" xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.1.xsd http://www.liquibase.org/xml/ns/dbchangelog-ext http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-ext.xsd">
  <changeSet author="$USER" id="$migration_id">
    <sql>
      YOUR SWEET MIGRATION CODE HERE
    </sql>
    <rollback>
      YOUR BITTERSWEET ROLLBACK CODE HERE
    </rollback>
  </changeSet>
</databaseChangeLog>
EOF
