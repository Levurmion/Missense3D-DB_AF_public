/*
  Warnings:

  - You are about to drop the column `alt_allele` on the `GnomadAFg_v_3_1_2` table. All the data in the column will be lost.
  - You are about to drop the column `ref_allele` on the `GnomadAFg_v_3_1_2` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `GnomadAFg_v_3_1_2` DROP COLUMN `alt_allele`,
    DROP COLUMN `ref_allele`;
