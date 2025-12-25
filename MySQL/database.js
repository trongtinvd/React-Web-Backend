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

    async getProducts() {
        try {
            const query = `
            select p.id, p.image as image, p.name, p.description, min(pv.price) as price from products as p
            join productVariations as pv on p.id = pv.productId
            group by p.id, p.image, p.name, p.description;
        `;
            const [rows] = await pool.query(query);
            return rows.map(entry => ({ ...entry, image: `http://${HOST}:${PORT}${entry.image}` }));
        }
        catch (err) {
            throw new Error(`Error fetching data from database ${err}`)
        }
    },
}

export default database;