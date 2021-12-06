## liquibase-snowflake-poc

Setup
```shell
mvn install
```

Run migrations
DB properties are present in `liquibase.properties`

```shell
 mvn liquibase:update -Dliquibase.password='<password>'

```

Add a new migration

```shell
# this creates a template sql migration under src/sql
sh src/create-migration.sh create_table_dept
# Now add the below content to src/db.changelog-master.xml
# <include file="sql/<filename>.xml" relativeToChangelogFile="true" context="all"/>
```