# smart_search

Mini-projet Flutter (calibre ~1 jour) construit pour re-pratiquer les fondamentaux de Riverpod : les différents types de providers, leur implémentation, et leur usage dans une vraie feature — une recherche locale avec debounce sur une liste stockée dans Hive.

## Fonctionnalités

- Liste de ~50 produits (nom + catégorie) générés au premier lancement et persistés localement (Hive)
- Ajout / suppression de produits, persisté
- Barre de recherche filtrant par nom ou catégorie, avec un debounce de 300ms (le filtre ne se déclenche qu'après une pause dans la frappe, pas à chaque lettre)
- Compteur de résultats

## Stack technique

- Flutter + `flutter_riverpod`
- `hive` / `hive_flutter` pour la persistance locale
- `build_runner` + `hive_generator` (dev) pour la génération de l'adapter Hive

## Concepts Riverpod couverts

| Concept | Où | Rôle |
|---|---|---|
| `NotifierProvider` | `ProductListNotifier` | État mutable + logique métier (CRUD produits, synchronisé avec Hive) |
| `StateProvider` | `searchQueryProvider` | État simple sans logique (texte de recherche brut, mis à jour à chaque frappe) |
| `StreamProvider` | `debouncedSearchQueryProvider` | Debounce fait main (`Timer` + `StreamController`) : n'émet qu'après 300ms de silence |
| `Provider` (calculé) | `filteredProductsProvider` | Dérive un résultat (liste filtrée) à partir de deux autres providers, sans état propre |
| `ref.watch` vs `ref.read` | Partout | Lecture réactive (rebuild sur changement) vs action ponctuelle (pas d'écoute) |
| `Consumer` ciblé | `ProductListScreen` | Isole les rebuilds : le `TextField` ne se reconstruit pas quand la liste change |
| `ref.listen` / `ref.onDispose` | `debouncedSearchQueryProvider` | Réagir à un changement et nettoyer les ressources (`Timer`, `StreamController`) depuis l'intérieur d'un provider, pas juste depuis un widget |

## Structure du projet

```
lib/
├── main.dart                                   # bootstrap : init Hive, ProviderScope, runApp
├── models/
│   ├── product.dart                            # modèle Product (@HiveType/@HiveField)
│   └── product.g.dart                          # généré par build_runner — ne pas éditer à la main
├── providers/
│   ├── product_list_provider.dart              # NotifierProvider — liste + persistance
│   ├── search_query_provider.dart              # StateProvider — texte de recherche brut
│   ├── debounced_search_query_provider.dart    # StreamProvider — texte debouncé
│   └── filtered_products_provider.dart         # Provider calculé — résultats filtrés
└── screens/
    └── product_list_screen.dart                # UI : barre de recherche + compteur + liste
```

## Lancer le projet

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```