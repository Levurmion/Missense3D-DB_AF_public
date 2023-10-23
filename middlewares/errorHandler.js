const prisma = require('@singleton/prisma')

async function errorHandler (error, req, res, next) {

    res.status(500)

    const timestamp = new Date().toISOString()
    const requestInfo = {
        url: req.originalUrl.split('?')[0],
        query: req._parsedUrl.query,
        method: req.method,
        response_status_code: res.statusCode,
        timestamp: timestamp
    }
    const errorInfo = {
        stack_trace: error.stack,
        message: error.message
    }

    const prismaResponse = await prisma.requestLogs.create({
        data: {
            ...requestInfo,
            error_log: {
                create: errorInfo
            }
        },
        include: {
            error_log: true
        }
    })

    console.log(req.originalUrl, res.statusCode, 'Error Logged')

    res.send()

}

module.exports = errorHandler