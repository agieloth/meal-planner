// "use client";

// import { useEffect, useState } from "react";
// import { useSearchParams } from "next/navigation";
// import Link from "next/link";
// import { Suspense } from "react";
// import { useRouter } from "next/navigation";

// const jours = [
//   "lundi",
//   "mardi",
//   "mercredi",
//   "jeudi",
//   "vendredi",
//   "samedi",
//   "dimanche",
// ];
// const repas = ["petit_dejeuner", "dejeuner", "diner"];
// const repasLabels: Record<string, string> = {
//   petit_dejeuner: "🌅 Petit déjeuner",
//   dejeuner: "☀️ Déjeuner",
//   diner: "🌙 Dîner",
// };

// type Repas = { nom: string; temps: string };
// type Plan = Record<string, Record<string, Repas>>;

// function PlanContent() {
//   const router = useRouter();
//   const searchParams = useSearchParams();
//   const [plan, setPlan] = useState<Plan | null>(null);
//   const [loading, setLoading] = useState(true);
//   const [error, setError] = useState("");
//   const [jourActif, setJourActif] = useState("lundi");

//   const region = searchParams.get("region") || "";
//   const personnes = searchParams.get("personnes") || "1";
//   const budget = searchParams.get("budget") || "50";
//   const regime = searchParams.get("regime") || "omnivore";

//   useEffect(() => {
//     const generatePlan = async () => {
//       try {
//         const res = await fetch("/api/generate-plan", {
//           method: "POST",
//           headers: { "Content-Type": "application/json" },
//           body: JSON.stringify({ region, personnes, budget, regime }),
//         });
//         const data = await res.json();
//         if (data.error) throw new Error(data.error);
//         setPlan(data.plan);
//       } catch {
//         setError("Erreur lors de la génération du plan.");
//       } finally {
//         setLoading(false);
//       }
//     };

//     generatePlan();
//   }, [region, personnes, budget, regime]);

//   if (loading) {
//     return (
//       <div className="min-h-screen flex flex-col items-center justify-center gap-4">
//         <div className="w-12 h-12 border-4 border-orange-500 border-t-transparent rounded-full animate-spin" />
//         <p className="text-gray-500 dark:text-gray-400">
//           Génération de ton plan en cours...
//         </p>
//       </div>
//     );
//   }

//   if (error) {
//     return (
//       <div className="min-h-screen flex flex-col items-center justify-center gap-4">
//         <p className="text-red-500">{error}</p>
//         <Link href="/preferences" className="text-orange-500 underline">
//           Réessayer
//         </Link>
//       </div>
//     );
//   }

//   return (
//     <main className="min-h-screen px-4 py-10 max-w-2xl mx-auto flex flex-col gap-8">
//       <div className="text-center">
//         <h1 className="text-3xl font-bold">Ton plan de la semaine</h1>
//         <p className="text-gray-500 dark:text-gray-400 mt-1">
//           {region} · {personnes} personne(s) · {budget}€
//         </p>
//       </div>

//       {/* Onglets jours */}
//       <div className="flex gap-2 overflow-x-auto pb-2">
//         {jours.map((jour) => (
//           <button
//             key={jour}
//             onClick={() => setJourActif(jour)}
//             className={`px-4 py-2 rounded-full text-sm font-semibold capitalize whitespace-nowrap transition-colors ${
//               jourActif === jour
//                 ? "bg-orange-500 text-white"
//                 : "border border-gray-300 dark:border-gray-700 hover:border-orange-400"
//             }`}
//           >
//             {jour}
//           </button>
//         ))}
//       </div>

//       {/* Repas du jour */}
//       <div className="flex flex-col gap-4">
//         {repas.map((r) => {
//           const repasData = plan?.[jourActif]?.[r];
//           return (
//             <div
//               key={r}
//               className="border border-gray-200 dark:border-gray-800 rounded-2xl p-5 flex flex-col gap-1"
//             >
//               <span className="text-sm text-gray-500 dark:text-gray-400">
//                 {repasLabels[r]}
//               </span>
//               <span className="text-lg font-semibold">{repasData?.nom}</span>
//               <span className="text-sm text-orange-500">
//                 ⏱ {repasData?.temps}
//               </span>
//             </div>
//           );
//         })}
//       </div>

//       {/* Bouton liste courses */}
//       <button
//         onClick={() => {
//           localStorage.setItem("mealroots-plan", JSON.stringify(plan));
//           router.push("/shopping-list");
//         }}
//         className="bg-orange-500 hover:bg-orange-600 text-white font-bold py-4 rounded-full transition-colors text-lg text-center"
//       >
//         Voir ma liste de courses →
//       </button>
//     </main>
//   );
// }

// export default function Plan() {
//   return (
//     <Suspense>
//       <PlanContent />
//     </Suspense>
//   );
// }



"use client";

import { useEffect, useState } from "react";
import { useSearchParams, useRouter } from "next/navigation";
import { Suspense } from "react";
import { GradientButton } from "@/app/components/GradientButton";
import { AnimatedProgress } from "@/app/components/AnimatedProgress";
import { Card } from "@/app/components/Card";
import { FadeIn } from "@/app/components/FadeIn";

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
        setError("Erreur lors de la génération du plan.");
      } finally {
        setLoading(false);
      }
    };
    generatePlan();
  }, [region, personnes, budget, regime]);

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <AnimatedProgress />
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center gap-4">
        <div className="text-center space-y-4">
          <span className="text-6xl">😢</span>
          <p className="text-red-500 text-lg">{error}</p>
          <button
            onClick={() => router.push("/preferences")}
            className="cursor-pointer text-orange-500 underline font-medium"
          >
            Réessayer
          </button>
        </div>
      </div>
    );
  }

  return (
    <main className="min-h-screen bg-gradient-to-br from-orange-950 via-gray-950 to-amber-950">
      <div className="max-w-2xl mx-auto px-4 py-10 space-y-8">
        
        <FadeIn delay={0}>
          <div className="text-center space-y-2">
            <div className="inline-flex items-center gap-2 bg-orange-100 dark:bg-orange-900/30 px-4 py-1 rounded-full">
              <span className="text-orange-500">✨</span>
              <span className="text-sm font-medium text-orange-600 dark:text-orange-400">
                Ton plan personnalisé
              </span>
            </div>
            <h1 className="text-3xl font-serif font-bold">Menu de la semaine</h1>
            <p className="text-gray-500 dark:text-gray-400">
              {region} · {personnes} pers · {budget}€
            </p>
          </div>
        </FadeIn>

        <FadeIn delay={0.1}>
          <div className="flex gap-2 overflow-x-auto pb-2 scrollbar-hide">
            {jours.map((jour) => (
              <button
                key={jour}
                onClick={() => setJourActif(jour)}
                className={`cursor-pointer px-5 py-2 rounded-full text-sm font-semibold capitalize whitespace-nowrap transition-all duration-200 ${
                  jourActif === jour
                    ? "bg-gradient-to-r from-orange-500 to-orange-600 text-white shadow-md shadow-orange-500/25"
                    : "bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-700 hover:border-orange-400"
                }`}
              >
                {jour}
              </button>
            ))}
          </div>
        </FadeIn>

        <FadeIn delay={0.2}>
          <div className="space-y-4">
            {repas.map((r) => {
              const repasData = plan?.[jourActif]?.[r];
              return (
                <Card key={r} variant="glass">
                  <div className="flex items-start justify-between">
                    <div className="space-y-1">
                      <span className="text-sm text-gray-500 dark:text-gray-400 flex items-center gap-1">
                        <span>{repasLabels[r].emoji}</span>
                        <span>{repasLabels[r].label}</span>
                      </span>
                      <h3 className="text-lg font-semibold">{repasData?.nom}</h3>
                      <div className="flex items-center gap-2 text-sm text-orange-500">
                        <span>⏱️</span>
                        <span>{repasData?.temps}</span>
                      </div>
                    </div>
                    <div className="w-12 h-12 bg-orange-100 dark:bg-orange-900/30 rounded-2xl flex items-center justify-center text-2xl">
                      {r === "petit_dejeuner" ? "🍳" : r === "dejeuner" ? "🍲" : "🍷"}
                    </div>
                  </div>
                </Card>
              );
            })}
          </div>
        </FadeIn>

        <FadeIn delay={0.3}>
          <GradientButton
            onClick={() => {
              localStorage.setItem("mealroots-plan", JSON.stringify(plan));
              router.push("/shopping-list");
            }}
            className="w-full cursor-pointer"
          >
            Voir ma liste de courses →
          </GradientButton>
        </FadeIn>

      </div>
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