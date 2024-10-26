import 'package:directory/features/read_person/domain/entities/person_entity.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static Database? _db;
  String? _path;

  Future<Database> get db async {
    _db ??= await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    var databasesPath = await getDatabasesPath();
    _path = join(databasesPath, "directory.db");

    Database database = await openDatabase(
      _path!,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE IF NOT EXISTS ${DBKeys.contacts} (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, age TEXT)');
      },
      onUpgrade: _onUpgrade,
    );

    return database;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    ///TODO: implemented update db
  }

  void deleteAll() {
    deleteDatabase(_path!);
  }

  Future<bool> delete(String table, {String where = ''}) async {
    Database database = await db;
    String query = 'DELETE FROM $table';

    if (where.isNotEmpty) {
      query += " WHERE $where";
    }

    int count = await database.rawDelete(query);

    if (count > 0) {
      debugPrint("deleted $count records from $table");
    } else {
      debugPrint("Nothing to delete from $table");
    }

    return count > 0;
  }

  Future<bool> insertProspecto(String name, String email, String age) async {
    bool inserted = false;
    try {
      Database database = await db;
      await database.insert(
        DBKeys.contacts,
        {
          'name': name,
          'email': email,
          'age': age,
        },
      );
      inserted = true;
    } catch (e) {
      inserted = false;
      debugPrint("ERROR AL INSERTAR CONTACTO -> $e");
    }

    return inserted;
  }

  Future<bool> updateProspecto(String id, String name, String email, String age) async {
    bool update = false;
    try {
      Database database = await db;
      await database.update(
        'Prospectos',
        {
          'name': name,
          'email': email,
          'age': age,
        },
        where: 'id = ? ',
        whereArgs: [id],
      );
      update = true;
    } catch (e) {
      update = false;
      debugPrint("ERROR AL ACTUALIZAR EN CONTACTO -> $e");
    }

    return update;
  }

  Future<List<PersonEntity>> getPersons() async {
    Database database = await db;
    final List<Map<String, Object?>> queryReponse = await database.query(DBKeys.contacts);
    return queryReponse.map((e) => PersonEntity.fromMap(e)).toList();
  }

  Future<PersonEntity> getPerson(int id) async {
    Database database = await db;
    var queryReponse = await database.query(DBKeys.contacts, where: 'id = ?', whereArgs: [id]);
    return queryReponse.map((e) => PersonEntity.fromMap(e)).first;
  }
}

class DBKeys {
  static String contacts = 'Contacts';
}
