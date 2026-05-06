-- ============================================
-- AFRIQUE DE L'EST
-- ============================================

-- --------------------------------------------
-- Kenya
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Mandazi',
  'Afrique de l''Est',
  'Kenya',
  'petit déjeuner',
  15, 20, 'facile', 4,
  'Beignets sucrés est-africains, légèrement épicés à la cardamome. Parfaits au petit déjeuner avec du thé.',
  '1. Mélanger farine, sucre, cardamome et levure. 2. Ajouter lait de coco et pétrir. 3. Laisser reposer 30 minutes. 4. Former des triangles. 5. Frire jusqu''à dorure.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine', 500, 'g', 'Féculents' FROM recettes WHERE nom = 'Mandazi';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Lait de coco', 200, 'ml', 'Autres' FROM recettes WHERE nom = 'Mandazi';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sucre', 80, 'g', 'Autres' FROM recettes WHERE nom = 'Mandazi';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Cardamome', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Mandazi';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Levure chimique', 10, 'g', 'Autres' FROM recettes WHERE nom = 'Mandazi';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile de friture', 500, 'ml', 'Autres' FROM recettes WHERE nom = 'Mandazi';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Mandazi' AND t.nom IN ('végétarien', 'petit déjeuner', 'rapide');

-- --------------------------------------------
-- Éthiopie
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Injera au Doro Wat',
  'Afrique de l''Est',
  'Éthiopie',
  'déjeuner',
  30, 90, 'difficile', 4,
  'Pain traditionnel éthiopien fermenté servi avec un ragoût de poulet épicé. Le plat national éthiopien.',
  '1. Préparer l''injera la veille avec farine de teff fermentée. 2. Faire mijoter le poulet avec berbéré et oignons. 3. Ajouter oeufs durs en fin de cuisson. 4. Servir sur l''injera.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine de teff', 500, 'g', 'Féculents' FROM recettes WHERE nom = 'Injera au Doro Wat';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Poulet', 1, 'entier', 'Viandes & Poissons' FROM recettes WHERE nom = 'Injera au Doro Wat';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Berbéré', 3, 'c.à.s', 'Épices & Condiments' FROM recettes WHERE nom = 'Injera au Doro Wat';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 400, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Injera au Doro Wat';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oeufs durs', 4, 'pièces', 'Autres' FROM recettes WHERE nom = 'Injera au Doro Wat';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 4, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Injera au Doro Wat';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Gingembre', 2, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Injera au Doro Wat';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Beurre clarifié', 50, 'g', 'Autres' FROM recettes WHERE nom = 'Injera au Doro Wat';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Injera au Doro Wat' AND t.nom IN ('halal', 'déjeuner', 'familial');


-- --------------------------------------------
-- Dîners Afrique de l'Est
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Ugali na Sukuma Wiki',
  'Afrique de l''Est',
  'Kenya, Tanzanie, Ouganda',
  'dîner',
  10, 30, 'facile', 4,
  'Polenta épaisse de maïs servie avec des feuilles de chou kale sautées. Plat du soir simple et nourrissant très populaire en Afrique de l''Est.',
  '1. Porter l''eau à ébullition. 2. Incorporer la farine de maïs progressivement en remuant. 3. Cuire 20 minutes jusqu''à consistance très épaisse. 4. Faire sauter les feuilles de chou avec ail et oignons. 5. Servir ensemble.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine de maïs', 400, 'g', 'Féculents' FROM recettes WHERE nom = 'Ugali na Sukuma Wiki';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Chou kale', 400, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Ugali na Sukuma Wiki';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 1, 'pièce', 'Légumes & Fruits' FROM recettes WHERE nom = 'Ugali na Sukuma Wiki';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 2, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Ugali na Sukuma Wiki';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Tomates', 2, 'pièces', 'Légumes & Fruits' FROM recettes WHERE nom = 'Ugali na Sukuma Wiki';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile', 30, 'ml', 'Autres' FROM recettes WHERE nom = 'Ugali na Sukuma Wiki';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sel', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Ugali na Sukuma Wiki';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Ugali na Sukuma Wiki' AND t.nom IN ('végétarien', 'dîner', 'familial', 'sans gluten');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Pilau',
  'Afrique de l''Est',
  'Kenya, Tanzanie, Zanzibar',
  'dîner',
  20, 45, 'moyen', 4,
  'Riz épicé aux aromates et viande. Plat festif est-africain fortement influencé par la cuisine arabe et indienne.',
  '1. Faire dorer la viande. 2. Faire revenir oignons avec épices pilau. 3. Ajouter tomates et viande. 4. Incorporer le riz lavé. 5. Couvrir d''eau et cuire 25 minutes à feu doux. 6. Laisser reposer avant de servir.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Riz', 400, 'g', 'Féculents' FROM recettes WHERE nom = 'Pilau';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Boeuf', 400, 'g', 'Viandes & Poissons' FROM recettes WHERE nom = 'Pilau';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Pilau';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Tomates', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Pilau';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Épices pilau', 2, 'c.à.s', 'Épices & Condiments' FROM recettes WHERE nom = 'Pilau';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 3, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Pilau';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Gingembre', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Pilau';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile', 50, 'ml', 'Autres' FROM recettes WHERE nom = 'Pilau';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Pilau' AND t.nom IN ('halal', 'dîner', 'familial');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Tilapia grillé sauce tomate',
  'Afrique de l''Est',
  'Kenya, Tanzanie, Ouganda, Rwanda',
  'dîner',
  15, 30, 'facile', 4,
  'Tilapia grillé entier servi avec une sauce tomate épicée et du riz. Plat très populaire autour des lacs est-africains.',
  '1. Nettoyer et inciser le poisson. 2. Mariner avec épices, citron et ail. 3. Griller au four ou sur braise 20 minutes. 4. Préparer sauce tomate avec oignons et piment. 5. Servir le poisson nappé de sauce avec riz.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Tilapia', 2, 'pièces', 'Viandes & Poissons' FROM recettes WHERE nom = 'Tilapia grillé sauce tomate';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Tomates', 300, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Tilapia grillé sauce tomate';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Tilapia grillé sauce tomate';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 3, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Tilapia grillé sauce tomate';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Citron', 1, 'pièce', 'Légumes & Fruits' FROM recettes WHERE nom = 'Tilapia grillé sauce tomate';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Piment', 1, 'pièce', 'Épices & Condiments' FROM recettes WHERE nom = 'Tilapia grillé sauce tomate';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Riz', 300, 'g', 'Féculents' FROM recettes WHERE nom = 'Tilapia grillé sauce tomate';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile', 30, 'ml', 'Autres' FROM recettes WHERE nom = 'Tilapia grillé sauce tomate';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Tilapia grillé sauce tomate' AND t.nom IN ('halal', 'dîner', 'familial', 'sans gluten');