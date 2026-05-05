// import { NextRequest, NextResponse } from "next/server";

// export async function POST(req: NextRequest) {
//   const { region, personnes, budget, regime } = await req.json();

//   const prompt = `Tu es un expert en cuisine africaine et mondiale.
// Génère un plan de repas pour une semaine (7 jours, 3 repas par jour : petit déjeuner, déjeuner et dîner).

// Paramètres :
// - Région : ${region}
// - Nombre de personnes : ${personnes}
// - Budget semaine : ${budget}€
// - Régime : ${regime}

// Réponds UNIQUEMENT avec un JSON valide, sans texte avant ou après, sans balises markdown.
// Format exact :
// {
//   "lundi": {
//     "petit_dejeuner": { "nom": "...", "temps": "..." },
//     "dejeuner": { "nom": "...", "temps": "..." },
//     "diner": { "nom": "...", "temps": "..." }
//   },
//   "mardi": { "petit_dejeuner": { "nom": "...", "temps": "..." }, "dejeuner": { "nom": "...", "temps": "..." }, "diner": { "nom": "...", "temps": "..." } },
//   "mercredi": { "petit_dejeuner": { "nom": "...", "temps": "..." }, "dejeuner": { "nom": "...", "temps": "..." }, "diner": { "nom": "...", "temps": "..." } },
//   "jeudi": { "petit_dejeuner": { "nom": "...", "temps": "..." }, "dejeuner": { "nom": "...", "temps": "..." }, "diner": { "nom": "...", "temps": "..." } },
//   "vendredi": { "petit_dejeuner": { "nom": "...", "temps": "..." }, "dejeuner": { "nom": "...", "temps": "..." }, "diner": { "nom": "...", "temps": "..." } },
//   "samedi": { "petit_dejeuner": { "nom": "...", "temps": "..." }, "dejeuner": { "nom": "...", "temps": "..." }, "diner": { "nom": "...", "temps": "..." } },
//   "dimanche": { "petit_dejeuner": { "nom": "...", "temps": "..." }, "dejeuner": { "nom": "...", "temps": "..." }, "diner": { "nom": "...", "temps": "..." } }
// }`;

//   const response = await fetch("https://api.groq.com/openai/v1/chat/completions", {
//     method: "POST",
//     headers: {
//       "Content-Type": "application/json",
//       "Authorization": `Bearer ${process.env.GROQ_API_KEY}`,
//     },
//     body: JSON.stringify({
//       model: "llama-3.3-70b-versatile",
//       max_tokens: 2000,
//       messages: [{ role: "user", content: prompt }],
//     }),
//   });

//   const data = await response.json();

//   try {
//     const text = data.choices[0].message.content;
//     const clean = text.replace(/```json|```/g, "").trim();
//     const plan = JSON.parse(clean);
//     return NextResponse.json({ plan });
//   } catch {
//     console.error("Groq response:", JSON.stringify(data, null, 2));
//     return NextResponse.json({ error: "Erreur de génération" }, { status: 500 });
//   }
// }

import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

const jours = [
  "lundi",
  "mardi",
  "mercredi",
  "jeudi",
  "vendredi",
  "samedi",
  "dimanche",
];

function getTypeRepas(index: number): string {
  const types = ["petit_dejeuner", "dejeuner", "diner"];
  return types[index % 3];
}

function shuffleArray<T>(array: T[]): T[] {
  const arr = [...array];
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

export async function POST(req: NextRequest) {
  const { region, personnes, budget, regime } = await req.json();

  try {
    // Chercher les recettes dans la base selon la région et le régime
    const whereClause: any = { region };

    if (regime && regime !== "omnivore") {
      whereClause.recette_tags = {
        some: {
          tags: {
            nom:
              regime === "vegetarien"
                ? "végétarien"
                : regime === "sans-gluten"
                  ? "sans gluten"
                  : regime === "halal"
                    ? "halal"
                    : regime,
          },
        },
      };
    }

    const recettesDB = await prisma.recettes.findMany({
      where: whereClause,
      include: {
        ingredients: true,
        recette_tags: {
          include: { tags: true },
        },
      },
    });

    // Si on a assez de recettes dans la base (au moins 7)
    if (recettesDB.length >= 3) {
      const plan: Record<
        string,
        Record<string, { nom: string; temps: string }>
      > = {};

      // Séparer par type de repas
      const petitsDejeuners = recettesDB.filter(
        (r) => r.type_repas === "petit déjeuner",
      );
      const dejeuners = recettesDB.filter((r) => r.type_repas === "déjeuner");
      const diners = recettesDB.filter((r) => r.type_repas === "dîner");

      // Si pas assez par type on utilise toutes les recettes
      const tousTypes = shuffleArray(recettesDB);

      for (const jour of jours) {
        const getPetitDej =
          petitsDejeuners.length > 0
            ? shuffleArray(petitsDejeuners)[0]
            : tousTypes[Math.floor(Math.random() * tousTypes.length)];

        const getDejeuner =
          dejeuners.length > 0
            ? shuffleArray(dejeuners)[0]
            : tousTypes[Math.floor(Math.random() * tousTypes.length)];

        const getDiner =
          diners.length > 0
            ? shuffleArray(diners)[0]
            : tousTypes[Math.floor(Math.random() * tousTypes.length)];

        const formatTemps = (minutes: number): string => {
          if (minutes < 60) return `${minutes} min`;
          const heures = Math.floor(minutes / 60);
          const mins = minutes % 60;
          if (mins === 0) return `${heures}h00`;
          return `${heures}h${mins.toString().padStart(2, "0")}`;
        };

        const temps = (r: (typeof recettesDB)[0]) => {
          const total = (r.temps_preparation ?? 0) + (r.temps_cuisson ?? 0);
          return formatTemps(total);
        };

        plan[jour] = {
          petit_dejeuner: {
            nom: getPetitDej.nom,
            temps: temps(getPetitDej),
          },
          dejeuner: {
            nom: getDejeuner.nom,
            temps: temps(getDejeuner),
          },
          diner: {
            nom: getDiner.nom,
            temps: temps(getDiner),
          },
        };
      }

      return NextResponse.json({ plan, source: "database" });
    }

    // Fallback — pas assez de recettes dans la base, on utilise l'IA
    const prompt = `Tu es un expert en cuisine africaine et mondiale. 
Génère un plan de repas pour une semaine (7 jours, 3 repas par jour : petit déjeuner, déjeuner et dîner).

Paramètres :
- Région : ${region}
- Nombre de personnes : ${personnes}
- Budget semaine : ${budget}€
- Régime : ${regime}

Réponds UNIQUEMENT avec un JSON valide, sans texte avant ou après, sans balises markdown.
Format exact :
{
  "lundi": {
    "petit_dejeuner": { "nom": "...", "temps": "..." },
    "dejeuner": { "nom": "...", "temps": "..." },
    "diner": { "nom": "...", "temps": "..." }
  },
  "mardi": { "petit_dejeuner": { "nom": "...", "temps": "..." }, "dejeuner": { "nom": "...", "temps": "..." }, "diner": { "nom": "...", "temps": "..." } },
  "mercredi": { "petit_dejeuner": { "nom": "...", "temps": "..." }, "dejeuner": { "nom": "...", "temps": "..." }, "diner": { "nom": "...", "temps": "..." } },
  "jeudi": { "petit_dejeuner": { "nom": "...", "temps": "..." }, "dejeuner": { "nom": "...", "temps": "..." }, "diner": { "nom": "...", "temps": "..." } },
  "vendredi": { "petit_dejeuner": { "nom": "...", "temps": "..." }, "dejeuner": { "nom": "...", "temps": "..." }, "diner": { "nom": "...", "temps": "..." } },
  "samedi": { "petit_dejeuner": { "nom": "...", "temps": "..." }, "dejeuner": { "nom": "...", "temps": "..." }, "diner": { "nom": "...", "temps": "..." } },
  "dimanche": { "petit_dejeuner": { "nom": "...", "temps": "..." }, "dejeuner": { "nom": "...", "temps": "..." }, "diner": { "nom": "...", "temps": "..." } }
}`;

    const response = await fetch(
      "https://api.groq.com/openai/v1/chat/completions",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${process.env.GROQ_API_KEY}`,
        },
        body: JSON.stringify({
          model: "llama-3.3-70b-versatile",
          max_tokens: 2000,
          messages: [{ role: "user", content: prompt }],
        }),
      },
    );

    const data = await response.json();
    const text = data.choices[0].message.content;
    const clean = text.replace(/```json|```/g, "").trim();
    const plan = JSON.parse(clean);
    return NextResponse.json({ plan, source: "ai" });
  } catch (error) {
    console.error("Erreur generate-plan:", error);
    return NextResponse.json(
      { error: "Erreur de génération" },
      { status: 500 },
    );
  }
}
