-- ============================================
-- MEALROOTS — Seeds de la base de données
-- ============================================

-- Nettoyage (ordre important à cause des relations)
TRUNCATE TABLE recette_tags, ingredients, recettes, tags RESTART IDENTITY CASCADE;

-- ============================================
-- TAGS
-- ============================================
INSERT INTO tags (nom) VALUES
  ('halal'),
  ('végétarien'),
  ('sans gluten'),
  ('petit déjeuner'),
  ('déjeuner'),
  ('dîner'),
  ('rapide'),
  ('familial');

-- ============================================
-- RECETTES
-- ============================================
INSERT INTO recettes (nom, region, pays, type_repas, temps_preparation, temps_cuisson, difficulte, portions, description, instructions)
VALUES
  (
    'Thiéboudienne',
    'Afrique de l''Ouest',
    'Sénégal',
    'déjeuner',
    30, 90, 'moyen', 6,
    'Le plat national sénégalais. Un riz cuit dans une sauce tomate riche avec du poisson et des légumes.',
    '1. Faire revenir le poisson dans l''huile. 2. Préparer la sauce tomate avec oignons et épices. 3. Ajouter les légumes. 4. Cuire le riz dans la sauce.'
  ),
  (
    'Poulet Yassa',
    'Afrique de l''Ouest',
    'Sénégal',
    'déjeuner',
    20, 60, 'facile', 4,
    'Poulet mariné aux oignons et citron, mijoté lentement. Un classique de la cuisine sénégalaise.',
    '1. Mariner le poulet avec oignons, citron et moutarde. 2. Griller le poulet. 3. Faire caraméliser les oignons. 4. Mijoter ensemble 30 minutes. 5. Servir avec du riz blanc.'
  ),
  (
    'Mafé',
    'Afrique de l''Ouest',
    'Mali',
    'dîner',
    25, 75, 'moyen', 5,
    'Ragoût de viande à la sauce d''arachide. Un plat généreux et savoureux très répandu en Afrique de l''Ouest.',
    '1. Faire dorer la viande. 2. Faire revenir oignons et tomates. 3. Ajouter pâte d''arachide diluée. 4. Ajouter légumes. 5. Mijoter 1 heure. 6. Servir avec riz ou foutou.'
  ),
  (
    'Harira',
    'Afrique du Nord',
    'Maroc',
    'dîner',
    20, 60, 'facile', 6,
    'Soupe traditionnelle marocaine aux tomates, lentilles et pois chiches. Incontournable pendant le Ramadan.',
    '1. Faire revenir oignons et épices. 2. Ajouter tomates et concentré. 3. Ajouter lentilles et pois chiches. 4. Laisser mijoter 45 minutes. 5. Ajouter citron et coriandre.'
  ),
  (
    'Mandazi',
    'Afrique de l''Est',
    'Kenya',
    'petit déjeuner',
    15, 20, 'facile', 4,
    'Beignets sucrés est-africains, légèrement épicés à la cardamome. Parfaits au petit déjeuner avec du thé.',
    '1. Mélanger farine, sucre, cardamome et levure. 2. Ajouter lait de coco et pétrir. 3. Laisser reposer 30 minutes. 4. Former des triangles. 5. Frire jusqu''à dorure.'
  );

-- ============================================
-- INGRÉDIENTS
-- ============================================

-- Thiéboudienne (id: 1)
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie) VALUES
  (1, 'Riz brisé', 500, 'g', 'Féculents'),
  (1, 'Poisson yeet', 400, 'g', 'Viandes & Poissons'),
  (1, 'Tomates', 300, 'g', 'Légumes & Fruits'),
  (1, 'Oignons', 200, 'g', 'Légumes & Fruits'),
  (1, 'Carottes', 150, 'g', 'Légumes & Fruits'),
  (1, 'Manioc', 200, 'g', 'Légumes & Fruits'),
  (1, 'Huile d''arachide', 100, 'ml', 'Autres'),
  (1, 'Concentré de tomate', 50, 'g', 'Épices & Condiments'),
  (1, 'Ail', 3, 'gousses', 'Épices & Condiments'),
  (1, 'Poivre noir', 1, 'c.à.c', 'Épices & Condiments');

-- Poulet Yassa (id: 2)
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie) VALUES
  (2, 'Poulet', 1, 'entier', 'Viandes & Poissons'),
  (2, 'Oignons', 500, 'g', 'Légumes & Fruits'),
  (2, 'Citrons', 3, 'pièces', 'Légumes & Fruits'),
  (2, 'Moutarde', 2, 'c.à.s', 'Épices & Condiments'),
  (2, 'Huile', 50, 'ml', 'Autres'),
  (2, 'Riz blanc', 400, 'g', 'Féculents'),
  (2, 'Ail', 4, 'gousses', 'Épices & Condiments');

-- Mafé (id: 3)
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie) VALUES
  (3, 'Boeuf', 500, 'g', 'Viandes & Poissons'),
  (3, 'Pâte d''arachide', 200, 'g', 'Autres'),
  (3, 'Tomates', 300, 'g', 'Légumes & Fruits'),
  (3, 'Oignons', 200, 'g', 'Légumes & Fruits'),
  (3, 'Carottes', 150, 'g', 'Légumes & Fruits'),
  (3, 'Patate douce', 200, 'g', 'Légumes & Fruits'),
  (3, 'Huile', 50, 'ml', 'Autres'),
  (3, 'Ail', 3, 'gousses', 'Épices & Condiments');

-- Harira (id: 4)
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie) VALUES
  (4, 'Lentilles', 200, 'g', 'Féculents'),
  (4, 'Pois chiches', 200, 'g', 'Féculents'),
  (4, 'Tomates', 400, 'g', 'Légumes & Fruits'),
  (4, 'Oignons', 150, 'g', 'Légumes & Fruits'),
  (4, 'Concentré de tomate', 50, 'g', 'Épices & Condiments'),
  (4, 'Coriandre', 1, 'bouquet', 'Épices & Condiments'),
  (4, 'Citron', 1, 'pièce', 'Légumes & Fruits'),
  (4, 'Cumin', 1, 'c.à.c', 'Épices & Condiments'),
  (4, 'Gingembre', 1, 'c.à.c', 'Épices & Condiments');

-- Mandazi (id: 5)
INSERT INTO ingredients (recette_id, nom, quantite, unite, categorie) VALUES
  (5, 'Farine', 500, 'g', 'Féculents'),
  (5, 'Lait de coco', 200, 'ml', 'Autres'),
  (5, 'Sucre', 80, 'g', 'Autres'),
  (5, 'Cardamome', 1, 'c.à.c', 'Épices & Condiments'),
  (5, 'Levure chimique', 10, 'g', 'Autres'),
  (5, 'Huile de friture', 500, 'ml', 'Autres');

-- ============================================
-- RECETTE_TAGS
-- ============================================
INSERT INTO recette_tags (recette_id, tag_id) VALUES
  (1, 1), (1, 5), (1, 8),  -- Thiéboudienne : halal, déjeuner, familial
  (2, 1), (2, 5), (2, 8),  -- Yassa : halal, déjeuner, familial
  (3, 1), (3, 6), (3, 8),  -- Mafé : halal, dîner, familial
  (4, 1), (4, 2), (4, 6),  -- Harira : halal, végétarien, dîner
  (5, 4), (5, 7);           -- Mandazi : petit déjeuner, rapide