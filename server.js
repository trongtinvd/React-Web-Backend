import express from 'express'
import cors from "cors"
import cookieParser from "cookie-parser"
import api from './routes/apis/api.js'
import dotenv from 'dotenv'
dotenv.config({ quiet: true });
const PORT = process.env.PORT || 3000
const app = express()

app.use(cookieParser())
app.use(cors())
app.use(express.json())
app.use('/api', api)
app.use(express.static('public'));
app.use((err, req, res, next) => {
    if (err.status === 400) {
        res.status(err.status).send(err.message);
        return;
    }
    console.error(err.stack)
    res.status(500).send('Unknown error');
})

app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`)
});