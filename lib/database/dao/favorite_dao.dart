import 'package:pokedex/database/app_database.dart';
import 'package:pokedex/models/repository/favorite_repository.dart';
import 'package:sembast/sembast.dart';

class FavoriteDAO {
  static const String FAVORITE_STORE_NAME = 'favorite';

  final _favoriteStore = intMapStoreFactory.store(FAVORITE_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future save(Favorite favorite) async {
    await _favoriteStore.add(await _db, favorite.toMap());
  }

  Future update(Favorite favorite) async {
    final finder = Finder(filter: Filter.byKey(favorite.id));
    await _favoriteStore.update(
      await _db,
      favorite.toMap(),
      finder: finder,
    );
  }

  Future delete(Favorite favorite) async {
    final finder = Finder(filter: Filter.byKey(favorite.id));
    await _favoriteStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Favorite>> getList() async {
    final recordSnapshots = await _favoriteStore.find(
      await _db,
    );

    return recordSnapshots.map((snapshot) {
      final favorite = Favorite.fromMap(snapshot.value);
      favorite.id = snapshot.key;
      return favorite;
    }).toList();
  }
}
