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