export default function LoadingState() {
  return (
    <div className="mx-auto grid max-w-6xl grid-cols-1 gap-4 px-4 py-10 sm:grid-cols-2 sm:px-6 lg:grid-cols-3 lg:px-8 xl:grid-cols-4">
      {Array.from({ length: 8 }).map((_, index) => (
        <div
          key={index}
          className="animate-soft-pulse overflow-hidden rounded-2xl bg-white/60 ring-1 ring-mocha/10"
        >
          <div className="aspect-[4/3] bg-latte/70" />
          <div className="space-y-3 p-4">
            <div className="h-5 w-2/3 rounded bg-latte/80" />
            <div className="h-4 w-full rounded bg-latte/60" />
            <div className="h-4 w-4/5 rounded bg-latte/60" />
          </div>
        </div>
      ))}
    </div>
  );
}
