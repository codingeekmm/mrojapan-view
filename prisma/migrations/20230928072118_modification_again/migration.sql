/*
  Warnings:

  - You are about to drop the column `companyId` on the `loginuser` table. All the data in the column will be lost.
  - Added the required column `company_id` to the `loginuser` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "loginuser" DROP CONSTRAINT "loginuser_companyId_fkey";

-- AlterTable
ALTER TABLE "loginuser" DROP COLUMN "companyId",
ADD COLUMN     "company_id" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "loginuser" ADD CONSTRAINT "loginuser_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
