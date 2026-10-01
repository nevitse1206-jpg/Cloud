export default function Header() {
  return (
    <header className="relative overflow-hidden border-b border-mocha/10">
      <div
        className="absolute inset-0 bg-cover bg-center"
        style={{
          backgroundImage:
            "url('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=1600&q=80')",
        }}
        aria-hidden="true"
      />
      <div className="absolute inset-0 bg-gradient-to-r from-espresso/92 via-espresso/80 to-mocha/70" />

      <div className="relative mx-auto flex max-w-6xl flex-col gap-6 px-4 py-10 sm:px-6 sm:py-14 md:flex-row md:items-end md:justify-between lg:px-8 lg:py-16">
        <div className="animate-fade-up max-w-xl">
          <p className="mb-2 text-sm font-medium uppercase tracking-[0.22em] text-latte/80">
            Especialidad · Local
          </p>
          <h1 className="font-display text-4xl font-bold leading-tight text-foam sm:text-5xl lg:text-6xl">
            Café Aroma
          </h1>
          <p className="mt-3 max-w-md text-base text-latte/90 sm:text-lg">
            Descubre nuestro menú con precios actualizados. Perfecto para pedir en mesa o desde tu
            celular.
          </p>
        </div>

        <div
          className="animate-fade-up flex gap-6 rounded-2xl border border-white/15 bg-white/10 px-5 py-4 text-foam backdrop-blur-sm"
          style={{ animationDelay: '120ms' }}
        >
          <div>
            <p className="text-xs uppercase tracking-wider text-latte/70">Horario</p>
            <p className="mt-1 text-sm font-semibold sm:text-base">Lun–Dom 7:00–20:00</p>
          </div>
          <div className="w-px bg-white/20" />
          <div>
            <p className="text-xs uppercase tracking-wider text-latte/70">Instala la app</p>
            <p className="mt-1 text-sm font-semibold sm:text-base">PWA disponible</p>
          </div>
        </div>
      </div>
    </header>
  );
}
