"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";

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
  { id: "omnivore", label: "🍖 Tout manger" },
  { id: "vegetarien", label: "🥗 Végétarien" },
  { id: "halal", label: "☪️ Halal" },
  { id: "sans-gluten", label: "🌾 Sans gluten" },
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
    <main className="min-h-screen flex flex-col items-center justify-center px-4 py-12">
      <div className="w-full max-w-lg flex flex-col gap-8">
        <div className="text-center">
          <h1 className="text-3xl font-bold">Personnalise ton plan</h1>
          <p className="text-gray-500 dark:text-gray-400 mt-2">
            Dis-nous qui tu es, on fait le reste.
          </p>
        </div>

        {/* Région */}
        <div className="flex flex-col gap-2">
          <label className="font-semibold">📍 Ta région</label>
          <select
            value={region}
            onChange={(e) => setRegion(e.target.value)}
            className="border border-gray-300 dark:border-gray-700 rounded-xl px-4 py-3 bg-white dark:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-orange-500"
          >
            <option value="">Sélectionne ta région</option>
            {regions.map((r) => (
              <option key={r} value={r}>
                {r}
              </option>
            ))}
          </select>
        </div>

        {/* Nombre de personnes */}
        <div className="flex flex-col gap-2">
          <label className="font-semibold">👥 Nombre de personnes</label>
          <div className="flex gap-3">
            {[1, 2, 3, 4].map((n) => (
              <button
                key={n}
                onClick={() => setPersonnes(n)}
                className={`flex-1 py-3 rounded-xl border font-semibold transition-colors ${
                  personnes === n
                    ? "bg-orange-500 text-white border-orange-500"
                    : "border-gray-300 dark:border-gray-700 hover:border-orange-400"
                }`}
              >
                {n === 4 ? "4+" : n}
              </button>
            ))}
          </div>
        </div>

        {/* Budget */}
        <div className="flex flex-col gap-2">
          <label className="font-semibold">
            💰 Budget semaine —{" "}
            <span className="text-orange-500">{budget}€</span>
          </label>
          <input
            type="range"
            min={20}
            max={200}
            step={5}
            value={budget}
            onChange={(e) => setBudget(Number(e.target.value))}
            className="accent-orange-500"
          />
          <div className="flex justify-between text-sm text-gray-400">
            <span>20€</span>
            <span>200€</span>
          </div>
        </div>

        {/* Régime */}
        <div className="flex flex-col gap-2">
          <label className="font-semibold">🥗 Régime alimentaire</label>
          <div className="grid grid-cols-2 gap-3">
            {regimes.map((r) => (
              <button
                key={r.id}
                onClick={() => setRegime(r.id)}
                className={`py-3 px-4 rounded-xl border font-medium transition-colors ${
                  regime === r.id
                    ? "bg-orange-500 text-white border-orange-500"
                    : "border-gray-300 dark:border-gray-700 hover:border-orange-400"
                }`}
              >
                {r.label}
              </button>
            ))}
          </div>
        </div>

        {/* Bouton */}
        <button
          onClick={handleSubmit}
          className="bg-orange-500 hover:bg-orange-600 text-white font-bold py-4 rounded-full transition-colors text-lg"
        >
          Générer mon plan →
        </button>
      </div>
    </main>
  );
}
