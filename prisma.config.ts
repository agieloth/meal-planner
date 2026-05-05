import { defineConfig } from "prisma/config";
import { PrismaPg } from "@prisma/adapter-pg";
import { Pool } from "pg";

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

export default defineConfig({
  // earlyAccess: true,
  schema: "prisma/schema.prisma",
  migrate: {
    adapter: new PrismaPg(pool),
  },
});