"use client";

export function LoadingSpinner({ message }: { message?: string }) {
  return (
    <div className="flex flex-col items-center justify-center gap-4 py-12">
      <div className="relative w-12 h-12">
        {/* Outer ring */}
        <svg
          className="absolute inset-0 w-full h-full -rotate-90"
          viewBox="0 0 60 60"
        >
          <circle
            cx="30"
            cy="30"
            r="27"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            className="text-gray-200 dark:text-gray-700"
          />
          <circle
            cx="30"
            cy="30"
            r="27"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeDasharray="85 255"
            className="text-orange-500 animate-spin"
            style={{ animationDuration: "1.5s" }}
          />
        </svg>
      </div>

      {message && (
        <p className="text-gray-600 dark:text-gray-400 text-sm font-medium">
          {message}
        </p>
      )}
    </div>
  );
}

export function Skeleton({
  className = "",
  width = "w-full",
  height = "h-4",
}: {
  className?: string;
  width?: string;
  height?: string;
}) {
  return (
    <div
      className={`
        ${width} ${height}
        bg-gray-200 dark:bg-gray-700
        rounded-lg
        animate-pulse
        ${className}
      `}
    />
  );
}
