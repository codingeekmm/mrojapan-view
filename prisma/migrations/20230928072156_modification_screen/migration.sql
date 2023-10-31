/*
  Warnings:

  - You are about to drop the `Screen` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "role_screen" DROP CONSTRAINT "role_screen_screen_id_fkey";

-- DropForeignKey
ALTER TABLE "screen_component" DROP CONSTRAINT "screen_component_screen_id_fkey";

-- DropTable
DROP TABLE "Screen";

-- CreateTable
CREATE TABLE "screen" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "screen_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "role_screen" ADD CONSTRAINT "role_screen_screen_id_fkey" FOREIGN KEY ("screen_id") REFERENCES "screen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "screen_component" ADD CONSTRAINT "screen_component_screen_id_fkey" FOREIGN KEY ("screen_id") REFERENCES "screen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
