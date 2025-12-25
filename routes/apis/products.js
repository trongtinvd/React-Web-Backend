import { Router } from 'express';
import database from '../../MySQL/database.js';
const router = Router();

router.route('/')
    .get(async (req, res) => {
        const data = await database.getProducts()
        res.status(200).json(data);
    });

router.route('/:id')
    .get(async (req, res) => {
        const id = parseInt(req.params.id);
        if (isNaN(id)) {
            const error = new Error();
            error.message = `Product id must be a number. Received id is: ${req.params.id}`;
            error.status = 400;
            throw error;
        }

        const product = (await database.getProducts(id))[0];
        const images = await database.getProductImages(id);
        const variations = await database.getVariations(id);

        res.status(200).send({
            id: product.id,
            image: product.image,
            name: product.name,
            description: product.description,
            category: product.category,
            minPrice: product.minPrice,
            variationNames: [product.variation1, product.variation2, product.variation3].filter(x=>x),
            images,
            variations
        });
    });

export default router;