"use client";

import { useTheme } from "next-themes";

export default function Navbar() {
  const { resolvedTheme, setTheme } = useTheme();

  return (
    <nav className="flex items-center justify-between px-6 py-4 border-b border-gray-200 dark:border-gray-800">
      <span className="text-xl font-bold tracking-tight">Mealroots</span>
      <button
        onClick={() => setTheme(resolvedTheme === "dark" ? "light" : "dark")}
        className="text-2xl transition-transform hover:scale-110"
        aria-label="Toggle theme"
      >
        {resolvedTheme === "dark" ? "☀️" : "🌙"}
      </button>
    </nav>
  );
}