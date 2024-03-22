# Testing suite for Bal Persist CLI
## Preparation
Spin up the docker containers for databases.
```Bash
alias balx=/your/bal/distribution
cd docker
docker-compose up build
```

## Testing introspection (MySql)

### Hospital Test

Run the pull command

```Bash
balx persist pull --host localhost --user root --database hospital --port 3300
```

Enter password

Verify there are no changes in `persist/model.bal` file.

Run the generate command

```Bash
balx persist generate --datastore mysql --module entities
```

Verify there are no changes in `modules/entities`

Run the tests

```Bash
balx test
```

### Hospital Unsupported Test

Run the pull command

```Bash
balx persist pull --host localhost --user root --database hospital_unsupported --port 3300
```

Enter password

Verify there are no changes in `persist/model.bal` file.

Run the generate command

```Bash
balx persist generate --datastore mysql --module entities
```

Verify there are no changes in `modules/entities`

Run the tests

```Bash
balx test
```

## Testing annotations (MsSql and PostgreSql)

### Hospital Test

Run the generate command (remember to use the correct datastore)

```Bash
balx persist generate --datastore mssql --module entities
```

Verify there are no changes in `modules/entities`

Run the tests

```Bash
balx test
```

### Hospital Unsupported Test

Run the generate command (remember to use the correct datastore)

```Bash
balx persist generate --datastore mssql --module entities
```

Verify there are no changes in `modules/entities`

Run the tests

```Bash
balx test
```

## Cleanup

```Bash
cd docker
docker-compose down
```
