const {PrismaClient} = require('@prisma/client')

function create_global_prisma() {
    globalThis.prisma = new PrismaClient()
    return globalThis.prisma
}

const prisma = globalThis.prisma === undefined ? create_global_prisma() : globalThis.prisma

module.exports = prisma