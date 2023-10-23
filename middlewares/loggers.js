const prisma = require('@singleton/prisma')

async function logger (req, res, next) {
    // run all other middlewares before logging
    const timestamp = new Date().toISOString()
    const requestInfo = {
        url: req.originalUrl.split('?')[0],
        query: req._parsedUrl.query,
        method: req.method,
        response_status_code: res.statusCode,
        timestamp: timestamp
    }

    const prismaResponse = await prisma.requestLogs.create({
        data: requestInfo,
    })
    
    console.log(req.originalUrl, res.statusCode)
}

module.exports = logger