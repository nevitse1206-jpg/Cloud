const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:3001/api';

export async function fetchProducts() {
  const response = await fetch(`${API_URL}/products`);

  if (!response.ok) {
    throw new Error('No se pudieron cargar los productos');
  }

  return response.json();
}

export async function fetchCategories() {
  const response = await fetch(`${API_URL}/products/categories`);

  if (!response.ok) {
    throw new Error('No se pudieron cargar las categorías');
  }

  return response.json();
}

export function formatPrice(value) {
  return new Intl.NumberFormat('es-CO', {
    style: 'currency',
    currency: 'COP',
    maximumFractionDigits: 0,
  }).format(Number(value));
}
