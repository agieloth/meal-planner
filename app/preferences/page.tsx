"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/app/components/Button";
import { Select } from "@/app/components/Select";
import { FadeIn } from "@/app/components/FadeIn";
import { Alert } from "@/app/components/Alert";

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
  const [error, setError] = useState("");

  const handleSubmit = () => {
    setError("");
    if (!region) {
      setError("Veuillez sélectionner une région");
      return;
    }
    const params = new URLSearchParams({
      region,
      personnes: personnes.toString(),
      budget: budget.toString(),
      regime,
    });
    router.push(`/plan?${params.toString()}`);
  };

  return (
    <main className="min-h-[calc(100vh-73px)] bg-gradient-to-br from-orange-950 via-gray-950 to-amber-950 py-12 px-4">
      <div className="max-w-2xl mx-auto">
        <div className="backdrop-blur-xl bg-white/5 border border-white/10 rounded-3xl p-8 md:p-12 shadow-2xl">
          <FadeIn delay={0}>
            {/* Header */}
            <div className="text-center mb-12">
              <div className="inline-flex items-center justify-center w-16 h-16 bg-orange-500/20 border border-orange-500/30 rounded-2xl mb-4">
                <span className="text-4xl">🍽️</span>
              </div>
              <h1 className="text-3xl md:text-4xl font-bold font-serif text-white mb-2">
                Personnalise ton plan
              </h1>
              <p className="text-gray-300">
                Dis-nous qui tu es, on fait le reste
              </p>
            </div>
          </FadeIn>

          {/* Error Alert */}
          {error && (
            <FadeIn delay={0.05}>
              <Alert
                variant="error"
                title="Erreur"
                description={error}
                onClose={() => setError("")}
                className="mb-6"
              />
            </FadeIn>
          )}

          {/* Form */}
          <div className="space-y-8">
            {/* Region Selection */}
            <FadeIn delay={0.1}>
              <div>
                <label className="block text-sm font-semibold text-white mb-3 flex items-center gap-2">
                  <span>📍</span>
                  <span>Ta région</span>
                </label>
                <Select
                  options={regions.map((r) => ({ value: r, label: r }))}
                  value={region}
                  onChange={(e) => setRegion(e.target.value)}
                  placeholder="Sélectionne ta région"
                  fullWidth
                  className="text-white dark:text-white"
                />
              </div>
            </FadeIn>

            {/* People Count */}
            <FadeIn delay={0.2}>
              <div>
                <label className="block text-sm font-semibold text-white mb-3 flex items-center gap-2">
                  <span>👥</span>
                  <span>Nombre de personnes</span>
                </label>
                <div className="grid grid-cols-4 gap-2">
                  {[1, 2, 3, 4].map((n) => (
                    <button
                      key={n}
                      onClick={() => setPersonnes(n)}
                      className={`py-3 px-4 rounded-lg font-semibold transition-all duration-200 flex items-center justify-center ${
                        personnes === n
                          ? "bg-gradient-to-r from-orange-500 to-orange-600 text-white shadow-lg shadow-orange-500/25 scale-105"
                          : "bg-white/10 border border-white/20 text-white hover:border-orange-500/50 hover:bg-white/20"
                      }`}
                      aria-pressed={personnes === n}
                      aria-label={`Select ${n}${n === 4 ? " or more" : ""} people`}
                    >
                      {n === 4 ? "4+" : n}
                    </button>
                  ))}
                </div>
              </div>
            </FadeIn>

            {/* Budget Slider */}
            <FadeIn delay={0.3}>
              <div>
                <label className="block text-sm font-semibold text-white mb-3 flex items-center justify-between">
                  <span className="flex items-center gap-2">
                    <span>💰</span>
                    <span>Budget semaine</span>
                  </span>
                  <span className="text-lg text-orange-400 font-bold">
                    {budget}€
                  </span>
                </label>
                <input
                  type="range"
                  min={20}
                  max={200}
                  step={5}
                  value={budget}
                  onChange={(e) => setBudget(Number(e.target.value))}
                  className="w-full h-3 bg-white/20 rounded-lg appearance-none cursor-pointer accent-orange-500 transition-all"
                  aria-label="Budget slider"
                  aria-valuemin={20}
                  aria-valuemax={200}
                  aria-valuenow={budget}
                />
                <div className="flex justify-between text-xs text-gray-400 mt-2">
                  <span>Économique (20€)</span>
                  <span>Confort (110€)</span>
                  <span>Gourmet (200€)</span>
                </div>
              </div>
            </FadeIn>

            {/* Diet Selection */}
            <FadeIn delay={0.4}>
              <div>
                <label className="block text-sm font-semibold text-white mb-3 flex items-center gap-2">
                  <span>🥗</span>
                  <span>Régime alimentaire</span>
                </label>
                <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
                  {regimes.map((r) => (
                    <button
                      key={r.id}
                      onClick={() => setRegime(r.id)}
                      className={`py-3 px-3 md:px-4 rounded-xl font-medium text-sm md:text-base transition-all duration-200 flex flex-col items-center justify-center gap-2 ${
                        regime === r.id
                          ? "bg-gradient-to-r from-orange-500 to-orange-600 text-white shadow-lg shadow-orange-500/25 scale-105"
                          : "bg-white/10 border border-white/20 text-white hover:border-orange-500/50 hover:bg-white/20"
                      }`}
                      aria-pressed={regime === r.id}
                      aria-label={r.label}
                    >
                      <span className="text-xl">{r.emoji}</span>
                      <span>{r.label}</span>
                    </button>
                  ))}
                </div>
              </div>
            </FadeIn>

            {/* Submit Button */}
            <FadeIn delay={0.5}>
              <Button
                variant="primary"
                size="lg"
                fullWidth
                onClick={handleSubmit}
                className="mt-2"
              >
                <span>Générer mon plan</span>
                <span>→</span>
              </Button>
            </FadeIn>
          </div>
        </div>
      </div>
    </main>
  );
}
