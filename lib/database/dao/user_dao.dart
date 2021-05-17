import 'package:pokedex/database/app_database.dart';
import 'package:pokedex/models/repository/user_repository.dart';
import 'package:sembast/sembast.dart';

class UserDAO {
  static const String USER_STORE_NAME = 'users';

  final _userStore = intMapStoreFactory.store(USER_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future save(User user) async {
    await _userStore.add(await _db, user.toMap());
  }

  // Future update(User user) async {
  //   final finder = Finder(filter: Filter.byKey(user.id));
  //   await _userStore.update(
  //     await _db,
  //     user.toMap(),
  //     finder: finder,
  //   );
  // }

  Future<List<User>> getList() async {
    final recordSnapshots = await _userStore.find(
      await _db,
    );

    return recordSnapshots.map((snapshot) {
      final user = User.fromMap(snapshot.value);
      user.id = snapshot.key;
      return user;
    }).toList();
  }
}
