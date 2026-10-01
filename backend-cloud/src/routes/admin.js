const express = require('express');
const pool = require('../db');
const { ensureProductsTable } = require('../seed');

const router = express.Router();

router.post('/init-db', async (req, res) => {
  const secret = process.env.INIT_SECRET;

  if (!secret) {
    return res.status(503).json({
      error: 'INIT_SECRET no está configurado en el servidor',
    });
  }

  const provided =
    req.get('x-init-secret') ||
    req.body?.secret ||
    req.query?.secret;

  if (provided !== secret) {
    return res.status(401).json({ error: 'No autorizado' });
  }

  try {
    const result = await ensureProductsTable(pool);
    res.json({ ok: true, ...result });
  } catch (error) {
    console.error('Error init-db:', error.message);
    res.status(500).json({
      error: 'No se pudo inicializar la base de datos',
      detail: error.message,
    });
  }
});

module.exports = router;
