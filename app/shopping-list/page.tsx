"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { GradientButton } from "@/app/components/GradientButton";
import { AnimatedProgress } from "@/app/components/AnimatedProgress";
import { FadeIn } from "@/app/components/FadeIn";

type Article = { nom: string; quantite: string };
type Courses = Record<string, Article[]>;

const categoryConfig: Record<string, { icon: string; color: string }> = {
  "Viandes & Poissons": { icon: "🥩", color: "backdrop-blur-xl bg-white/5 border border-white/10" },
  "Légumes & Fruits": { icon: "🥦", color: "backdrop-blur-xl bg-white/5 border border-white/10" },
  "Féculents": { icon: "🌾", color: "backdrop-blur-xl bg-white/5 border border-white/10" },
  "Épices & Condiments": { icon: "🧴", color: "backdrop-blur-xl bg-white/5 border border-white/10" },
  "Autres": { icon: "🛒", color: "backdrop-blur-xl bg-white/5 border border-white/10" },
};

export default function ShoppingList() {
  const router = useRouter();
  const [courses, setCourses] = useState<Courses | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [checked, setChecked] = useState<Record<string, boolean>>({});

  useEffect(() => {
    const planStr = localStorage.getItem("mealroots-plan");
    if (!planStr) {
      router.push("/preferences");
      return;
    }

    const generate = async () => {
      try {
        const res = await fetch("/api/shopping-list", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ plan: JSON.parse(planStr) }),
        });
        const data = await res.json();
        if (data.error) throw new Error(data.error);
        setCourses(data.courses);
      } catch {
        setError("Erreur lors de la génération.");
      } finally {
        setLoading(false);
      }
    };
    generate();
  }, [router]);

  const toggleCheck = (key: string) => {
    setChecked((prev) => ({ ...prev, [key]: !prev[key] }));
  };

  if (loading) return <AnimatedProgress />;

  if (error) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center space-y-4">
          <span className="text-6xl">😢</span>
          <p className="text-red-500">{error}</p>
          <button onClick={() => router.push("/preferences")} className="text-orange-500 underline">
            Réessayer
          </button>
        </div>
      </div>
    );
  }

  const totalItems = courses ? Object.values(courses).flat().length : 0;
  const checkedCount = Object.values(checked).filter(Boolean).length;
  const progress = totalItems ? (checkedCount / totalItems) * 100 : 0;

  return (
    <main className="min-h-screen bg-gradient-to-br from-orange-950 via-gray-950 to-amber-950">
      <div className="max-w-2xl mx-auto px-4 py-10 space-y-8">

        <FadeIn delay={0}>
          <div className="text-center space-y-3">
            <h1 className="text-3xl font-serif font-bold">📝 Ta liste de courses</h1>
            <div className="flex items-center justify-between text-sm text-gray-500">
              <span>{checkedCount} / {totalItems} articles</span>
              <span>{Math.round(progress)}%</span>
            </div>
            <div className="w-full h-2 bg-gray-200 dark:bg-gray-700 rounded-full overflow-hidden">
              <div
                className="h-full bg-gradient-to-r from-orange-500 to-orange-600 transition-all duration-300 rounded-full"
                style={{ width: `${progress}%` }}
              />
            </div>
          </div>
        </FadeIn>

        <FadeIn delay={0.1}>
          <div className="space-y-6">
            {courses &&
              Object.entries(courses).map(([categorie, articles]) => {
                const config = categoryConfig[categorie] || { icon: "🛒", color: "bg-gray-50" };
                return (
                  <div key={categorie} className={`rounded-2xl p-4 ${config.color}`}>
                    <h2 className="font-bold text-lg mb-3 flex items-center gap-2 text-white">
                      <span className="text-2xl">{config.icon}</span>
                      <span>{categorie}</span>
                      <span className="text-sm font-normal text-gray-400">({articles.length})</span>
                    </h2>
                    <div className="space-y-2">
                      {articles.map((article, i) => {
                        const key = `${categorie}-${i}`;
                        return (
                          <button
                            key={key}
                            onClick={() => toggleCheck(key)}
                            className={`w-full flex items-center justify-between px-4 py-3 rounded-xl transition-all duration-200 ${
                              checked[key]
                                ? "bg-white/50 dark:bg-gray-900/50 line-through text-gray-400"
                                : "bg-white dark:bg-gray-900 hover:shadow-md"
                            }`}
                          >
                            <span className="flex items-center gap-3">
                              <div className={`w-5 h-5 rounded border-2 flex items-center justify-center transition-colors ${
                                checked[key]
                                  ? "bg-orange-500 border-orange-500"
                                  : "border-gray-300 dark:border-gray-600"
                              }`}>
                                {checked[key] && <span className="text-white text-xs">✓</span>}
                              </div>
                              <span className="text-white">{article.nom}</span>
                            </span>
                            <span className="text-sm text-orange-500 font-medium">
                              {article.quantite}
                            </span>
                          </button>
                        );
                      })}
                    </div>
                  </div>
                );
              })}
          </div>
        </FadeIn>

        <FadeIn delay={0.2}>
          <GradientButton
            onClick={() => {
              localStorage.removeItem("mealroots-plan");
              router.push("/preferences");
            }}
            className="w-full cursor-pointer"
          >
            🍽️ Nouveau plan →
          </GradientButton>
        </FadeIn>

      </div>
    </main>
  );
}