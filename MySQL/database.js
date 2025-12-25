import mysql from 'mysql2'
import dotenv from 'dotenv'
dotenv.config({ quiet: true })

const HOST = process.env.HOST;
const PORT = process.env.PORT;

const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
}).promise();

console.log('created database pool')

const database = {
    async categories() {
        const query = `select id, name, image from Categories;`
        const [rows, fields] = await pool.query(query)
        return rows
    },

    async getProducts(id) {
        try {
            const query = `
                    select p.id, p.image, p.name, p.description, c.name as category, min(price) as minPrice, variation1, variation2, variation3
                    from products as p
                    join productVariations as pv on p.id = pv.productId
                    join Categories as c on c.id = p.categoryId
                    ${id !== undefined ? 'where p.id = ?' : ''}
                    group by p.id, p.image, p.name, p.description, category;
                `;
            const [rows] = await pool.query(query, [id]);
            return rows.map(entry => ({ ...entry, image: `http://${HOST}:${PORT}${entry.image}` }));
        }
        catch (err) {
            throw new Error(`Error fetching data from database ${err}`);
        }
    },

    async getProductImages(id) {
        try {
            const query = `
                    select image from productImages
                    where productId = ?;
                `;
            const [rows] = await pool.query(query, [id]);
            return rows.filter(x=>x).map(entry => `http://${HOST}:${PORT}${entry.image}`);
        }
        catch (err) {
            throw new Error(`Error fetching data from database ${err}`);
        }
    },

    async getVariations(id) {
        try {
            const query = `
                select price, image, value1, value2, value3 from productVariations
                where productId=?;
            `;
            const [rows] = await pool.query(query, [id]);
            return rows.map(row => ({
                price: row.price,
                image: row.image,
                values: [row.value1, row.value2, row.value3].filter(x=>x),
            }));
        }
        catch (error) {
            throw new Error(`Error fetching data from database ${err}`);
        }
    }
}

export default database;