"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";

type Article = { nom: string; quantite: string };
type Courses = Record<string, Article[]>;

const categoryIcons: Record<string, string> = {
  "Viandes & Poissons": "🥩",
  "Légumes": "🥦",
  "Féculents": "🌾",
  "Épices & Condiments": "🧴",
  "Autres": "🛒",
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

    const plan = JSON.parse(planStr);

    const generate = async () => {
      try {
        const res = await fetch("/api/shopping-list", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ plan }),
        });
        const data = await res.json();
        if (data.error) throw new Error(data.error);
        setCourses(data.courses);
      } catch {
        setError("Erreur lors de la génération de la liste.");
      } finally {
        setLoading(false);
      }
    };

    generate();
  }, [router]);

  const toggleCheck = (key: string) => {
    setChecked((prev) => ({ ...prev, [key]: !prev[key] }));
  };

  if (loading) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center gap-4">
        <div className="w-12 h-12 border-4 border-orange-500 border-t-transparent rounded-full animate-spin" />
        <p className="text-gray-500 dark:text-gray-400">
          Génération de ta liste de courses...
        </p>
      </div>
    );
  }

  if (error) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center gap-4">
        <p className="text-red-500">{error}</p>
        <button
          onClick={() => router.push("/preferences")}
          className="text-orange-500 underline"
        >
          Réessayer
        </button>
      </div>
    );
  }

  return (
    <main className="min-h-screen px-4 py-10 max-w-2xl mx-auto flex flex-col gap-8">
      <div className="text-center">
        <h1 className="text-3xl font-bold">Ta liste de courses</h1>
        <p className="text-gray-500 dark:text-gray-400 mt-1">
          Coche ce que t'as déjà
        </p>
      </div>

      {/* Catégories */}
      <div className="flex flex-col gap-6">
        {courses &&
          Object.entries(courses).map(([categorie, articles]) => (
            <div key={categorie} className="flex flex-col gap-3">
              <h2 className="font-bold text-lg">
                {categoryIcons[categorie] || "🛒"} {categorie}
              </h2>
              <div className="flex flex-col gap-2">
                {articles.map((article, i) => {
                  const key = `${categorie}-${i}`;
                  return (
                    <button
                      key={key}
                      onClick={() => toggleCheck(key)}
                      className={`flex items-center justify-between px-4 py-3 rounded-xl border transition-colors ${
                        checked[key]
                          ? "border-gray-200 dark:border-gray-800 opacity-40 line-through"
                          : "border-gray-200 dark:border-gray-800 hover:border-orange-400"
                      }`}
                    >
                      <span>{article.nom}</span>
                      <span className="text-sm text-gray-400">
                        {article.quantite}
                      </span>
                    </button>
                  );
                })}
              </div>
            </div>
          ))}
      </div>

      {/* Bouton recommencer */}
      <button
        onClick={() => {
          localStorage.removeItem("mealroots-plan");
          router.push("/preferences");
        }}
        className="bg-orange-500 hover:bg-orange-600 text-white font-bold py-4 rounded-full transition-colors text-lg"
      >
        Nouveau plan →
      </button>
    </main>
  );
}