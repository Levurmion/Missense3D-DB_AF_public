/*
  Warnings:

  - The primary key for the `GeneticVariants` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE `GeneticVariants` DROP PRIMARY KEY,
    MODIFY `hgvs_id` VARCHAR(100) NOT NULL,
    ADD PRIMARY KEY (`hgvs_id`);
