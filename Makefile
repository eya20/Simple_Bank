postgres: ; docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=Ayou -e POSTGRES_PASSWORD=ayou2312 -d postgres:12-alpine
createdb: ;docker exec -it postgres12 createdb --username=Ayou --owner=Ayou simple_bank
dropdb: ; docker exec -it postgres12 dropdb --username=Ayou simple_bank
migrationup: ; migrate -path db/migrations -database "postgresql://Ayou:ayou2312@localhost:5432/simple_bank?sslmode=disable" -verbose up
migrationdown: ; migrate -path db/migrations -database "postgresql://Ayou:ayou2312@localhost:5432/simple_bank?sslmode=disable" -verbose down
sqlc: ; docker run --rm -v "$(CURDIR):/src" -w //src kjconroy/sqlc generate
.PHONY:  postgres createdb dropdb migrationup migrationdown sqlc