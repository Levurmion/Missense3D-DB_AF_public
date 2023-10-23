-- CreateTable
CREATE TABLE `Variants` (
    `uniprot` VARCHAR(12) NOT NULL,
    `position` INTEGER NOT NULL,
    `wildtype` VARCHAR(3) NOT NULL,
    `mutant` VARCHAR(3) NOT NULL,
    `hgvs_id` VARCHAR(50) NOT NULL,
    `rs_id` VARCHAR(50) NULL,

    UNIQUE INDEX `Variants_hgvs_id_key`(`hgvs_id`),
    UNIQUE INDEX `Variants_rs_id_key`(`rs_id`),
    INDEX `Variants_uniprot_position_wildtype_mutant_idx`(`uniprot`, `position`, `wildtype`, `mutant`),
    UNIQUE INDEX `Variants_uniprot_position_wildtype_mutant_key`(`uniprot`, `position`, `wildtype`, `mutant`),
    PRIMARY KEY (`uniprot`, `position`, `wildtype`, `mutant`, `hgvs_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Proteins` (
    `uniprot` VARCHAR(12) NOT NULL,
    `gene_name` VARCHAR(191) NOT NULL,
    `protein_name` VARCHAR(191) NOT NULL,
    `length` INTEGER NOT NULL,

    INDEX `Proteins_gene_name_uniprot_idx`(`gene_name`, `uniprot`),
    PRIMARY KEY (`uniprot`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `M3DPredictions` (
    `uniprot` VARCHAR(12) NOT NULL,
    `position` INTEGER NOT NULL,
    `wildtype` VARCHAR(3) NOT NULL,
    `mutant` VARCHAR(3) NOT NULL,
    `damaging` BOOLEAN NOT NULL,
    `disulphide_breakage` BOOLEAN NOT NULL,
    `buried_Pro_introduced` BOOLEAN NOT NULL,
    `clash` BOOLEAN NOT NULL,
    `buried_hydrophilic_introduced` BOOLEAN NOT NULL,
    `buried_charge_introduced` BOOLEAN NOT NULL,
    `secondary_structure_altered` BOOLEAN NOT NULL,
    `buried_charge_switch` BOOLEAN NOT NULL,
    `disallowed_phi_psi` BOOLEAN NOT NULL,
    `buried_charge_replaced` BOOLEAN NOT NULL,
    `buried_Gly_replaced` BOOLEAN NOT NULL,
    `buried_H_bond_breakage` BOOLEAN NOT NULL,
    `buried_salt_bridge_breakage` BOOLEAN NOT NULL,
    `cavity_altered` BOOLEAN NOT NULL,
    `buried_exposed_switch` BOOLEAN NOT NULL,
    `cis_pro_replaced` BOOLEAN NOT NULL,
    `gly_in_a_bend` BOOLEAN NOT NULL,
    `algorithm_version` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `M3DPredictions_uniprot_position_wildtype_mutant_idx`(`uniprot`, `position`, `wildtype`, `mutant`),
    UNIQUE INDEX `M3DPredictions_uniprot_position_wildtype_mutant_algorithm_ve_key`(`uniprot`, `position`, `wildtype`, `mutant`, `algorithm_version`),
    PRIMARY KEY (`uniprot`, `position`, `wildtype`, `mutant`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AlphafoldMetrics` (
    `uniprot` VARCHAR(12) NOT NULL,
    `position` INTEGER NOT NULL,
    `plddt_5A` DECIMAL(6, 3) NOT NULL,
    `pae_5A` DECIMAL(6, 3) NOT NULL,
    `plddt_window_31` DECIMAL(6, 3) NOT NULL,
    `num_neighbours_5A` INTEGER NOT NULL,

    INDEX `AlphafoldMetrics_uniprot_position_idx`(`uniprot`, `position`),
    PRIMARY KEY (`uniprot`, `position`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ClinvarAnnotations` (
    `uniprot` VARCHAR(12) NOT NULL,
    `position` INTEGER NOT NULL,
    `wildtype` VARCHAR(3) NOT NULL,
    `mutant` VARCHAR(3) NOT NULL,
    `annotation` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `ClinvarAnnotations_uniprot_position_wildtype_mutant_idx`(`uniprot`, `position`, `wildtype`, `mutant`),
    PRIMARY KEY (`uniprot`, `position`, `wildtype`, `mutant`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GnomadAF` (
    `hgvs_id` VARCHAR(191) NOT NULL,
    `ref_allele` VARCHAR(10) NOT NULL,
    `var_allele` VARCHAR(10) NOT NULL,
    `allele_frequency` DECIMAL(10, 10) NOT NULL,

    INDEX `GnomadAF_hgvs_id_idx`(`hgvs_id`),
    PRIMARY KEY (`hgvs_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
