/*
  Warnings:

  - The primary key for the `Variants` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropIndex
DROP INDEX `Variants_hgvs_id_key` ON `Variants`;

-- DropIndex
DROP INDEX `Variants_uniprot_position_wildtype_mutant_hgvs_id_key` ON `Variants`;

-- AlterTable
ALTER TABLE `Variants` DROP PRIMARY KEY,
    ADD PRIMARY KEY (`hgvs_id`);
