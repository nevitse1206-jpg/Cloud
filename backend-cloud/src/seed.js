const SEED_PRODUCTS = [
  {
    name: 'Espresso',
    description: 'Shot intenso y aromático de café 100% arábica.',
    price: 4500,
    category: 'Café',
    image_url: 'https://images.unsplash.com/photo-1510590337019-5ef8d3d32116?w=600&q=80',
  },
  {
    name: 'Americano',
    description: 'Espresso suavizado con agua caliente.',
    price: 5000,
    category: 'Café',
    image_url: 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=600&q=80',
  },
  {
    name: 'Cappuccino',
    description: 'Espresso, leche vaporizada y espuma cremosa.',
    price: 6500,
    category: 'Café',
    image_url: 'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=600&q=80',
  },
  {
    name: 'Latte',
    description: 'Café suave con abundante leche vaporizada.',
    price: 7000,
    category: 'Café',
    image_url: 'https://images.unsplash.com/photo-1561882468-9110e03e0f78?w=600&q=80',
  },
  {
    name: 'Mocha',
    description: 'Espresso, chocolate y leche vaporizada.',
    price: 7500,
    category: 'Café',
    image_url: 'https://images.unsplash.com/photo-1578314675249-a69172fbbac4?w=600&q=80',
  },
  {
    name: 'Cold Brew',
    description: 'Infusión fría de 12 horas, refrescante y suave.',
    price: 8000,
    category: 'Bebidas frías',
    image_url: 'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=600&q=80',
  },
  {
    name: 'Frappé de Caramelo',
    description: 'Bebida helada batida con caramelo y crema.',
    price: 8500,
    category: 'Bebidas frías',
    image_url: 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=600&q=80',
  },
  {
    name: 'Té Matcha Latte',
    description: 'Matcha ceremonial con leche cremosa.',
    price: 7800,
    category: 'Té',
    image_url: 'https://images.unsplash.com/photo-1515823662972-da6a2e4d3000?w=600&q=80',
  },
  {
    name: 'Té Chai',
    description: 'Mezcla de especias indias con leche vaporizada.',
    price: 6800,
    category: 'Té',
    image_url: 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=600&q=80',
  },
  {
    name: 'Croissant de Mantequilla',
    description: 'Hojaldre francés recién horneado.',
    price: 5500,
    category: 'Panadería',
    image_url: 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=600&q=80',
  },
  {
    name: 'Muffin de Arándanos',
    description: 'Esponjoso, con arándanos frescos.',
    price: 5000,
    category: 'Panadería',
    image_url: 'https://images.unsplash.com/photo-1607958996333-41aef7caefaa?w=600&q=80',
  },
  {
    name: 'Brownie de Chocolate',
    description: 'Intenso, con nueces y chocolate belga.',
    price: 6000,
    category: 'Postres',
    image_url: 'https://images.unsplash.com/photo-1564355808539-22fda35bed7e?w=600&q=80',
  },
  {
    name: 'Cheesecake',
    description: 'Tarta de queso cremosa con salsa de frutos rojos.',
    price: 9000,
    category: 'Postres',
    image_url: 'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?w=600&q=80',
  },
  {
    name: 'Sandwich Club',
    description: 'Pollo, tocino, lechuga y tomate en pan artesanal.',
    price: 12000,
    category: 'Comida',
    image_url: 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=600&q=80',
  },
  {
    name: 'Ensalada César',
    description: 'Lechuga romana, pollo, crotones y aderezo César.',
    price: 11000,
    category: 'Comida',
    image_url: 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=600&q=80',
  },
];

async function ensureProductsTable(pool) {
  const connection = await pool.getConnection();

  try {
    await connection.query(`
      CREATE TABLE IF NOT EXISTS products (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(120) NOT NULL,
        description TEXT,
        price DECIMAL(10, 2) NOT NULL,
        category VARCHAR(80) NOT NULL,
        image_url VARCHAR(500),
        available TINYINT(1) NOT NULL DEFAULT 1,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      )
    `);

    const [existing] = await connection.query('SELECT COUNT(*) AS total FROM products');

    if (existing[0].total > 0) {
      return {
        created: false,
        inserted: 0,
        total: existing[0].total,
        message: `La tabla ya tiene ${existing[0].total} productos.`,
      };
    }

    for (const product of SEED_PRODUCTS) {
      await connection.query(
        `INSERT INTO products (name, description, price, category, image_url)
         VALUES (:name, :description, :price, :category, :image_url)`,
        product
      );
    }

    return {
      created: true,
      inserted: SEED_PRODUCTS.length,
      total: SEED_PRODUCTS.length,
      message: `Se insertaron ${SEED_PRODUCTS.length} productos.`,
    };
  } finally {
    connection.release();
  }
}

module.exports = {
  SEED_PRODUCTS,
  ensureProductsTable,
};
