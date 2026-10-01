export default function ErrorState({ message, onRetry }) {
  return (
    <div className="mx-auto max-w-lg px-4 py-16 text-center sm:px-6">
      <div className="rounded-2xl bg-white/80 p-8 ring-1 ring-mocha/10">
        <h2 className="font-display text-2xl text-espresso">Algo salió mal</h2>
        <p className="mt-2 text-steam">{message}</p>
        <button
          type="button"
          onClick={onRetry}
          className="mt-6 rounded-full bg-espresso px-5 py-2.5 text-sm font-semibold text-foam transition hover:bg-mocha"
        >
          Reintentar
        </button>
      </div>
    </div>
  );
}
