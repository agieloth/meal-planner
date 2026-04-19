"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { GradientButton } from "@/app/components/GradientButton";
import { FadeIn } from "@/app/components/FadeIn";

const regions = [
  "Afrique de l'Ouest",
  "Afrique du Nord",
  "Afrique Centrale",
  "Afrique de l'Est",
  "Afrique du Sud",
  "Europe",
  "Amérique",
  "Asie",
];

const regimes = [
  { id: "omnivore", label: "Tout manger", emoji: "🍖" },
  { id: "vegetarien", label: "Végétarien", emoji: "🥗" },
  { id: "halal", label: "Halal", emoji: "☪️" },
  { id: "sans-gluten", label: "Sans gluten", emoji: "🌾" },
];

export default function Preferences() {
  const router = useRouter();
  const [region, setRegion] = useState("");
  const [regime, setRegime] = useState("");
  const [personnes, setPersonnes] = useState(1);
  const [budget, setBudget] = useState(50);

  const handleSubmit = () => {
    if (!region) return alert("Choisis ta région !");
    const params = new URLSearchParams({
      region,
      personnes: personnes.toString(),
      budget: budget.toString(),
      regime,
    });
    router.push(`/plan?${params.toString()}`);
  };

  return (
    <main className="min-h-screen bg-gradient-to-br from-orange-50 via-white to-amber-50 dark:from-gray-950 dark:via-gray-900 dark:to-gray-950">
      <div className="max-w-lg mx-auto px-4 py-12">
        <FadeIn delay={0}>
          <div className="text-center mb-10">
            <div className="inline-flex items-center justify-center w-16 h-16 bg-orange-100 dark:bg-orange-900/30 rounded-2xl mb-4">
              <span className="text-3xl">🍽️</span>
            </div>
            <h1 className="text-3xl font-bold font-serif bg-gradient-to-r from-orange-600 to-orange-500 bg-clip-text text-transparent">
              Personnalise ton plan
            </h1>
            <p className="text-gray-500 dark:text-gray-400 mt-2">
              Dis-nous qui tu es, on fait le reste
            </p>
          </div>
        </FadeIn>

        <div className="space-y-6">
          <FadeIn delay={0.1}>
            <div className="group">
              <label className="block font-semibold mb-2 text-gray-700 dark:text-gray-300">
                📍 Ta région
              </label>
              <select
                value={region}
                onChange={(e) => setRegion(e.target.value)}
                className="w-full border border-gray-200 dark:border-gray-700 rounded-xl px-4 py-3 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent transition-all"
              >
                <option value="">Sélectionne ta région</option>
                {regions.map((r) => (
                  <option key={r} value={r}>{r}</option>
                ))}
              </select>
            </div>
          </FadeIn>

          <FadeIn delay={0.2}>
            <div>
              <label className="block font-semibold mb-2 text-gray-700 dark:text-gray-300">
                👥 Nombre de personnes
              </label>
              <div className="flex gap-3">
                {[1, 2, 3, 4].map((n) => (
                  <button
                    key={n}
                    onClick={() => setPersonnes(n)}
                    className={`cursor-pointer flex-1 py-3 rounded-xl font-semibold transition-all duration-200 ${
                      personnes === n
                        ? "bg-gradient-to-r from-orange-500 to-orange-600 text-white shadow-lg shadow-orange-500/25 scale-105"
                        : "bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-700 hover:border-orange-400 hover:scale-105"
                    }`}
                  >
                    {n === 4 ? "4+" : n}
                  </button>
                ))}
              </div>
            </div>
          </FadeIn>

          <FadeIn delay={0.3}>
            <div>
              <label className="block font-semibold mb-2 text-gray-700 dark:text-gray-300">
                💰 Budget semaine — <span className="text-orange-500 text-xl">{budget}€</span>
              </label>
              <input
                type="range"
                min={20}
                max={200}
                step={5}
                value={budget}
                onChange={(e) => setBudget(Number(e.target.value))}
                className="w-full h-2 bg-gray-200 dark:bg-gray-700 rounded-lg appearance-none cursor-pointer accent-orange-500"
              />
              <div className="flex justify-between text-sm text-gray-400 mt-1">
                <span>Économique</span>
                <span>Confort</span>
                <span>Gourmet</span>
              </div>
            </div>
          </FadeIn>

          <FadeIn delay={0.4}>
            <div>
              <label className="block font-semibold mb-2 text-gray-700 dark:text-gray-300">
                🥗 Régime alimentaire
              </label>
              <div className="grid grid-cols-2 gap-3">
                {regimes.map((r) => (
                  <button
                    key={r.id}
                    onClick={() => setRegime(r.id)}
                    className={`cursor-pointer py-3 px-4 rounded-xl font-medium transition-all duration-200 flex items-center justify-center gap-2 ${
                      regime === r.id
                        ? "bg-gradient-to-r from-orange-500 to-orange-600 text-white shadow-lg shadow-orange-500/25 scale-105"
                        : "bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-700 hover:border-orange-400"
                    }`}
                  >
                    <span>{r.emoji}</span>
                    <span>{r.label}</span>
                  </button>
                ))}
              </div>
            </div>
          </FadeIn>

          <FadeIn delay={0.5}>
            <GradientButton onClick={handleSubmit} className="w-full mt-4 cursor-pointer">
              Générer mon plan →
            </GradientButton>
          </FadeIn>
        </div>
      </div>
    </main>
  );
}
