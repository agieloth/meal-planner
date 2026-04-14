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
//   "mardi": { ... },
//   "mercredi": { ... },
//   "jeudi": { ... },
//   "vendredi": { ... },
//   "samedi": { ... },
//   "dimanche": { ... }
// }`;

//   const response = await fetch("https://api.anthropic.com/v1/messages", {
//     method: "POST",
//     headers: {
//       "Content-Type": "application/json",
//       "x-api-key": process.env.ANTHROPIC_API_KEY!,
//       "anthropic-version": "2023-06-01",
//     },
//     body: JSON.stringify({
//       model: "claude-sonnet-4-20250514",
//       max_tokens: 2000,
//       messages: [{ role: "user", content: prompt }],
//     }),
//   });

//   const data = await response.json();
//   console.log("API Response:", JSON.stringify(data, null, 2));
//   const text = data.content[0].text;

//   try {
//     const plan = JSON.parse(text);
//     return NextResponse.json({ plan });
//   } catch {
//     return NextResponse.json({ error: "Erreur de génération" }, { status: 500 });
//   }
// }


import { NextRequest, NextResponse } from "next/server";

export async function POST(req: NextRequest) {
  const { region, personnes, budget, regime } = await req.json();

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

  const response = await fetch("https://api.groq.com/openai/v1/chat/completions", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Authorization": `Bearer ${process.env.GROQ_API_KEY}`,
    },
    body: JSON.stringify({
      model: "llama-3.3-70b-versatile",
      max_tokens: 2000,
      messages: [{ role: "user", content: prompt }],
    }),
  });

  const data = await response.json();

  try {
    const text = data.choices[0].message.content;
    const clean = text.replace(/```json|```/g, "").trim();
    const plan = JSON.parse(clean);
    return NextResponse.json({ plan });
  } catch {
    console.error("Groq response:", JSON.stringify(data, null, 2));
    return NextResponse.json({ error: "Erreur de génération" }, { status: 500 });
  }
}