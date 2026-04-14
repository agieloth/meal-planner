import { NextRequest, NextResponse } from "next/server";

export async function POST(req: NextRequest) {
  const { plan } = await req.json();

  const prompt = `À partir de ce plan de repas, génère une liste de courses groupée par catégorie.

Plan de repas :
${JSON.stringify(plan, null, 2)}

Réponds UNIQUEMENT avec un JSON valide, sans texte avant ou après, sans balises markdown.
Format exact :
{
  "Viandes & Poissons": [
    { "nom": "Poulet", "quantite": "500g" }
  ],
  "Légumes": [
    { "nom": "Tomates", "quantite": "1kg" }
  ],
  "Féculents": [
    { "nom": "Riz", "quantite": "1kg" }
  ],
  "Épices & Condiments": [
    { "nom": "Cumin", "quantite": "1 sachet" }
  ],
  "Autres": [
    { "nom": "Huile", "quantite": "1L" }
  ]
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
    const courses = JSON.parse(clean);
    return NextResponse.json({ courses });
  } catch {
    console.error("Groq response:", JSON.stringify(data, null, 2));
    return NextResponse.json({ error: "Erreur de génération" }, { status: 500 });
  }
}