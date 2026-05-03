-- ============================================
-- AFRIQUE DU SUD
-- ============================================

-- --------------------------------------------
-- Afrique du Sud
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Bobotie',
  'Afrique du Sud',
  'Afrique du Sud',
  'dîner',
  20, 60, 'facile', 6,
  'Plat national sud-africain à base de viande hachée épicée, recouvert d''un flan aux oeufs. Héritage de la cuisine cap-malaise.',
  '1. Faire revenir oignons et viande hachée. 2. Ajouter épices, abricots secs et chutney. 3. Mettre dans un plat allant au four. 4. Recouvrir du mélange oeufs-lait. 5. Cuire au four 35 minutes.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Viande hachée', 500, 'g', 'Viandes & Poissons' FROM recettes WHERE nom = 'Bobotie';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Bobotie';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Abricots secs', 100, 'g', 'Autres' FROM recettes WHERE nom = 'Bobotie';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Chutney', 50, 'g', 'Épices & Condiments' FROM recettes WHERE nom = 'Bobotie';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Curry', 2, 'c.à.s', 'Épices & Condiments' FROM recettes WHERE nom = 'Bobotie';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oeufs', 3, 'pièces', 'Autres' FROM recettes WHERE nom = 'Bobotie';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Lait', 200, 'ml', 'Autres' FROM recettes WHERE nom = 'Bobotie';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Pain de mie', 2, 'tranches', 'Féculents' FROM recettes WHERE nom = 'Bobotie';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Bobotie' AND t.nom IN ('dîner', 'familial');

-- --------------------------------------------
-- Zimbabwe
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Sadza ne Nyama',
  'Afrique du Sud',
  'Zimbabwe',
  'dîner',
  10, 40, 'facile', 4,
  'Plat de base zimbabwéen — une polenta épaisse de maïs servie avec un ragoût de viande. Nourrissant et simple.',
  '1. Porter l''eau à ébullition. 2. Incorporer la farine de maïs progressivement. 3. Remuer jusqu''à consistance épaisse. 4. Préparer le ragoût de viande séparément. 5. Servir ensemble.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine de maïs', 400, 'g', 'Féculents' FROM recettes WHERE nom = 'Sadza ne Nyama';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Boeuf', 400, 'g', 'Viandes & Poissons' FROM recettes WHERE nom = 'Sadza ne Nyama';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Tomates', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Sadza ne Nyama';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 150, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Sadza ne Nyama';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 2, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Sadza ne Nyama';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile', 30, 'ml', 'Autres' FROM recettes WHERE nom = 'Sadza ne Nyama';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Sadza ne Nyama' AND t.nom IN ('sans gluten', 'dîner', 'familial');