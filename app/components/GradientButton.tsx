// components/GradientButton.tsx
"use client";

export function GradientButton({ 
  children, 
  onClick, 
  className = "",
  type = "button" 
}: { 
  children: React.ReactNode; 
  onClick?: () => void; 
  className?: string;
  type?: "button" | "submit";
}) {
  return (
    <button
      type={type}
      onClick={onClick}
      className={`relative overflow-hidden bg-gradient-to-r from-orange-500 to-orange-600 hover:from-orange-600 hover:to-orange-700 text-white font-bold py-4 rounded-full transition-all duration-300 transform hover:scale-[1.02] active:scale-[0.98] shadow-lg hover:shadow-orange-500/25 ${className}`}
    >
      <span className="relative z-10">{children}</span>
      <div className="absolute inset-0 bg-gradient-to-r from-orange-600 to-orange-700 opacity-0 hover:opacity-100 transition-opacity duration-300" />
    </button>
  );
}