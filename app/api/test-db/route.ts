import { NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

export async function GET() {
  try {
    const recettes = await prisma.recettes.findMany({
      select: {
        nom: true,
        region: true,
        pays: true,
        type_repas: true,
      },
      orderBy: {
        region: "asc",
      },
    });
    return NextResponse.json({ recettes });
  } catch (error) {
    console.error(error);
    return NextResponse.json(
      { error: "Erreur de connexion à la base de données" },
      { status: 500 }
    );
  }
}