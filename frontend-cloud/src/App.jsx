import { useEffect, useMemo, useState } from 'react';
import Header from './components/Header';
import CategoryFilter from './components/CategoryFilter';
import ProductGrid from './components/ProductGrid';
import LoadingState from './components/LoadingState';
import ErrorState from './components/ErrorState';
import PWABadge from './PWABadge';
import { fetchProducts } from './services/api';

function App() {
  const [products, setProducts] = useState([]);
  const [activeCategory, setActiveCategory] = useState('Todos');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const loadProducts = async () => {
    setLoading(true);
    setError(null);

    try {
      const data = await fetchProducts();
      setProducts(data);
    } catch (err) {
      setError(err.message || 'Error al cargar el menú');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadProducts();
  }, []);

  const categories = useMemo(() => {
    return [...new Set(products.map((product) => product.category))];
  }, [products]);

  const filteredProducts = useMemo(() => {
    if (activeCategory === 'Todos') return products;
    return products.filter((product) => product.category === activeCategory);
  }, [products, activeCategory]);

  return (
    <div className="min-h-screen pb-10">
      <Header />
      <CategoryFilter
        categories={categories}
        activeCategory={activeCategory}
        onChange={setActiveCategory}
      />

      {loading && <LoadingState />}
      {!loading && error && <ErrorState message={error} onRetry={loadProducts} />}
      {!loading && !error && <ProductGrid products={filteredProducts} />}

      <footer className="mx-auto mt-6 max-w-6xl px-4 text-center text-sm text-steam sm:px-6 lg:px-8">
        <p>Café Aroma · PWA · Precios sujetos a disponibilidad</p>
      </footer>

      <PWABadge />
    </div>
  );
}

export default App;
