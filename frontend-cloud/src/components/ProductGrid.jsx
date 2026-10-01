import ProductCard from './ProductCard';

export default function ProductGrid({ products }) {
  if (products.length === 0) {
    return (
      <div className="mx-auto max-w-6xl px-4 py-16 text-center sm:px-6 lg:px-8">
        <p className="font-display text-2xl text-mocha">No hay productos en esta categoría</p>
        <p className="mt-2 text-steam">Prueba con otro filtro del menú.</p>
      </div>
    );
  }

  return (
    <section className="mx-auto max-w-6xl px-4 py-8 sm:px-6 sm:py-10 lg:px-8">
      <div className="mb-6 flex items-end justify-between gap-4">
        <div>
          <h2 className="font-display text-2xl font-semibold text-espresso sm:text-3xl">
            Nuestro menú
          </h2>
          <p className="mt-1 text-sm text-steam sm:text-base">
            {products.length} producto{products.length === 1 ? '' : 's'} disponible
            {products.length === 1 ? '' : 's'}
          </p>
        </div>
      </div>

      <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 sm:gap-5 lg:grid-cols-3 xl:grid-cols-4">
        {products.map((product, index) => (
          <ProductCard key={product.id} product={product} index={index} />
        ))}
      </div>
    </section>
  );
}
