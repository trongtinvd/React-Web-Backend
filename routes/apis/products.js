import { Router } from 'express';
import database from '../../MySQL/database.js';
const router = Router();

router.route('/')
    .get(async (req, res) => {
        const data = await database.getProducts()
        res.status(200).json(data);
    })

export default router;