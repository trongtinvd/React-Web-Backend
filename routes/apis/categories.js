import {Router} from 'express'
import database from '../../MySQL/database.js'
const router = Router()

router.route('/')
.get(async (req, res) =>{
    const categories = await database.categories()
    res.json(categories)
});

export default router