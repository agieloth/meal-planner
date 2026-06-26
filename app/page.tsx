"use client";

import Link from "next/link";
import { useEffect, useRef } from "react";
import { AnimatedWord } from "@/app/components/AnimatedWord";

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
    <main className="relative min-h-[calc(100vh-73px)] flex flex-col items-center justify-center px-4 py-12 overflow-hidden bg-gray-950">
      {/* Gradient Background - optimized for performance */}
      <div className="absolute inset-0 z-0">
        <div className="absolute inset-0 bg-gradient-to-br from-orange-950 via-gray-950 to-amber-950" />
        <div
          className="absolute top-0 left-1/4 w-96 h-96 bg-orange-500/15 rounded-full blur-3xl"
          style={{ animation: "pulse 4s ease-in-out infinite" }}
        />
        <div
          className="absolute bottom-0 right-1/4 w-96 h-96 bg-amber-500/15 rounded-full blur-3xl"
          style={{ animation: "pulse 6s ease-in-out infinite 1s" }}
        />
      </div>

      {/* Spotlight Follow Mouse */}
      <div
        ref={spotlightRef}
        className="absolute inset-0 z-10 transition-all duration-300 pointer-events-none"
      />

      {/* Content */}
      <div className="relative z-20 flex flex-col items-center gap-6 md:gap-8 max-w-3xl text-center">
        {/* Badge */}
        <div className="inline-flex items-center gap-2 bg-orange-500/10 border border-orange-500/30 px-4 py-2.5 rounded-full backdrop-blur-sm hover:border-orange-500/50 transition-colors">
          <span className="w-2 h-2 bg-orange-400 rounded-full animate-pulse" />
          <span className="text-xs md:text-sm font-medium text-orange-400">
            Cuisine locale, saveurs authentiques
          </span>
        </div>

        {/* Hero Heading */}
        <h1 className="text-5xl md:text-7xl lg:text-8xl font-bold text-white leading-tight tracking-tight">
          Des plats
          <br />
          <AnimatedWord />
        </h1>

        {/* Subheading */}
        <p className="text-base md:text-lg text-gray-300 max-w-lg leading-relaxed">
          Planifie tes repas de la semaine avec des plats qui te ressemblent.
          <br className="hidden sm:block" />
          Simple, local, savoureux.
        </p>

        {/* CTA Button */}
        <div className="flex flex-col sm:flex-row gap-4 mt-2">
          <Link
            href="/preferences"
            className="inline-flex items-center justify-center gap-2 bg-gradient-to-r from-orange-500 to-orange-600 hover:from-orange-600 hover:to-orange-700 text-white font-semibold px-8 py-4 rounded-full transition-all duration-300 hover:scale-105 active:scale-95 shadow-lg shadow-orange-500/25 hover:shadow-orange-500/40 text-base md:text-lg whitespace-nowrap"
            aria-label="Generate your personalized meal plan"
          >
            <span>Générer mon plan</span>
            <span>→</span>
          </Link>
        </div>
      </div>

      {/* Decorative Grid */}
      <div className="absolute inset-0 z-0 bg-[linear-gradient(rgba(249,115,22,0.03)_1px,transparent_1px),linear-gradient(90deg,rgba(249,115,22,0.03)_1px,transparent_1px)] bg-[size:50px_50px]" />
    </main>
  );
}
