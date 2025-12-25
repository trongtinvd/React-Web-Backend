import express from 'express';
import categories from './categories.js';
import products from './products.js';
const router = express.Router()

router.route('/')
    .get((req, res) => {
        res.send('Ecommerce api backend');
    })

router.use('/categories', categories);
router.use('/products', products);

export default router