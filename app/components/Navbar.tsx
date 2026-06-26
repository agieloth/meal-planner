// "use client";

// import { useTheme } from "next-themes";
// import Link from "next/link";
// import { usePathname } from "next/navigation";

// export default function Navbar() {
//   const { resolvedTheme, setTheme } = useTheme();
//   const pathname = usePathname();
//   const isHome = pathname === "/";

//   return (
//     <nav className="flex items-center justify-between px-6 py-4 border-b border-gray-200 dark:border-gray-800">
//       <Link
//         href="/"
//         className="text-xl font-bold tracking-tight hover:text-orange-500 transition-colors"
//       >
//         Mealroots
//       </Link>

//       <div className="flex items-center gap-4">
//         {!isHome && (
//           <Link
//             href="/preferences"
//             className="text-sm font-medium text-gray-500 dark:text-gray-400 hover:text-orange-500 transition-colors"
//           >
//             Nouveau plan
//           </Link>
//         )}
//         <button
//           onClick={() => setTheme(resolvedTheme === "dark" ? "light" : "dark")}
//           className="text-2xl transition-transform hover:scale-110"
//           aria-label="Toggle theme"
//         >
//           {resolvedTheme === "dark" ? "☀️" : "🌙"}
//         </button>
//       </div>
//     </nav>
//   );
// }

"use client";

import { useEffect, useState } from "react";
import { useTheme } from "next-themes";
import Link from "next/link";
import { usePathname } from "next/navigation";

export default function Navbar() {
  const { resolvedTheme, setTheme } = useTheme();
  const pathname = usePathname();
  const isHome = pathname === "/";
  const [isMounted, setIsMounted] = useState(false);

  useEffect(() => {
    setIsMounted(true);
  }, []);

  return (
    <nav
      className="sticky top-0 z-50 backdrop-blur-xl bg-white/80 dark:bg-gray-950/80 border-b border-gray-200 dark:border-gray-800"
      role="navigation"
      aria-label="Main navigation"
    >
      <div className="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between gap-4">
        {/* Logo */}
        <Link
          href="/"
          className="flex items-center gap-2 group"
          aria-current={isHome ? "page" : undefined}
        >
          <div className="w-10 h-10 rounded-lg bg-gradient-to-br from-orange-500 to-orange-600 flex items-center justify-center text-white font-bold text-lg group-hover:shadow-lg group-hover:shadow-orange-500/25 transition-shadow">
            🍽️
          </div>
          <span className="text-lg font-bold font-serif text-gray-900 dark:text-white group-hover:text-orange-600 dark:group-hover:text-orange-400 transition-colors">
            Mealroots
          </span>
        </Link>

        {/* Navigation Links */}
        <div className="hidden sm:flex items-center gap-1">
          {!isHome && (
            <Link
              href="/preferences"
              className="relative text-sm font-medium text-gray-700 dark:text-gray-300 px-4 py-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors group"
              aria-current={pathname === "/preferences" ? "page" : undefined}
            >
              Nouveau plan
              {pathname === "/preferences" && (
                <span className="absolute bottom-0 left-4 right-4 h-0.5 bg-orange-500 rounded-full" />
              )}
            </Link>
          )}
        </div>

        {/* Theme Toggle */}
        <div className="flex items-center gap-2">
          <button
            onClick={() =>
              setTheme(resolvedTheme === "dark" ? "light" : "dark")
            }
            className="p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors group"
            aria-label={
              isMounted
                ? `Switch to ${resolvedTheme === "dark" ? "light" : "dark"} mode`
                : "Toggle theme"
            }
            title={
              isMounted
                ? `Switch to ${resolvedTheme === "dark" ? "light" : "dark"} mode`
                : "Toggle theme"
            }
          >
            <span className="text-lg group-hover:scale-110 transition-transform inline-block">
              {isMounted && resolvedTheme === "dark"
                ? "☀️"
                : isMounted
                  ? "🌙"
                  : "🌙"}
            </span>
          </button>

          {/* Mobile menu placeholder for future expansion */}
          {!isHome && (
            <Link
              href="/preferences"
              className="sm:hidden p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors"
              aria-label="New plan"
            >
              <span className="text-lg">➕</span>
            </Link>
          )}
        </div>
      </div>
    </nav>
  );
}
