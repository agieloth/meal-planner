# MEALROOTS — Roadmap & Fonctionnalités
*Document de référence — Ne pas perdre*

---

## ✅ PHASE 1 — Foundation (En cours)

### Fait
- [x] MVP Next.js + TypeScript
- [x] Design premium glassmorphism
- [x] Mode sombre / clair
- [x] Animations Framer Motion
- [x] Gradient animé + effet spotlight hero
- [x] Texte animé sur la page d'accueil
- [x] Génération plan de repas par IA (Groq)
- [x] Liste de courses automatique
- [x] Base de données PostgreSQL + Prisma
- [x] 29 recettes africaines — 5 régions couvertes
- [x] Fichiers seeds organisés par région

### À faire
- [ ] Enrichir la base — focus Bénin (objectif 50+ recettes béninoises)
- [ ] Retravailler les instructions des recettes — détaillées avec temps par étape
- [ ] Authentification utilisateur (NextAuth.js)
- [ ] Sauvegarde des plans générés
- [ ] Déploiement Vercel
- [ ] Mettre à jour le document projet professionnel Mealroots

---

## 🟡 PHASE 2 — Croissance (3-6 mois)

### Fonctionnalité — Prix du marché local 🇧🇯
**La plus différenciante. Donnée hyperlocale impossible à obtenir sur internet.**

- [ ] Collecter les prix terrain — Cotonou, Porto-Novo, Abomey-Calavi
- [ ] Marchés cibles : Dantokpa, Saint-Michel, Missèbo + Score, Erevan
- [ ] Afficher sur la liste de courses : prix en FCFA + marché + date MAJ
- [ ] Fourchette de prix — pas un prix fixe
- [ ] Toujours afficher "prix estimé" pour éviter perte de confiance
- [ ] Mise à jour manuelle mensuelle par le fondateur
- [ ] Phase 2 : signalement de prix par les utilisateurs

**Lacune** : Prix informels et fluctuants. Différence entre villes. Risque de prix inexacts.

---

### Fonctionnalité — Mode Cuisine 🍳
**Mealroots devient compagnon de cuisine du début à la fin.**

- [ ] Clic sur un plat → fiche complète avec ingrédients et quantités
- [ ] Aperçu des grandes étapes en titres
- [ ] Bouton **"Commencer la cuisine"** — libre choix de l'utilisateur
- [ ] Mode cuisine activé : étapes une par une + timer intégré
- [ ] Bouton **"Étape suivante"** + Bouton **"Sauter"** (pour les expérimentés)
- [ ] Écran qui reste allumé pendant la cuisson
- [ ] Interface simple — grosses lettres, peu de texte (mains sales)

**Prérequis** : Retravailler toutes les instructions de la base — détaillées avec temps précis par étape.

---

### Fonctionnalité — Communauté & Soumission de recettes 👥
**La base grandit sans que tu fasses tout le travail. Archive culturelle vivante.**

- [ ] Bouton "Soumettre une recette" dans l'app
- [ ] Formulaire : nom, pays/région, type repas, ingrédients, étapes, photo optionnelle
- [ ] Notification au fondateur pour validation
- [ ] Recette publiée avec mention **"Recette de [Prénom], [Ville]"**
- [ ] Modération avant publication

**Lacune** : Nécessite modération. À lancer quand base d'utilisateurs solide.

---

### Fonctionnalité — Partage de plan 📱
**Pub gratuite. Chaque partage = nouveaux utilisateurs potentiels.**

- [ ] Générer une belle image du plan de la semaine
- [ ] Couleurs et logo Mealroots sur l'image
- [ ] Partage direct WhatsApp, Instagram, TikTok
- [ ] Design soigné — une image moche personne ne la partage

**Cercle vertueux** :
```
Soumission recette → fierté → partage → nouveaux users → nouvelles recettes
```

---

### Fonctionnalité — Calendrier alimentaire 📅
**Plus l'utilisateur utilise l'app, plus elle devient intelligente pour lui.**

- [ ] Historique des plans des semaines passées
- [ ] Marquer les plats aimés / pas aimés
- [ ] Mealroots apprend les préférences et personnalise les futurs plans

**Prérequis** : Authentification utilisateur.

---

## 🔵 PHASE 3 — Innovation (6-12 mois)

### Fonctionnalité — Profil Nutritionnel 💪
**Repositionne Mealroots comme app santé ET culture africaine.**

- [ ] Profil utilisateur : âge, poids, taille, fréquence sport
- [ ] Objectif : perdre du poids / prendre masse / manger équilibré
- [ ] Conditions de santé : diabète, hypertension, etc.
- [ ] Affichage calories + protéines + lipides + glucides par repas et journée
- [ ] Plans générés adaptés aux besoins nutritionnels du profil
- [ ] Valeurs nutritionnelles de chaque ingrédient dans la base

**Pourquoi fort** : Casse le mythe "cuisine africaine = trop lourd". Concurrent direct de MyFitnessPal sur terrain vierge.

**Lacune** : Données nutritionnelles pas toujours disponibles pour ingrédients locaux africains.

---

### Fonctionnalité — Scan de plat 📸
**Innovation mondiale. Aucune app ne fait ça pour les plats africains.**

- [ ] Photo de l'assiette → détection du plat
- [ ] Estimation de la portion
- [ ] Affichage calories + macros

**Option court terme** : IA générative vision (Claude Vision / GPT-4V) — rapide mais dépendance IA

**Option long terme** : Modèle entraîné sur photos de plats africains — indépendance totale, précision maximale. Demande milliers de photos annotées.

**Flow complet combiné avec profil nutritionnel** :
```
Plan adapté → cuisine → scan assiette → suivi calories
```

---

### Fonctionnalité — Ce que j'ai dans mon frigo 🥬
**Résout un problème encore plus concret. Zéro gaspillage.**

- [ ] L'utilisateur entre les ingrédients qu'il a déjà
- [ ] Mealroots propose des recettes faisables avec ces ingrédients
- [ ] Matching ingrédients ↔ recettes en SQL pur

**Prérequis** : Base de données avec 200-300 recettes minimum pour des résultats pertinents.

**Lacune** : Faisable sans IA si base suffisamment riche. À attendre que la base soit solide.

---

## 🟢 STRATÉGIE DE DÉPLOIEMENT GÉOGRAPHIQUE

```
Maintenant    → Bénin en profondeur
              (Cotonou, Porto-Novo, Abomey-Calavi)

Dans 6 mois   → Togo + Nigeria
              (pays voisins, cultures similaires)

Dans 1 an     → Afrique de l'Ouest complète
              (Ghana, Côte d'Ivoire, Sénégal...)

Dans 2 ans    → Continent africain
```

**Principe** : Commence local, pense global.
Être LA référence au Bénin vaut mieux qu'être moyen partout en Afrique.

---

## 📝 NOTES IMPORTANTES

- Les prix du marché béninois = donnée hyperlocale impossible à copier. C'est le fossé compétitif le plus fort.
- Toujours afficher "prix estimé" avec date de dernière mise à jour.
- Le scan de plats africains n'existe nulle part dans le monde → innovation réelle.
- La mention "Recette de [Prénom], [Ville]" sur les recettes communautaires = marketing émotionnel gratuit.
- Modèle de vision entraîné sur plats africains = projet de recherche à part entière. Phase 3 minimum.

---

*Dernière mise à jour : Mai 2025*
*Fondateur : Mealroots*