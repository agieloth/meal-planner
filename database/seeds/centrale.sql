-- ============================================
-- AFRIQUE CENTRALE
-- ============================================

-- --------------------------------------------
-- Cameroun
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Ndolé',
  'Afrique Centrale',
  'Cameroun',
  'déjeuner',
  30, 60, 'moyen', 6,
  'Plat national camerounais à base de feuilles de ndolé, arachides et viande ou crevettes.',
  '1. Faire bouillir les feuilles de ndolé pour enlever l''amertume. 2. Faire revenir oignons et ail. 3. Ajouter viande et crevettes. 4. Incorporer les feuilles et pâte d''arachide. 5. Mijoter 30 minutes. 6. Servir avec miondo ou plantain.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Feuilles de ndolé', 500, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Ndolé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Crevettes', 300, 'g', 'Viandes & Poissons' FROM recettes WHERE nom = 'Ndolé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Boeuf', 200, 'g', 'Viandes & Poissons' FROM recettes WHERE nom = 'Ndolé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Pâte d''arachide', 150, 'g', 'Autres' FROM recettes WHERE nom = 'Ndolé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Ndolé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 4, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Ndolé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Gingembre', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Ndolé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile de palme', 50, 'ml', 'Autres' FROM recettes WHERE nom = 'Ndolé';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Ndolé' AND t.nom IN ('halal', 'déjeuner', 'familial');

-- --------------------------------------------
-- Congo
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Poulet à la Moambé',
  'Afrique Centrale',
  'Congo',
  'dîner',
  20, 60, 'facile', 4,
  'Plat traditionnel congolais au poulet mijoté dans une sauce à base de noix de palme. Très populaire en Afrique Centrale.',
  '1. Faire dorer le poulet. 2. Préparer la sauce moambé avec noix de palme. 3. Ajouter oignons et épices. 4. Mijoter 45 minutes. 5. Servir avec riz blanc ou chikwangue.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Poulet', 1, 'entier', 'Viandes & Poissons' FROM recettes WHERE nom = 'Poulet à la Moambé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Noix de palme', 400, 'g', 'Autres' FROM recettes WHERE nom = 'Poulet à la Moambé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Poulet à la Moambé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 3, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Poulet à la Moambé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Piment', 1, 'pièce', 'Épices & Condiments' FROM recettes WHERE nom = 'Poulet à la Moambé';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sel', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Poulet à la Moambé';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Poulet à la Moambé' AND t.nom IN ('halal', 'dîner', 'familial');

-- --------------------------------------------
-- Petits déjeuners Afrique Centrale
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Bouillie de manioc',
  'Afrique Centrale',
  'Congo, Cameroun, Gabon, RDC',
  'petit déjeuner',
  10, 20, 'facile', 4,
  'Bouillie crémeuse à base de farine de manioc. Petit déjeuner de base très répandu en Afrique Centrale, servi sucré ou salé.',
  '1. Délayer la farine de manioc dans l''eau froide. 2. Porter à ébullition en remuant. 3. Cuire 15 minutes à feu doux. 4. Ajouter sucre et lait selon goût. 5. Servir chaud.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine de manioc', 200, 'g', 'Féculents' FROM recettes WHERE nom = 'Bouillie de manioc';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Eau', 800, 'ml', 'Autres' FROM recettes WHERE nom = 'Bouillie de manioc';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Lait', 200, 'ml', 'Autres' FROM recettes WHERE nom = 'Bouillie de manioc';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sucre', 50, 'g', 'Autres' FROM recettes WHERE nom = 'Bouillie de manioc';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sel', 1, 'pincée', 'Épices & Condiments' FROM recettes WHERE nom = 'Bouillie de manioc';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Bouillie de manioc' AND t.nom IN ('végétarien', 'petit déjeuner', 'rapide', 'sans gluten');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Beignets de banane plantain',
  'Afrique Centrale',
  'Cameroun, Congo, Gabon, RDC',
  'petit déjeuner',
  10, 15, 'facile', 4,
  'Beignets dorés à base de banane plantain mûre. Sucrés naturellement, croustillants dehors et moelleux dedans. Très populaires au petit déjeuner.',
  '1. Écraser les bananes plantain mûres. 2. Ajouter farine, sucre et une pincée de sel. 3. Mélanger jusqu''à pâte homogène. 4. Frire par cuillerées dans l''huile chaude. 5. Égoutter et servir chaud.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Bananes plantain mûres', 3, 'pièces', 'Légumes & Fruits' FROM recettes WHERE nom = 'Beignets de banane plantain';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine', 100, 'g', 'Féculents' FROM recettes WHERE nom = 'Beignets de banane plantain';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sucre', 30, 'g', 'Autres' FROM recettes WHERE nom = 'Beignets de banane plantain';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sel', 1, 'pincée', 'Épices & Condiments' FROM recettes WHERE nom = 'Beignets de banane plantain';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile de friture', 400, 'ml', 'Autres' FROM recettes WHERE nom = 'Beignets de banane plantain';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Beignets de banane plantain' AND t.nom IN ('végétarien', 'petit déjeuner', 'rapide');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Omelette au piment',
  'Afrique Centrale',
  'Cameroun, Congo, Gabon',
  'petit déjeuner',
  5, 10, 'facile', 2,
  'Omelette simple et épicée aux piments et oignons. Petit déjeuner rapide et nourrissant très populaire en Afrique Centrale.',
  '1. Battre les oeufs avec sel et poivre. 2. Émincer oignons et piments. 3. Faire revenir oignons dans l''huile. 4. Verser les oeufs battus. 5. Ajouter piments et cuire à feu moyen. 6. Plier et servir avec pain.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oeufs', 3, 'pièces', 'Autres' FROM recettes WHERE nom = 'Omelette au piment';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 1, 'pièce', 'Légumes & Fruits' FROM recettes WHERE nom = 'Omelette au piment';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Piment', 1, 'pièce', 'Épices & Condiments' FROM recettes WHERE nom = 'Omelette au piment';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile', 20, 'ml', 'Autres' FROM recettes WHERE nom = 'Omelette au piment';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sel', 1, 'pincée', 'Épices & Condiments' FROM recettes WHERE nom = 'Omelette au piment';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Omelette au piment' AND t.nom IN ('végétarien', 'petit déjeuner', 'rapide', 'sans gluten');