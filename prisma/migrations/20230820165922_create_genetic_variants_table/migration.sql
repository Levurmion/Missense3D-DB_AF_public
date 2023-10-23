/*
  Warnings:

  - You are about to drop the column `ref_allele` on the `GnomadAF` table. All the data in the column will be lost.
  - You are about to drop the column `var_allele` on the `GnomadAF` table. All the data in the column will be lost.
  - You are about to drop the `Variants` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE `GnomadAF` DROP COLUMN `ref_allele`,
    DROP COLUMN `var_allele`;

-- DropTable
DROP TABLE `Variants`;

-- CreateTable
CREATE TABLE `MissenseVariants` (
    `uniprot` VARCHAR(12) NOT NULL,
    `position` INTEGER NOT NULL,
    `wildtype` VARCHAR(3) NOT NULL,
    `mutant` VARCHAR(3) NOT NULL,

    INDEX `MissenseVariants_uniprot_position_wildtype_mutant_idx`(`uniprot`, `position`, `wildtype`, `mutant`),
    UNIQUE INDEX `MissenseVariants_uniprot_position_wildtype_mutant_key`(`uniprot`, `position`, `wildtype`, `mutant`),
    PRIMARY KEY (`uniprot`, `position`, `wildtype`, `mutant`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GeneticVariants` (
    `hgvs_id` VARCHAR(50) NOT NULL,
    `rs_id` VARCHAR(20) NOT NULL,
    `ref_allele` VARCHAR(10) NOT NULL,
    `var_allele` VARCHAR(10) NOT NULL,
    `uniprot` VARCHAR(12) NOT NULL,
    `position` INTEGER NOT NULL,
    `wildtype` VARCHAR(3) NOT NULL,
    `mutant` VARCHAR(3) NOT NULL,

    INDEX `GeneticVariants_uniprot_position_wildtype_mutant_idx`(`uniprot`, `position`, `wildtype`, `mutant`),
    PRIMARY KEY (`hgvs_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
