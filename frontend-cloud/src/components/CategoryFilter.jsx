export default function CategoryFilter({ categories, activeCategory, onChange }) {
  return (
    <div className="sticky top-0 z-20 border-b border-mocha/10 bg-foam/90 backdrop-blur-md">
      <div className="mx-auto flex max-w-6xl gap-2 overflow-x-auto px-4 py-3 sm:px-6 lg:px-8">
        <FilterChip
          label="Todos"
          active={activeCategory === 'Todos'}
          onClick={() => onChange('Todos')}
        />
        {categories.map((category) => (
          <FilterChip
            key={category}
            label={category}
            active={activeCategory === category}
            onClick={() => onChange(category)}
          />
        ))}
      </div>
    </div>
  );
}

function FilterChip({ label, active, onClick }) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={`shrink-0 rounded-full px-4 py-2 text-sm font-medium transition-all duration-200 ${
        active
          ? 'bg-espresso text-foam shadow-md shadow-espresso/20'
          : 'bg-white/70 text-mocha hover:bg-white hover:text-espresso'
      }`}
    >
      {label}
    </button>
  );
}
