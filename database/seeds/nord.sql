-- ============================================
-- AFRIQUE DU NORD
-- ============================================

-- --------------------------------------------
-- Maroc
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Harira',
  'Afrique du Nord',
  'Maroc',
  'dîner',
  20, 60, 'facile', 6,
  'Soupe traditionnelle marocaine aux tomates, lentilles et pois chiches. Incontournable pendant le Ramadan.',
  '1. Faire revenir oignons et épices. 2. Ajouter tomates et concentré. 3. Ajouter lentilles et pois chiches. 4. Laisser mijoter 45 minutes. 5. Ajouter citron et coriandre.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Lentilles', 200, 'g', 'Féculents' FROM recettes WHERE nom = 'Harira';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Pois chiches', 200, 'g', 'Féculents' FROM recettes WHERE nom = 'Harira';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Tomates', 400, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Harira';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 150, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Harira';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Concentré de tomate', 50, 'g', 'Épices & Condiments' FROM recettes WHERE nom = 'Harira';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Coriandre', 1, 'bouquet', 'Épices & Condiments' FROM recettes WHERE nom = 'Harira';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Citron', 1, 'pièce', 'Légumes & Fruits' FROM recettes WHERE nom = 'Harira';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Cumin', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Harira';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Gingembre', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Harira';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Harira' AND t.nom IN ('halal', 'végétarien', 'dîner');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Tajine de poulet aux olives',
  'Afrique du Nord',
  'Maroc',
  'déjeuner',
  20, 75, 'moyen', 4,
  'Tajine traditionnel marocain au poulet, olives et citrons confits. Un plat parfumé aux épices du Maghreb.',
  '1. Faire dorer le poulet. 2. Ajouter oignons et épices. 3. Ajouter olives et citrons confits. 4. Mijoter à feu doux 1 heure. 5. Servir avec du pain marocain.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Poulet', 1, 'entier', 'Viandes & Poissons' FROM recettes WHERE nom = 'Tajine de poulet aux olives';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Olives vertes', 150, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Tajine de poulet aux olives';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Citrons confits', 2, 'pièces', 'Épices & Condiments' FROM recettes WHERE nom = 'Tajine de poulet aux olives';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Tajine de poulet aux olives';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 4, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Tajine de poulet aux olives';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Curcuma', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Tajine de poulet aux olives';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Gingembre', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Tajine de poulet aux olives';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile d''olive', 50, 'ml', 'Autres' FROM recettes WHERE nom = 'Tajine de poulet aux olives';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Coriandre', 1, 'bouquet', 'Épices & Condiments' FROM recettes WHERE nom = 'Tajine de poulet aux olives';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Tajine de poulet aux olives' AND t.nom IN ('halal', 'déjeuner', 'familial');