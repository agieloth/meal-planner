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


-- --------------------------------------------
-- Petits déjeuners Afrique de l'Ouest
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Bouillie de mil',
  'Afrique de l''Ouest',
  'Sénégal, Mali, Burkina Faso, Guinée',
  'petit déjeuner',
  5, 20, 'facile', 4,
  'Porridge chaud traditionnel à base de farine de mil, sucré au sucre ou au miel. Petit déjeuner nourrissant très répandu en Afrique de l''Ouest.',
  '1. Porter l''eau à ébullition. 2. Diluer la farine de mil dans un peu d''eau froide. 3. Incorporer progressivement dans l''eau bouillante. 4. Remuer sans arrêt 15 minutes. 5. Ajouter sucre et lait selon goût.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine de mil', 200, 'g', 'Féculents' FROM recettes WHERE nom = 'Bouillie de mil';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Eau', 1, 'L', 'Autres' FROM recettes WHERE nom = 'Bouillie de mil';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sucre', 50, 'g', 'Autres' FROM recettes WHERE nom = 'Bouillie de mil';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Lait', 200, 'ml', 'Autres' FROM recettes WHERE nom = 'Bouillie de mil';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sel', 1, 'pincée', 'Épices & Condiments' FROM recettes WHERE nom = 'Bouillie de mil';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Bouillie de mil' AND t.nom IN ('végétarien', 'petit déjeuner', 'rapide');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Akara',
  'Afrique de l''Ouest',
  'Nigeria, Sénégal, Bénin, Ghana',
  'petit déjeuner',
  20, 15, 'moyen', 4,
  'Beignets croustillants à base de haricots blancs mixés et frits. Appelé Accara au Sénégal. Souvent servi avec une sauce pimentée.',
  '1. Tremper les haricots blancs une nuit. 2. Les peler et mixer finement. 3. Ajouter oignon, piment et sel. 4. Battre la pâte pour l''aérer. 5. Frire par cuillerées dans l''huile chaude jusqu''à dorure.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Haricots blancs', 300, 'g', 'Féculents' FROM recettes WHERE nom = 'Akara';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignon', 1, 'pièce', 'Légumes & Fruits' FROM recettes WHERE nom = 'Akara';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Piment', 1, 'pièce', 'Épices & Condiments' FROM recettes WHERE nom = 'Akara';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sel', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Akara';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile de friture', 500, 'ml', 'Autres' FROM recettes WHERE nom = 'Akara';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Akara' AND t.nom IN ('végétarien', 'petit déjeuner', 'sans gluten');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Ogi',
  'Afrique de l''Ouest',
  'Nigeria, Ghana, Bénin',
  'petit déjeuner',
  10, 15, 'facile', 4,
  'Bouillie fermentée douce à base de maïs ou sorgho. Texture crémeuse et légèrement acidulée. Souvent servi avec du lait et du sucre.',
  '1. Délayer la pâte de maïs fermentée dans l''eau froide. 2. Porter à ébullition en remuant constamment. 3. Cuire 10 minutes jusqu''à épaississement. 4. Servir chaud avec lait et sucre.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine de maïs fermentée', 200, 'g', 'Féculents' FROM recettes WHERE nom = 'Ogi';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Eau', 800, 'ml', 'Autres' FROM recettes WHERE nom = 'Ogi';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Lait', 200, 'ml', 'Autres' FROM recettes WHERE nom = 'Ogi';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sucre', 40, 'g', 'Autres' FROM recettes WHERE nom = 'Ogi';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Ogi' AND t.nom IN ('végétarien', 'petit déjeuner', 'rapide', 'sans gluten');