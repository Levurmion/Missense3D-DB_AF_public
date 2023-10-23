/*
  Warnings:

  - You are about to drop the `GnomadAF` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `GnomadAF`;

-- CreateTable
CREATE TABLE `GnomadAFg_v_3_1_2` (
    `hgvs_id` VARCHAR(191) NOT NULL,
    `allele_frequency` DECIMAL(10, 10) NOT NULL,

    INDEX `GnomadAFg_v_3_1_2_hgvs_id_idx`(`hgvs_id`),
    PRIMARY KEY (`hgvs_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
