/*
  Warnings:

  - The `role` column on the `permissions` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "RolePermission" AS ENUM ('OWNER', 'ADMIN', 'USER', 'CLIENT');

-- AlterTable
ALTER TABLE "permissions" DROP COLUMN "role",
ADD COLUMN     "role" "RolePermission" NOT NULL DEFAULT E'CLIENT';
