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

import { useTheme } from "next-themes";
import Link from "next/link";
import { usePathname } from "next/navigation";

export default function Navbar() {
  const { resolvedTheme, setTheme } = useTheme();
  const pathname = usePathname();
  const isHome = pathname === "/";

  return (
    <nav className="sticky top-0 z-50 backdrop-blur-xl bg-white/80 dark:bg-gray-950/80 border-b border-gray-200 dark:border-gray-800">
      <div className="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
        <Link
          href="/"
          className="text-2xl font-serif font-bold bg-gradient-to-r from-orange-600 to-orange-500 bg-clip-text text-transparent hover:opacity-80 transition-opacity"
        >
          Mealroots
        </Link>

        <div className="flex items-center gap-4">
          {!isHome && (
            <Link
              href="/preferences"
              className="text-sm font-medium text-gray-600 dark:text-gray-400 hover:text-orange-500 transition-colors px-4 py-2 rounded-full hover:bg-orange-50 dark:hover:bg-orange-950/20"
            >
              Nouveau plan
            </Link>
          )}
          <button
            onClick={() => setTheme(resolvedTheme === "dark" ? "light" : "dark")}
            className="text-xl p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors"
            aria-label="Toggle theme"
          >
            {resolvedTheme === "dark" ? "☀️" : "🌙"}
          </button>
        </div>
      </div>
    </nav>
  );
}