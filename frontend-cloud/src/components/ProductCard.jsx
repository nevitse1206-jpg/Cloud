import { formatPrice } from '../services/api';

export default function ProductCard({ product, index }) {
  return (
    <article
      className="animate-fade-up group flex flex-col overflow-hidden rounded-2xl bg-white/75 shadow-sm shadow-espresso/5 ring-1 ring-mocha/10 transition duration-300 hover:-translate-y-1 hover:shadow-lg hover:shadow-espresso/10"
      style={{ animationDelay: `${Math.min(index, 8) * 50}ms` }}
    >
      <div className="relative aspect-[4/3] overflow-hidden bg-latte">
        <img
          src={product.imageUrl}
          alt={product.name}
          loading="lazy"
          className="h-full w-full object-cover transition duration-500 group-hover:scale-105"
        />
        <span className="absolute left-3 top-3 rounded-full bg-espresso/85 px-3 py-1 text-xs font-medium text-foam backdrop-blur-sm">
          {product.category}
        </span>
      </div>

      <div className="flex flex-1 flex-col gap-2 p-4 sm:p-5">
        <div className="flex items-start justify-between gap-3">
          <h3 className="font-display text-lg font-semibold text-espresso sm:text-xl">
            {product.name}
          </h3>
          <p className="shrink-0 text-base font-bold text-caramel sm:text-lg">
            {formatPrice(product.price)}
          </p>
        </div>
        <p className="text-sm leading-relaxed text-steam">{product.description}</p>
      </div>
    </article>
  );
}
