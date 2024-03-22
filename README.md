# Test suite for Bal Persist CLI

This test suite is prepared to test the newly added annotations for SQL databases and introspection support for `bal persist`.

## Preparation
Create alias for the ballerina distribution built from `persist-tools` and spin up docker containers for databases.
```Bash
alias balx=path/to/your/bal/distribution/bin/bal
cd docker
docker-compose up build
```

## Testing introspection (MySql)

### Hospital Test

Delete `persist` and `modules` directories.

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

Delete `persist` and `modules` directories.

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

Delete the `modules` directory.

Run the generate command (remember to use the correct datastore).

```Bash
balx persist generate --datastore mssql --module entities
```

Verify there are no changes in `modules/entities`

Run the tests

```Bash
balx test
```

### Hospital Unsupported Test

Delete the `modules` directory.

Run the generate command (remember to use the correct datastore).

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
