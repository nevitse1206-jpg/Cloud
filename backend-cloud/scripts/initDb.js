const pool = require('../src/db');
const { ensureProductsTable } = require('../src/seed');

ensureProductsTable(pool)
  .then(async (result) => {
    console.log(result.message);
    await pool.end();
  })
  .catch(async (error) => {
    console.error('Error al inicializar la base de datos:', error.message);
    try {
      await pool.end();
    } catch (_) {
      /* ignore */
    }
    process.exit(1);
  });
