"use client";

interface ContainerProps {
  children: React.ReactNode;
  className?: string;
  maxWidth?: "sm" | "md" | "lg" | "xl" | "2xl";
}

const maxWidths = {
  sm: "max-w-sm",
  md: "max-w-2xl",
  lg: "max-w-4xl",
  xl: "max-w-6xl",
  "2xl": "max-w-7xl",
};

export function Container({
  children,
  className = "",
  maxWidth = "lg",
}: ContainerProps) {
  return (
    <div className={`w-full px-4 ${maxWidths[maxWidth]} mx-auto ${className}`}>
      {children}
    </div>
  );
}
