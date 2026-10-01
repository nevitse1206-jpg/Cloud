const express = require('express');
const pool = require('../db');

const router = express.Router();

router.get('/', async (_req, res) => {
  try {
    const [rows] = await pool.query(
      `SELECT id, name, description, price, category, image_url AS imageUrl, available
       FROM products
       WHERE available = 1
       ORDER BY category, name`
    );
    res.json(rows);
  } catch (error) {
    console.error('Error fetching products:', error.message);
    res.status(500).json({ error: 'No se pudieron obtener los productos' });
  }
});

router.get('/categories', async (_req, res) => {
  try {
    const [rows] = await pool.query(
      `SELECT DISTINCT category
       FROM products
       WHERE available = 1
       ORDER BY category`
    );
    res.json(rows.map((row) => row.category));
  } catch (error) {
    console.error('Error fetching categories:', error.message);
    res.status(500).json({ error: 'No se pudieron obtener las categorías' });
  }
});

router.get('/:id', async (req, res) => {
  try {
    const [rows] = await pool.query(
      `SELECT id, name, description, price, category, image_url AS imageUrl, available
       FROM products
       WHERE id = :id`,
      { id: req.params.id }
    );

    if (rows.length === 0) {
      return res.status(404).json({ error: 'Producto no encontrado' });
    }

    res.json(rows[0]);
  } catch (error) {
    console.error('Error fetching product:', error.message);
    res.status(500).json({ error: 'No se pudo obtener el producto' });
  }
});

module.exports = router;
