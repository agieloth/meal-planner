// components/AnimatedProgress.tsx
export function AnimatedProgress() {
  return (
    <div className="flex flex-col items-center gap-6">
      <div className="relative">
        <div className="w-20 h-20 border-4 border-orange-200 dark:border-orange-900 rounded-full" />
        <div className="absolute top-0 left-0 w-20 h-20 border-4 border-orange-500 rounded-full animate-spin border-t-transparent" />
      </div>
      <div className="space-y-2 text-center">
        <p className="text-gray-600 dark:text-gray-300 font-medium">
          On prépare ton plan personnalisé...
        </p>
        <p className="text-sm text-orange-500 animate-pulse">
          Ça prends quelques secondes
        </p>
      </div>
    </div>
  );
}