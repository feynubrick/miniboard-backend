# project-miniboard-backend

# How to build
## Requirements
1. Docker
2. Docker-Compose
3. properly configured `.env`
4. properly configured `liquibase.properties`

Template files are prepared for easy configuration.
Please note that this project utilize "Liquibase" to manage schemas.
The Properly configured `liquibase.properties` file is required for Liquibase.
## Command
Use build command of docker compose:
```bash
$ docker compose build
```

# How to Run
Use docker compose command:
```bash
$ docker compose up -d
```

# How to change schema
## Writing changelog file
Add [a raw SQL script for Liquibase](https://docs.liquibase.com/concepts/changelogs/sql-format.html) and save it in `adaptors/db/main/changelogs`. Please name it in the format of `####.comments-to-represent-changelog.sql`. And copy and overwrite the whole content of the file to `_root.sql` in the same directory.

Use the following command to update the db
```bash
$ docker compose up main-db-migration
```
