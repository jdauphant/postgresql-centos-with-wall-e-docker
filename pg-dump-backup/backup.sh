#!/bin/bash
# Inspired from https://gist.github.com/skyebook/3407646
# and https://gist.github.com/shaiton/e505608c0b3bc9bc5aac

NOW="$(date +"%Y-%m-%d")"
FILENAME="$DATABASE_BACKUP_PATH/$DATABASE_NAME.$NOW.backup.sql.gz"
find $DATABASE_BACKUP_PATH -name $DATABASE_NAME.*backup* -type f -mtime +$RETENTION_DAYS -exec rm '{}' \;
pg_dump $DATABASE_URL | gzip > $FILENAME
