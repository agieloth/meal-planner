"use client";

import { useEffect, useState } from "react";
import { useSearchParams, useRouter } from "next/navigation";
import { Suspense } from "react";
import { Button } from "@/app/components/Button";
import { LoadingSpinner } from "@/app/components/LoadingSpinner";
import { Card } from "@/app/components/Card";
import { FadeIn } from "@/app/components/FadeIn";
import { Alert } from "@/app/components/Alert";

const jours = ["lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche"];
const repas = ["petit_dejeuner", "dejeuner", "diner"];
const repasLabels: Record<string, { label: string; emoji: string }> = {
  petit_dejeuner: { label: "Petit déjeuner", emoji: "🌅" },
  dejeuner: { label: "Déjeuner", emoji: "☀️" },
  diner: { label: "Dîner", emoji: "🌙" },
};

type Repas = { nom: string; temps: string };
type Plan = Record<string, Record<string, Repas>>;

function PlanContent() {
  const router = useRouter();
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
        setError("Erreur lors de la génération du plan. Veuillez réessayer.");
      } finally {
        setLoading(false);
      }
    };
    generatePlan();
  }, [region, personnes, budget, regime]);

  if (loading) {
    return (
      <div className="min-h-[calc(100vh-73px)] flex items-center justify-center bg-gradient-to-br from-orange-950 via-gray-950 to-amber-950">
        <LoadingSpinner message="Génération de ton plan en cours..." />
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-[calc(100vh-73px)] flex items-center justify-center bg-gradient-to-br from-orange-950 via-gray-950 to-amber-950 px-4">
        <div className="max-w-md text-center space-y-6">
          <div className="text-6xl">😢</div>
          <Alert
            variant="error"
            title="Oups!"
            description={error}
          />
          <Button
            variant="primary"
            onClick={() => router.push("/preferences")}
          >
            Recommencer
          </Button>
        </div>
      </div>
    );
  }

  return (
    <main className="min-h-[calc(100vh-73px)] bg-gradient-to-br from-orange-950 via-gray-950 to-amber-950">
      <div className="max-w-4xl mx-auto px-4 py-8 md:py-12 space-y-8">
        
        {/* Header */}
        <FadeIn delay={0}>
          <div className="text-center space-y-2">
            <div className="inline-flex items-center gap-2 bg-orange-500/20 border border-orange-500/30 px-4 py-1.5 rounded-full">
              <span className="text-orange-400">✨</span>
              <span className="text-sm font-medium text-orange-300">
                Ton plan personnalisé
              </span>
            </div>
            <h1 className="text-4xl md:text-5xl font-serif font-bold text-white">
              Menu de la semaine
            </h1>
            <div className="flex flex-wrap items-center justify-center gap-3 text-sm md:text-base text-gray-300 mt-4">
              <span className="flex items-center gap-1">📍 {region}</span>
              <span className="hidden sm:inline">·</span>
              <span className="flex items-center gap-1">👥 {personnes} pers</span>
              <span className="hidden sm:inline">·</span>
              <span className="flex items-center gap-1">💰 {budget}€</span>
            </div>
          </div>
        </FadeIn>

        {/* Day Tabs */}
        <FadeIn delay={0.1}>
          <div className="flex gap-2 overflow-x-auto pb-3 -mx-4 px-4 scroll-smooth scrollbar-hide">
            {jours.map((jour) => (
              <button
                key={jour}
                onClick={() => setJourActif(jour)}
                className={`px-4 py-2.5 rounded-lg text-sm font-medium capitalize whitespace-nowrap transition-all duration-300 flex-shrink-0 ${
                  jourActif === jour
                    ? "bg-gradient-to-r from-orange-500 to-orange-600 text-white shadow-lg shadow-orange-500/30 scale-105"
                    : "bg-white/10 border border-white/20 text-white hover:border-orange-500/50 hover:bg-white/20"
                }`}
                aria-pressed={jourActif === jour}
                aria-label={`Select ${jour}`}
              >
                {jour.charAt(0).toUpperCase() + jour.slice(1)}
              </button>
            ))}
          </div>
        </FadeIn>

        {/* Meals Grid */}
        <FadeIn delay={0.2}>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {repas.map((r) => {
              const repasData = plan?.[jourActif]?.[r];
              const mealEmojis: Record<string, string> = {
                petit_dejeuner: "🍳",
                dejeuner: "🍲",
                diner: "🍷",
              };
              return (
                <Card key={r} variant="glass" className="hover:scale-105 transition-transform">
                  <div className="space-y-3">
                    <div className="flex items-center justify-between">
                      <span className="text-sm text-orange-300 font-medium flex items-center gap-2">
                        <span>{repasLabels[r].emoji}</span>
                        <span>{repasLabels[r].label}</span>
                      </span>
                      <div className="text-2xl">{mealEmojis[r]}</div>
                    </div>
                    
                    <div className="space-y-1">
                      <h3 className="text-lg font-semibold text-white leading-snug">
                        {repasData?.nom || "Chargement..."}
                      </h3>
                      <div className="flex items-center gap-2 text-sm text-orange-400">
                        <span>⏱</span>
                        <span>{repasData?.temps || "—"}</span>
                      </div>
                    </div>
                  </div>
                </Card>
              );
            })}
          </div>
        </FadeIn>

        {/* Action Buttons */}
        <FadeIn delay={0.3}>
          <div className="flex flex-col sm:flex-row gap-4 pt-4">
            <Button
              variant="primary"
              size="lg"
              fullWidth
              onClick={() => {
                localStorage.setItem("mealroots-plan", JSON.stringify(plan));
                router.push("/shopping-list");
              }}
            >
              <span>Liste de courses</span>
              <span>→</span>
            </Button>
            <Button
              variant="outline"
              size="lg"
              fullWidth
              onClick={() => router.push("/preferences")}
            >
              Créer un autre plan
            </Button>
          </div>
        </FadeIn>
      </div>
    </main>
  );
}

export default function Plan() {
  return (
    <Suspense
      fallback={
        <div className="min-h-[calc(100vh-73px)] flex items-center justify-center bg-gradient-to-br from-orange-950 via-gray-950 to-amber-950">
          <LoadingSpinner message="Chargement..." />
        </div>
      }
    >
      <PlanContent />
    </Suspense>
  );
}