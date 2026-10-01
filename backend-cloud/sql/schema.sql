CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  category VARCHAR(80) NOT NULL,
  image_url VARCHAR(500),
  available TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (name, description, price, category, image_url) VALUES
('Espresso', 'Shot intenso y aromático de café 100% arábica.', 4500, 'Café', 'https://images.unsplash.com/photo-1510590337019-5ef8d3d32116?w=600&q=80'),
('Americano', 'Espresso suavizado con agua caliente.', 5000, 'Café', 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=600&q=80'),
('Cappuccino', 'Espresso, leche vaporizada y espuma cremosa.', 6500, 'Café', 'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=600&q=80'),
('Latte', 'Café suave con abundante leche vaporizada.', 7000, 'Café', 'https://images.unsplash.com/photo-1561882468-9110e03e0f78?w=600&q=80'),
('Mocha', 'Espresso, chocolate y leche vaporizada.', 7500, 'Café', 'https://images.unsplash.com/photo-1578314675249-a69172fbbac4?w=600&q=80'),
('Cold Brew', 'Infusión fría de 12 horas, refrescante y suave.', 8000, 'Bebidas frías', 'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=600&q=80'),
('Frappé de Caramelo', 'Bebida helada batida con caramelo y crema.', 8500, 'Bebidas frías', 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=600&q=80'),
('Té Matcha Latte', 'Matcha ceremonial con leche cremosa.', 7800, 'Té', 'https://images.unsplash.com/photo-1515823662972-da6a2e4d3000?w=600&q=80'),
('Té Chai', 'Mezcla de especias indias con leche vaporizada.', 6800, 'Té', 'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=600&q=80'),
('Croissant de Mantequilla', 'Hojaldre francés recién horneado.', 5500, 'Panadería', 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=600&q=80'),
('Muffin de Arándanos', 'Esponjoso, con arándanos frescos.', 5000, 'Panadería', 'https://images.unsplash.com/photo-1607958996333-41aef7caefaa?w=600&q=80'),
('Brownie de Chocolate', 'Intenso, con nueces y chocolate belga.', 6000, 'Postres', 'https://images.unsplash.com/photo-1564355808539-22fda35bed7e?w=600&q=80'),
('Cheesecake', 'Tarta de queso cremosa con salsa de frutos rojos.', 9000, 'Postres', 'https://images.unsplash.com/photo-1533134242443-d4fd215305ad?w=600&q=80'),
('Sandwich Club', 'Pollo, tocino, lechuga y tomate en pan artesanal.', 12000, 'Comida', 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=600&q=80'),
('Ensalada César', 'Lechuga romana, pollo, crotones y aderezo César.', 11000, 'Comida', 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=600&q=80');
