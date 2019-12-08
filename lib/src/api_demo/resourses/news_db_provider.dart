import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/model.dart';

class NewsDbProvider {
  Database db;

  void init() async {
    Directory document = await getApplicationDocumentsDirectory();
    final path = join(document.path, 'items.db');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (newDb, version) {
        newDb.execute("""
          CREATE TABLE Items
          (
            id INTEGER PRIMARY KEY
            deleted TEXT
            type TEXT
            by TEXT
            time INTEGER
            text TEXT
            dead INTEGER
            parent INTEGER
            kids BLOB
            url TEXT
            score INTEGER
            title TEXT
            descendants INTEGER
          ) 
          """);
      },
    );
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db.insert('Items', item.toMapForDb());
  }
}
