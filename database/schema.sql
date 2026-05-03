-- ============================================
-- MEALROOTS — Structure de la base de données
-- ============================================

CREATE TABLE IF NOT EXISTS recettes (
  id SERIAL PRIMARY KEY,
  nom VARCHAR(255) NOT NULL,
  region VARCHAR(100) NOT NULL,
  pays VARCHAR(100),
  type_repas VARCHAR(50) NOT NULL,
  temps_preparation INTEGER,
  temps_cuisson INTEGER,
  difficulte VARCHAR(20),
  portions INTEGER,
  description TEXT,
  instructions TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS ingredients (
  id SERIAL PRIMARY KEY,
  recette_id INTEGER NOT NULL REFERENCES recettes(id) ON DELETE CASCADE,
  nom VARCHAR(255) NOT NULL,
  quantite DECIMAL(10,2),
  unite VARCHAR(50),
  categorie VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS tags (
  id SERIAL PRIMARY KEY,
  nom VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS recette_tags (
  recette_id INTEGER NOT NULL REFERENCES recettes(id) ON DELETE CASCADE,
  tag_id INTEGER NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
  PRIMARY KEY (recette_id, tag_id)
);

-- ============================================
-- TAGS DE BASE
-- ============================================
INSERT INTO tags (nom) VALUES
  ('halal'),
  ('végétarien'),
  ('sans gluten'),
  ('petit déjeuner'),
  ('déjeuner'),
  ('dîner'),
  ('rapide'),
  ('familial')
ON CONFLICT (nom) DO NOTHING;