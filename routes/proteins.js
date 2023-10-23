const express = require("express")
const router = express.Router()
const errorBoundary = require('../lib/errorBoundary')

const prisma = require('@singleton/prisma')

router.get('/:string', errorBoundary(async (req, res) => {

    // prevent search with 'HUMAN' in the string as all gene names have '_HUMAN' suffix
    const searchString = req.params.string.toUpperCase().replace('HUMAN','')

    if (searchString === '') {
        res.status(204).json({})
    }

    const prismaResponse = await prisma.proteins.findMany({
        select: {
            gene_name: true,
            uniprot: true,
            length: true,
            protein_name: true,
            variants: false
        },
        where: {
            OR: [
                {
                    uniprot: {
                        contains: searchString
                    }
                },
                {
                    gene_name: {
                        contains: searchString
                    }
                },
                {
                    protein_name: {
                        contains: searchString
                    }
                }
            ]
        }
    })

    if (prismaResponse.length === 0) {
        res.status(204).json({})
    } else {
        res.status(200).json(prismaResponse)
    }

}))

module.exports = router