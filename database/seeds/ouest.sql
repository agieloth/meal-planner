-- ============================================
-- AFRIQUE DE L'OUEST
-- ============================================

-- --------------------------------------------
-- Sénégal
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Thiéboudienne',
  'Afrique de l''Ouest',
  'Sénégal',
  'déjeuner',
  30, 90, 'moyen', 6,
  'Le plat national sénégalais. Un riz cuit dans une sauce tomate riche avec du poisson et des légumes.',
  '1. Faire revenir le poisson dans l''huile. 2. Préparer la sauce tomate avec oignons et épices. 3. Ajouter les légumes. 4. Cuire le riz dans la sauce.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Riz brisé', 500, 'g', 'Féculents' FROM recettes WHERE nom = 'Thiéboudienne';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Poisson yeet', 400, 'g', 'Viandes & Poissons' FROM recettes WHERE nom = 'Thiéboudienne';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Tomates', 300, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Thiéboudienne';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Thiéboudienne';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Carottes', 150, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Thiéboudienne';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Manioc', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Thiéboudienne';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile d''arachide', 100, 'ml', 'Autres' FROM recettes WHERE nom = 'Thiéboudienne';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Concentré de tomate', 50, 'g', 'Épices & Condiments' FROM recettes WHERE nom = 'Thiéboudienne';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 3, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Thiéboudienne';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Poivre noir', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Thiéboudienne';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Thiéboudienne' AND t.nom IN ('halal', 'déjeuner', 'familial');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Poulet Yassa',
  'Afrique de l''Ouest',
  'Sénégal',
  'déjeuner',
  20, 60, 'facile', 4,
  'Poulet mariné aux oignons et citron, mijoté lentement. Un classique de la cuisine sénégalaise.',
  '1. Mariner le poulet avec oignons, citron et moutarde. 2. Griller le poulet. 3. Faire caraméliser les oignons. 4. Mijoter ensemble 30 minutes. 5. Servir avec du riz blanc.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Poulet', 1, 'entier', 'Viandes & Poissons' FROM recettes WHERE nom = 'Poulet Yassa';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 500, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Poulet Yassa';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Citrons', 3, 'pièces', 'Légumes & Fruits' FROM recettes WHERE nom = 'Poulet Yassa';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Moutarde', 2, 'c.à.s', 'Épices & Condiments' FROM recettes WHERE nom = 'Poulet Yassa';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile', 50, 'ml', 'Autres' FROM recettes WHERE nom = 'Poulet Yassa';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Riz blanc', 400, 'g', 'Féculents' FROM recettes WHERE nom = 'Poulet Yassa';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 4, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Poulet Yassa';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Poulet Yassa' AND t.nom IN ('halal', 'déjeuner', 'familial');

-- --------------------------------------------
-- Mali
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Mafé',
  'Afrique de l''Ouest',
  'Mali',
  'dîner',
  25, 75, 'moyen', 5,
  'Ragoût de viande à la sauce d''arachide. Un plat généreux et savoureux très répandu en Afrique de l''Ouest.',
  '1. Faire dorer la viande. 2. Faire revenir oignons et tomates. 3. Ajouter pâte d''arachide diluée. 4. Ajouter légumes. 5. Mijoter 1 heure. 6. Servir avec riz ou foutou.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Boeuf', 500, 'g', 'Viandes & Poissons' FROM recettes WHERE nom = 'Mafé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Pâte d''arachide', 200, 'g', 'Autres' FROM recettes WHERE nom = 'Mafé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Tomates', 300, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Mafé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Mafé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Carottes', 150, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Mafé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Patate douce', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Mafé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile', 50, 'ml', 'Autres' FROM recettes WHERE nom = 'Mafé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 3, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Mafé';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Mafé' AND t.nom IN ('halal', 'dîner', 'familial');