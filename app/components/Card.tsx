// components/Card.tsx
"use client";

interface CardProps {
  children: React.ReactNode;
  variant?: "meal" | "category" | "default";
  className?: string;
}

export function Card({ children, variant = "default", className = "" }: CardProps) {
  const variants = {
    meal: "bg-gradient-to-br from-white to-orange-50 dark:from-gray-900 dark:to-gray-800 border-l-4 border-l-orange-500 shadow-md hover:shadow-xl transition-all duration-300",
    category: "bg-white dark:bg-gray-900 border border-gray-100 dark:border-gray-800 shadow-sm hover:shadow-md transition-all",
    default: "bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-800 rounded-2xl",
  };

  return (
    <div className={`rounded-2xl p-5 ${variants[variant]} ${className}`}>
      {children}
    </div>
  );
}