"use client";

import { useEffect, useState } from "react";
import { useSearchParams } from "next/navigation";
import Link from "next/link";
import { Suspense } from "react";

const jours = ["lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche"];
const repas = ["petit_dejeuner", "dejeuner", "diner"];
const repasLabels: Record<string, string> = {
  petit_dejeuner: "🌅 Petit déjeuner",
  dejeuner: "☀️ Déjeuner",
  diner: "🌙 Dîner",
};

type Repas = { nom: string; temps: string };
type Plan = Record<string, Record<string, Repas>>;

function PlanContent() {
  const searchParams = useSearchParams();
  const [plan, setPlan] = useState<Plan | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [jourActif, setJourActif] = useState("lundi");

  const region = searchParams.get("region") || "";
  const personnes = searchParams.get("personnes") || "1";
  const budget = searchParams.get("budget") || "50";
  const regime = searchParams.get("regime") || "omnivore";

  useEffect(() => {
    const generatePlan = async () => {
      try {
        const res = await fetch("/api/generate-plan", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ region, personnes, budget, regime }),
        });
        const data = await res.json();
        if (data.error) throw new Error(data.error);
        setPlan(data.plan);
      } catch {
        setError("Erreur lors de la génération du plan.");
      } finally {
        setLoading(false);
      }
    };

    generatePlan();
  }, [region, personnes, budget, regime]);

  if (loading) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center gap-4">
        <div className="w-12 h-12 border-4 border-orange-500 border-t-transparent rounded-full animate-spin" />
        <p className="text-gray-500 dark:text-gray-400">
          Génération de ton plan en cours...
        </p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center gap-4">
        <p className="text-red-500">{error}</p>
        <Link href="/preferences" className="text-orange-500 underline">
          Réessayer
        </Link>
      </div>
    );
  }

  return (
    <main className="min-h-screen px-4 py-10 max-w-2xl mx-auto flex flex-col gap-8">
      <div className="text-center">
        <h1 className="text-3xl font-bold">Ton plan de la semaine</h1>
        <p className="text-gray-500 dark:text-gray-400 mt-1">
          {region} · {personnes} personne(s) · {budget}€
        </p>
      </div>

      {/* Onglets jours */}
      <div className="flex gap-2 overflow-x-auto pb-2">
        {jours.map((jour) => (
          <button
            key={jour}
            onClick={() => setJourActif(jour)}
            className={`px-4 py-2 rounded-full text-sm font-semibold capitalize whitespace-nowrap transition-colors ${
              jourActif === jour
                ? "bg-orange-500 text-white"
                : "border border-gray-300 dark:border-gray-700 hover:border-orange-400"
            }`}
          >
            {jour}
          </button>
        ))}
      </div>

      {/* Repas du jour */}
      <div className="flex flex-col gap-4">
        {repas.map((r) => {
          const repasData = plan?.[jourActif]?.[r];
          return (
            <div
              key={r}
              className="border border-gray-200 dark:border-gray-800 rounded-2xl p-5 flex flex-col gap-1"
            >
              <span className="text-sm text-gray-500 dark:text-gray-400">
                {repasLabels[r]}
              </span>
              <span className="text-lg font-semibold">{repasData?.nom}</span>
              <span className="text-sm text-orange-500">
                ⏱ {repasData?.temps}
              </span>
            </div>
          );
        })}
      </div>

      {/* Bouton liste courses */}
      <Link
        href="/shopping-list"
        className="bg-orange-500 hover:bg-orange-600 text-white font-bold py-4 rounded-full transition-colors text-lg text-center"
      >
        Voir ma liste de courses →
      </Link>
    </main>
  );
}

export default function Plan() {
  return (
    <Suspense>
      <PlanContent />
    </Suspense>
  );
}