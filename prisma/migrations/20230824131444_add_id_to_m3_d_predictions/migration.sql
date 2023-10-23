/*
  Warnings:

  - The primary key for the `M3DPredictions` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `alt_allele` to the `GnomadAFg_v_3_1_2` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ref_allele` to the `GnomadAFg_v_3_1_2` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `M3DPredictions` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `GnomadAFg_v_3_1_2` ADD COLUMN `alt_allele` CHAR(1) NOT NULL,
    ADD COLUMN `ref_allele` CHAR(1) NOT NULL;

-- AlterTable
ALTER TABLE `M3DPredictions` DROP PRIMARY KEY,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- CreateIndex
CREATE INDEX `M3DPredictions_algorithm_version_idx` ON `M3DPredictions`(`algorithm_version`);
