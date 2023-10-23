/*
  Warnings:

  - The primary key for the `GeneticVariants` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `hgvs_id` on the `GeneticVariants` table. All the data in the column will be lost.
  - The primary key for the `GnomadAFg_v_3_1_2` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `hgvs_id` on the `GnomadAFg_v_3_1_2` table. All the data in the column will be lost.
  - Added the required column `hgvs_g` to the `GeneticVariants` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hgvs_g` to the `GnomadAFg_v_3_1_2` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `GnomadAFg_v_3_1_2_hgvs_id_idx` ON `GnomadAFg_v_3_1_2`;

-- AlterTable
ALTER TABLE `GeneticVariants` DROP PRIMARY KEY,
    DROP COLUMN `hgvs_id`,
    ADD COLUMN `hgvs_g` VARCHAR(100) NOT NULL,
    ADD PRIMARY KEY (`hgvs_g`);

-- AlterTable
ALTER TABLE `GnomadAFg_v_3_1_2` DROP PRIMARY KEY,
    DROP COLUMN `hgvs_id`,
    ADD COLUMN `hgvs_g` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`hgvs_g`);

-- CreateIndex
CREATE INDEX `GnomadAFg_v_3_1_2_hgvs_g_idx` ON `GnomadAFg_v_3_1_2`(`hgvs_g`);
