function errorBoundary (callback) {

    async function errorWrappedCallback (req, res, next) {
        try {
            await callback(req, res)
            next()
        } catch (err) {
            next(err)
        }
    }

    return errorWrappedCallback

}

module.exports = errorBoundary