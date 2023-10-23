/*
  Warnings:

  - You are about to drop the column `ref_allele` on the `GeneticVariants` table. All the data in the column will be lost.
  - You are about to drop the column `var_allele` on the `GeneticVariants` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `GeneticVariants` DROP COLUMN `ref_allele`,
    DROP COLUMN `var_allele`;
