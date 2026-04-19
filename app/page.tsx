"use client";

import Link from "next/link";
import { useEffect, useRef } from "react";

export default function Home() {
  const spotlightRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleMouseMove = (e: MouseEvent) => {
      if (!spotlightRef.current) return;
      const { clientX, clientY } = e;
      spotlightRef.current.style.background = `radial-gradient(600px circle at ${clientX}px ${clientY}px, rgba(249,115,22,0.15), transparent 40%)`;
    };
    window.addEventListener("mousemove", handleMouseMove);
    return () => window.removeEventListener("mousemove", handleMouseMove);
  }, []);

  return (
    <main className="relative h-[calc(100vh-73px)] flex flex-col items-center justify-center text-center px-4 overflow-hidden bg-gray-950">
      
      {/* Gradient animé de fond */}
      <div className="absolute inset-0 z-0">
        <div className="absolute inset-0 bg-gradient-to-br from-orange-950 via-gray-950 to-amber-950 animate-pulse" />
        <div className="absolute top-0 left-1/4 w-96 h-96 bg-orange-500/20 rounded-full blur-3xl animate-[pulse_4s_ease-in-out_infinite]" />
        <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-amber-500/20 rounded-full blur-3xl animate-[pulse_6s_ease-in-out_infinite]" />
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-64 h-64 bg-orange-600/10 rounded-full blur-2xl animate-[pulse_3s_ease-in-out_infinite]" />
      </div>

      {/* Spotlight souris */}
      <div
        ref={spotlightRef}
        className="absolute inset-0 z-10 transition-all duration-300 pointer-events-none"
      />

      {/* Contenu */}
      <div className="relative z-20 flex flex-col items-center gap-8 max-w-3xl">
        <div className="inline-flex items-center gap-2 bg-orange-500/10 border border-orange-500/20 px-4 py-2 rounded-full backdrop-blur-sm">
          <span className="w-2 h-2 bg-orange-500 rounded-full animate-pulse" />
          <span className="text-sm font-medium text-orange-400">
            Cuisine locale, saveurs authentiques
          </span>
        </div>

        <h1 className="text-6xl md:text-8xl font-bold text-white leading-none tracking-tight">
          Mange selon
          <br />
          <span className="bg-gradient-to-r from-orange-400 via-amber-400 to-orange-500 bg-clip-text text-transparent">
            tes racines
          </span>
        </h1>

        <p className="text-lg text-gray-400 max-w-lg leading-relaxed">
          Planifie tes repas de la semaine avec des plats qui te ressemblent.
          Simple, local, savoureux.
        </p>

        <div className="flex flex-col sm:flex-row gap-4 mt-2">
          <Link
            href="/preferences"
            className="bg-gradient-to-r from-orange-500 to-orange-600 hover:from-orange-600 hover:to-orange-700 text-white font-semibold px-8 py-4 rounded-full transition-all duration-300 hover:scale-105 shadow-lg shadow-orange-500/25 text-lg"
          >
            Générer mon plan →
          </Link>
          <button className="border border-gray-700 hover:border-orange-500/50 text-gray-400 hover:text-white font-semibold px-8 py-4 rounded-full transition-all duration-300 backdrop-blur-sm">
            Voir un exemple
          </button>
        </div>
      </div>

      {/* Grid décorative */}
      <div className="absolute inset-0 z-0 bg-[linear-gradient(rgba(249,115,22,0.03)_1px,transparent_1px),linear-gradient(90deg,rgba(249,115,22,0.03)_1px,transparent_1px)] bg-[size:50px_50px]" />
    </main>
  );
}