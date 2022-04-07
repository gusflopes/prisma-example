## Comandos do Prisma

```bash
# Migrate ambiente dev
npx prisma migrate dev --name XXXX

# Migrate ambiente de prod // Aplica as migrations
# Antes disso tem que fazer um diff
npx prisma migrate deploy

# Abrir o Prisma Studio - usar somente após migration
npx prisma studio

# Generate ERD
npx prisma generate

# Introspect // Gerar schema.prisma com base no banco de dados
yarn prisma introspect

```

## Other generators

## Tabela Pivo entre User e Tenant

### Opção 1

```prisma
model User {
  id       String @id @default(uuid())
  name     String
  email    String @unique
  password String

  created_at DateTime @default(now())
  updated_at DateTime @updatedAt

  tenants Tenant[]

  @@index([name])
  @@map("users")
}

model Tenant {
  id       String    @id @default(uuid())
  name     String
  contacts Contact[]

  users User[]

  @@map("tenants")
}
```

### Opção 2

Vide o código, mas basicamente vc cria uma tabela de relacionamento

```prisma
model Permission {
  // ... auto generated fields
}
model User {
  id String
  // ...
  permissions Permission[]
}
model Tenant {
  id String
  // ...
  permissions Permission[]
}
```
