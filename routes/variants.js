const express = require("express")
const router = express.Router()
const errorBoundary = require('@lib/errorBoundary')

const prisma = require('@singleton/prisma')

router.get('/gene/:gene', errorBoundary(async (req, res) => {

    const gene = req.params.gene
    const { protein_name, exclude_null, clinvar, gnomad } = req.query

    const prismaResponse = await prisma.proteins.findMany({
        select: {
            gene_name: true,
            uniprot: true,
            length: true,
            protein_name: (protein_name === 'true' ? true : false),
            missense_variants: {
                select: {
                    uniprot: false,
                    wildtype: true,
                    mutant: true,
                    position: true,
                    m3d_predictions: {
                        select: {
                            algorithm_version: true,
                            created_at: true,
                            damaging: true,
                            disulphide_breakage: true,
                            buried_Pro_introduced: true,
                            clash: true,
                            buried_hydrophilic_introduced: true,
                            buried_charge_introduced: true,
                            secondary_structure_altered: true,
                            buried_charge_switch: true,
                            disallowed_phi_psi: true,
                            buried_charge_replaced: true,
                            buried_Gly_replaced: true,
                            buried_H_bond_breakage: true,
                            buried_salt_bridge_breakage: true,
                            cavity_altered: true,
                            buried_exposed_switch: true,
                            cis_pro_replaced: true,
                            gly_in_a_bend: true
                        }
                    },
                    alphafold_metrics: {
                        select: {
                            uniprot: false,
                            position: false,
                            plddt_5A: true,
                            plddt_window_31: true,
                            pae_5A: true,
                            num_neighbours_5A: true
                        }
                    },
                    clinvar: (clinvar === 'true' ? {select: {annotation: true}} : undefined),
                    genetic_variants: {
                        select: {
                            hgvs_g: true,
                            rs_id: true,
                            uniprot: false,
                            position: false,
                            wildtype: false,
                            mutant: false,
                            gnomadg_v3_1_2_af: (
                                gnomad === 'true' ?
                                {
                                    select: {
                                        allele_frequency: true,
                                        hgvs_g: false
                                    }
                                } :
                                undefined
                            )
                        }
                    }
                },
                where: {
                    m3d_predictions: exclude_null === 'true' ? { some:{} } : {}
                }
            }
        },
        where: {
            gene_name: {
                contains: gene
            }
        }
    })
    
    if (prismaResponse.length === 0) {
        res.status(204).json({})
    } else {
        res.status(200).json(prismaResponse)
    }

}))


router.get('/uniprot/:uniprot', errorBoundary(async (req, res) => {

    const uniprotId = req.params.uniprot
    const { protein_name, exclude_null, clinvar, gnomad } = req.query

    const prismaResponse = await prisma.proteins.findMany({
        select: {
            gene_name: true,
            uniprot: true,
            length: true,
            protein_name: (protein_name === 'true' ? true : false),
            missense_variants: {
                select: {
                    uniprot: false,
                    wildtype: true,
                    mutant: true,
                    position: true,
                    m3d_predictions: {
                        select: {
                            algorithm_version: true,
                            created_at: true,
                            damaging: true,
                            disulphide_breakage: true,
                            buried_Pro_introduced: true,
                            clash: true,
                            buried_hydrophilic_introduced: true,
                            buried_charge_introduced: true,
                            secondary_structure_altered: true,
                            buried_charge_switch: true,
                            disallowed_phi_psi: true,
                            buried_charge_replaced: true,
                            buried_Gly_replaced: true,
                            buried_H_bond_breakage: true,
                            buried_salt_bridge_breakage: true,
                            cavity_altered: true,
                            buried_exposed_switch: true,
                            cis_pro_replaced: true,
                            gly_in_a_bend: true
                        }
                    },
                    alphafold_metrics: {
                        select: {
                            uniprot: false,
                            position: false,
                            plddt_5A: true,
                            plddt_window_31: true,
                            pae_5A: true,
                            num_neighbours_5A: true
                        }
                    },
                    clinvar: (clinvar === 'true' ? {select: {annotation: true}} : undefined),
                    genetic_variants: {
                        select: {
                            hgvs_g: true,
                            rs_id: true,
                            uniprot: false,
                            position: false,
                            wildtype: false,
                            mutant: false,
                            gnomadg_v3_1_2_af: (
                                gnomad === 'true' ?
                                {
                                    select: {
                                        allele_frequency: true,
                                        hgvs_g: false
                                    }
                                } :
                                undefined
                            )
                        }
                    }
                },
                where: {
                    m3d_predictions: exclude_null === 'true' ? { some:{} } : {}
                }
            }
        },
        where: {
            uniprot: {
                contains: uniprotId
            }
        }
    })
    
    if (prismaResponse.length === 0) {
        res.status(204).json({})
    } else {
        res.status(200).json(prismaResponse)
    }

}))

module.exports = router