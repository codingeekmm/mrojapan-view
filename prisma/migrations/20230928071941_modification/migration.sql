/*
  Warnings:

  - The primary key for the `loginuser_role` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `loginuser` on the `loginuser_role` table. All the data in the column will be lost.
  - You are about to drop the column `role` on the `loginuser_role` table. All the data in the column will be lost.
  - The primary key for the `role_screen` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `role` on the `role_screen` table. All the data in the column will be lost.
  - You are about to drop the column `screen` on the `role_screen` table. All the data in the column will be lost.
  - The primary key for the `screen_component` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `component` on the `screen_component` table. All the data in the column will be lost.
  - You are about to drop the column `screen` on the `screen_component` table. All the data in the column will be lost.
  - You are about to drop the `Company` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Component` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Loginuser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Role` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `loginuser_id` to the `loginuser_role` table without a default value. This is not possible if the table is not empty.
  - Added the required column `role_id` to the `loginuser_role` table without a default value. This is not possible if the table is not empty.
  - Added the required column `role_id` to the `role_screen` table without a default value. This is not possible if the table is not empty.
  - Added the required column `screen_id` to the `role_screen` table without a default value. This is not possible if the table is not empty.
  - Added the required column `component_id` to the `screen_component` table without a default value. This is not possible if the table is not empty.
  - Added the required column `screen_id` to the `screen_component` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Loginuser" DROP CONSTRAINT "Loginuser_companyId_fkey";

-- DropForeignKey
ALTER TABLE "loginuser_role" DROP CONSTRAINT "loginuser_role_loginuser_fkey";

-- DropForeignKey
ALTER TABLE "loginuser_role" DROP CONSTRAINT "loginuser_role_role_fkey";

-- DropForeignKey
ALTER TABLE "role_screen" DROP CONSTRAINT "role_screen_loginuserId_fkey";

-- DropForeignKey
ALTER TABLE "role_screen" DROP CONSTRAINT "role_screen_role_fkey";

-- DropForeignKey
ALTER TABLE "role_screen" DROP CONSTRAINT "role_screen_screen_fkey";

-- DropForeignKey
ALTER TABLE "screen_component" DROP CONSTRAINT "screen_component_component_fkey";

-- DropForeignKey
ALTER TABLE "screen_component" DROP CONSTRAINT "screen_component_screen_fkey";

-- AlterTable
ALTER TABLE "loginuser_role" DROP CONSTRAINT "loginuser_role_pkey",
DROP COLUMN "loginuser",
DROP COLUMN "role",
ADD COLUMN     "loginuser_id" TEXT NOT NULL,
ADD COLUMN     "role_id" TEXT NOT NULL,
ADD CONSTRAINT "loginuser_role_pkey" PRIMARY KEY ("role_id", "loginuser_id");

-- AlterTable
ALTER TABLE "role_screen" DROP CONSTRAINT "role_screen_pkey",
DROP COLUMN "role",
DROP COLUMN "screen",
ADD COLUMN     "role_id" TEXT NOT NULL,
ADD COLUMN     "screen_id" TEXT NOT NULL,
ADD CONSTRAINT "role_screen_pkey" PRIMARY KEY ("role_id", "screen_id");

-- AlterTable
ALTER TABLE "screen_component" DROP CONSTRAINT "screen_component_pkey",
DROP COLUMN "component",
DROP COLUMN "screen",
ADD COLUMN     "component_id" TEXT NOT NULL,
ADD COLUMN     "screen_id" TEXT NOT NULL,
ADD CONSTRAINT "screen_component_pkey" PRIMARY KEY ("screen_id", "component_id");

-- DropTable
DROP TABLE "Company";

-- DropTable
DROP TABLE "Component";

-- DropTable
DROP TABLE "Loginuser";

-- DropTable
DROP TABLE "Role";

-- CreateTable
CREATE TABLE "company" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "company_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "loginuser" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "companyId" TEXT NOT NULL,

    CONSTRAINT "loginuser_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "component" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "component_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "loginuser" ADD CONSTRAINT "loginuser_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_screen" ADD CONSTRAINT "role_screen_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_screen" ADD CONSTRAINT "role_screen_screen_id_fkey" FOREIGN KEY ("screen_id") REFERENCES "Screen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "role_screen" ADD CONSTRAINT "role_screen_loginuserId_fkey" FOREIGN KEY ("loginuserId") REFERENCES "loginuser"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "screen_component" ADD CONSTRAINT "screen_component_screen_id_fkey" FOREIGN KEY ("screen_id") REFERENCES "Screen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "screen_component" ADD CONSTRAINT "screen_component_component_id_fkey" FOREIGN KEY ("component_id") REFERENCES "component"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "loginuser_role" ADD CONSTRAINT "loginuser_role_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "loginuser_role" ADD CONSTRAINT "loginuser_role_loginuser_id_fkey" FOREIGN KEY ("loginuser_id") REFERENCES "loginuser"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
