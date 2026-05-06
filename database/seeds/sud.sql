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


-- --------------------------------------------
-- Petits déjeuners Afrique du Sud
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Pap et Oeufs',
  'Afrique du Sud',
  'Afrique du Sud, Zimbabwe, Mozambique',
  'petit déjeuner',
  5, 20, 'facile', 4,
  'Porridge épais de maïs servi avec des oeufs brouillés. Petit déjeuner traditionnel et nourrissant très populaire en Afrique australe.',
  '1. Porter l''eau à ébullition avec le sel. 2. Incorporer la farine de maïs progressivement. 3. Remuer et cuire 15 minutes à feu doux. 4. Préparer les oeufs brouillés séparément. 5. Servir ensemble.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine de maïs', 300, 'g', 'Féculents' FROM recettes WHERE nom = 'Pap et Oeufs';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oeufs', 3, 'pièces', 'Autres' FROM recettes WHERE nom = 'Pap et Oeufs';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Eau', 1, 'L', 'Autres' FROM recettes WHERE nom = 'Pap et Oeufs';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Beurre', 20, 'g', 'Autres' FROM recettes WHERE nom = 'Pap et Oeufs';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sel', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Pap et Oeufs';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Pap et Oeufs' AND t.nom IN ('végétarien', 'petit déjeuner', 'rapide', 'sans gluten');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Vetkoek',
  'Afrique du Sud',
  'Afrique du Sud, Namibie',
  'petit déjeuner',
  15, 20, 'facile', 6,
  'Beignets moelleux frits à base de pâte levée. Servis nature avec du beurre et de la confiture ou fourrés au mince-meat. Très populaires en Afrique du Sud.',
  '1. Mélanger farine, levure, sucre et sel. 2. Ajouter eau tiède et pétrir. 3. Laisser lever 30 minutes. 4. Former des boules. 5. Frire dans l''huile chaude jusqu''à dorure. 6. Égoutter et servir avec beurre.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine', 500, 'g', 'Féculents' FROM recettes WHERE nom = 'Vetkoek';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Levure sèche', 10, 'g', 'Autres' FROM recettes WHERE nom = 'Vetkoek';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sucre', 20, 'g', 'Autres' FROM recettes WHERE nom = 'Vetkoek';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sel', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Vetkoek';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Eau tiède', 300, 'ml', 'Autres' FROM recettes WHERE nom = 'Vetkoek';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile de friture', 500, 'ml', 'Autres' FROM recettes WHERE nom = 'Vetkoek';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Beurre', 50, 'g', 'Autres' FROM recettes WHERE nom = 'Vetkoek';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Vetkoek' AND t.nom IN ('végétarien', 'petit déjeuner', 'familial');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Umngqusho',
  'Afrique du Sud',
  'Afrique du Sud',
  'petit déjeuner',
  10, 60, 'facile', 6,
  'Plat traditionnel Xhosa à base de maïs concassé et haricots. Nourrissant et simple. Plat préféré de Nelson Mandela.',
  '1. Faire tremper le maïs concassé une nuit. 2. Cuire le maïs 30 minutes dans l''eau. 3. Ajouter les haricots et continuer la cuisson. 4. Assaisonner avec sel et beurre. 5. Servir chaud.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Maïs concassé', 300, 'g', 'Féculents' FROM recettes WHERE nom = 'Umngqusho';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Haricots blancs', 200, 'g', 'Féculents' FROM recettes WHERE nom = 'Umngqusho';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Beurre', 30, 'g', 'Autres' FROM recettes WHERE nom = 'Umngqusho';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Sel', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Umngqusho';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Umngqusho' AND t.nom IN ('végétarien', 'petit déjeuner', 'familial', 'sans gluten');

-- --------------------------------------------
-- Déjeuners Afrique du Sud
-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Braai',
  'Afrique du Sud',
  'Afrique du Sud, Zimbabwe, Namibie',
  'déjeuner',
  20, 40, 'facile', 6,
  'Barbecue traditionnel sud-africain. Viandes grillées sur braise accompagnées de salades et pap. Moment convivial et festif.',
  '1. Préparer la braise. 2. Mariner les viandes avec épices et huile. 3. Griller les saucisses boerewors en premier. 4. Griller steaks et poulet selon cuisson désirée. 5. Servir avec pap et salades.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Saucisses boerewors', 500, 'g', 'Viandes & Poissons' FROM recettes WHERE nom = 'Braai';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Steaks de boeuf', 400, 'g', 'Viandes & Poissons' FROM recettes WHERE nom = 'Braai';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Cuisses de poulet', 4, 'pièces', 'Viandes & Poissons' FROM recettes WHERE nom = 'Braai';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Épices braai', 2, 'c.à.s', 'Épices & Condiments' FROM recettes WHERE nom = 'Braai';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile', 50, 'ml', 'Autres' FROM recettes WHERE nom = 'Braai';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine de maïs', 300, 'g', 'Féculents' FROM recettes WHERE nom = 'Braai';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Braai' AND t.nom IN ('déjeuner', 'familial', 'sans gluten');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Bunny Chow',
  'Afrique du Sud',
  'Afrique du Sud',
  'déjeuner',
  15, 40, 'moyen', 4,
  'Pain de mie évidé garni d''un curry de poulet ou de légumes. Plat emblématique de Durban né de la communauté indienne sud-africaine.',
  '1. Préparer le curry de poulet avec épices, tomates et oignons. 2. Mijoter 30 minutes. 3. Couper le pain en deux et évider chaque moitié. 4. Garnir généreusement de curry chaud. 5. Placer le chapeau de pain sur le dessus.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Pain de mie', 1, 'miche', 'Féculents' FROM recettes WHERE nom = 'Bunny Chow';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Poulet', 500, 'g', 'Viandes & Poissons' FROM recettes WHERE nom = 'Bunny Chow';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Tomates', 300, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Bunny Chow';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Bunny Chow';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Curry en poudre', 2, 'c.à.s', 'Épices & Condiments' FROM recettes WHERE nom = 'Bunny Chow';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 3, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Bunny Chow';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Gingembre', 1, 'c.à.c', 'Épices & Condiments' FROM recettes WHERE nom = 'Bunny Chow';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile', 30, 'ml', 'Autres' FROM recettes WHERE nom = 'Bunny Chow';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Bunny Chow' AND t.nom IN ('halal', 'déjeuner', 'familial');

-- --------------------------------------------

INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES (
  'Chakalaka et Pap',
  'Afrique du Sud',
  'Afrique du Sud, Zimbabwe',
  'déjeuner',
  15, 25, 'facile', 4,
  'Relish épicée de légumes servie avec la pap. Plat végétarien coloré et savoureux très populaire en Afrique australe.',
  '1. Faire revenir oignons et ail. 2. Ajouter poivrons, carottes et tomates. 3. Assaisonner avec curry et piment. 4. Mijoter 15 minutes. 5. Préparer la pap séparément. 6. Servir ensemble.'
);

INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Farine de maïs', 300, 'g', 'Féculents' FROM recettes WHERE nom = 'Chakalaka et Pap';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Poivrons', 2, 'pièces', 'Légumes & Fruits' FROM recettes WHERE nom = 'Chakalaka et Pap';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Carottes', 2, 'pièces', 'Légumes & Fruits' FROM recettes WHERE nom = 'Chakalaka et Pap';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Tomates', 200, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Chakalaka et Pap';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Oignons', 150, 'g', 'Légumes & Fruits' FROM recettes WHERE nom = 'Chakalaka et Pap';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Curry en poudre', 1, 'c.à.s', 'Épices & Condiments' FROM recettes WHERE nom = 'Chakalaka et Pap';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Ail', 2, 'gousses', 'Épices & Condiments' FROM recettes WHERE nom = 'Chakalaka et Pap';
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie)
SELECT id, 'Huile', 30, 'ml', 'Autres' FROM recettes WHERE nom = 'Chakalaka et Pap';

INSERT INTO recette_tags (recette_id, tag_id)
SELECT r.id, t.id FROM recettes r, tags t
WHERE r.nom = 'Chakalaka et Pap' AND t.nom IN ('végétarien', 'déjeuner', 'familial', 'sans gluten');