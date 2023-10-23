const express = require('express')

if (process.env.NODE_ENV !== 'production') {
    require('dotenv').config()
}

const app = express()

// nested routers
const variantsRouter = require('./routes/variants.js')
const proteinsRouter = require('./routes/proteins.js')

// middleware functions
const errorHandler = require('./middlewares/errorHandler.js')
const logger = require('./middlewares/loggers.js')

// middlewares

// route URLs to routers
app.use('/variants', variantsRouter)
app.use('/proteins', proteinsRouter)

// error handling middleware
// place in the end so it is a final-layer middleware to catch all errors
app.use(errorHandler)

// log normally if no errors
app.use(logger)

app.listen(process.env.PORT, () => {
    console.log(`server started, listening on port ${process.env.PORT}`)
})