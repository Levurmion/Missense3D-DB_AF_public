/*
  Warnings:

  - A unique constraint covering the columns `[uniprot,position,wildtype,mutant,hgvs_id]` on the table `Variants` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Variants_uniprot_position_wildtype_mutant_hgvs_id_key` ON `Variants`(`uniprot`, `position`, `wildtype`, `mutant`, `hgvs_id`);
