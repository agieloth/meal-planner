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