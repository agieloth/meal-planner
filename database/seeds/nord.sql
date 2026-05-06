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


-- --------------------------------------------
-- Petits déjeuners Afrique du Nord
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Msemen',
  'Afrique du Nord',
  'Maroc, Algérie, Tunisie',
  'petit déjeuner',
  30, 20, 'moyen', 4,
  'Crêpes feuilletées marocaines croustillantes et moelleuses. Servies avec du miel et du beurre au petit déjeuner.',
  '1. Mélanger farine, semoule, sel et eau tiède. 2. Pétrir 15 minutes jusqu''à pâte lisse. 3. Former des boules, laisser reposer. 4. Étaler finement, plier en carré. 5. Cuire à la poêle sans matière grasse.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine', 400, 'g', 'Féculents' FROM recettes WHERE nom = 'Msemen';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Semoule fine', 100, 'g', 'Féculents' FROM recettes WHERE nom = 'Msemen';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sel', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Msemen';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Eau tiède', 300, 'ml', 'Autres' FROM recettes WHERE nom = 'Msemen';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile', 50, 'ml', 'Autres' FROM recettes WHERE nom = 'Msemen';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Miel', 50, 'g', 'Autres' FROM recettes WHERE nom = 'Msemen';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Beurre', 50, 'g', 'Autres' FROM recettes WHERE nom = 'Msemen';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Msemen' AND t.nom IN ('végétarien', 'petit déjeuner', 'familial');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Bissara',
  'Afrique du Nord',
  'Maroc, Algérie',
  'petit déjeuner',
  10, 40, 'facile', 4,
  'Soupe épaisse de fèves ou pois cassés, arrosée d''huile d''olive et de cumin. Petit déjeuner populaire des rues marocaines.',
  '1. Faire cuire les fèves séchées dans l''eau 30 minutes. 2. Mixer jusqu''à consistance crémeuse. 3. Assaisonner avec cumin, ail et sel. 4. Servir chaud avec filet d''huile d''olive et paprika.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Fèves séchées', 300, 'g', 'Féculents' FROM recettes WHERE nom = 'Bissara';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile d''olive', 50, 'ml', 'Autres' FROM recettes WHERE nom = 'Bissara';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 3, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Bissara';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Cumin', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Bissara';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Paprika', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Bissara';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sel', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Bissara';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Bissara' AND t.nom IN ('végétarien', 'petit déjeuner', 'sans gluten');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Shakshuka',
  'Afrique du Nord',
  'Tunisie, Libye, Algérie, Maroc',
  'petit déjeuner',
  10, 20, 'facile', 4,
  'Oeufs pochés dans une sauce tomate épicée aux poivrons. Plat du matin populaire dans tout le Maghreb et Moyen-Orient.',
  '1. Faire revenir oignons et poivrons. 2. Ajouter tomates et épices. 3. Laisser mijoter 10 minutes. 4. Casser les oeufs dans la sauce. 5. Couvrir et cuire 5-7 minutes. 6. Servir avec pain.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oeufs', 4, 'pièces', 'Autres' FROM recettes WHERE nom = 'Shakshuka';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Tomates', 400, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Shakshuka';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Poivrons', 2, 'pièces', 'Légumes & Fruits' FROM recettes WHERE nom = 'Shakshuka';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 1, 'pièce', 'Légumes & Fruits' FROM recettes WHERE nom = 'Shakshuka';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Cumin', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Shakshuka';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Paprika', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Shakshuka';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile d''olive', 30, 'ml', 'Autres' FROM recettes WHERE nom = 'Shakshuka';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Shakshuka' AND t.nom IN ('végétarien', 'petit déjeuner', 'rapide');