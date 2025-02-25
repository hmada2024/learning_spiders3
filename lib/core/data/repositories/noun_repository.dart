// lib/core/data/repositories/noun_repository.dart
import 'package:learning_spiders/core/data/models/nouns_model.dart';
import 'package:sqflite/sqflite.dart';
import '../../config/database_constants.dart';

class NounRepository {
  final Future<Database> database;

  NounRepository(this.database);

  Future<List<Noun>> getAllNouns() async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps =
          await db.query(Constants.nounsTable);
      return maps.map((map) => Noun.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to load nouns: ${e.toString()}');
    }
  }

  Future<void> insertNoun(Noun noun) async {
    final db = await database;
    try {
        await db.insert(
          Constants.nounsTable,
          noun.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
    } catch (e) {
        throw Exception('Failed to insert noun: ${e.toString()}');
    }
  }

  Future<void> updateNoun(Noun noun) async {
    final db = await database;
    try {
        await db.update(
          Constants.nounsTable,
          noun.toMap(),
          where: '${Constants.nounIdColumn} = ?',
          whereArgs: [noun.id],
        );
    } catch (e) {
        throw Exception('Failed to update noun: ${e.toString()}');
    }
  }

  Future<void> deleteNoun(int id) async {
    final db = await database;
    try {
        await db.delete(
          Constants.nounsTable,
          where: '${Constants.nounIdColumn} = ?',
          whereArgs: [id],
        );
    } catch (e) {
      throw Exception('Failed to delete noun: ${e.toString()}');
    }
  }

    Future<List<Noun>> getNounsByCategory(String category) async {
        final db = await database;
        List<Map<String, dynamic>> maps;
        try{
          if (category == 'all') {
              maps = await db.query(Constants.nounsTable);
          } else {
              maps = await db.query(
                  Constants.nounsTable,
                  where: '${Constants.nounCategoryColumn} = ?',
                  whereArgs: [category],
              );
          }
        }catch (e){
          throw Exception('Failed to load nouns By Category: ${e.toString()}');
        }
        return maps.map((map) => Noun.fromMap(map)).toList();
    }
     Future<List<String>> getAllCategories() async {
        final db = await database;
        try {
            final List<Map<String, dynamic>> maps = await db.query(
              Constants.nounsTable,
              columns: [Constants.nounCategoryColumn],
              distinct: true,
            );
            return maps.map((map) => map[Constants.nounCategoryColumn] as String).toList();
        } catch (e) {
            throw Exception('Failed to load categories: ${e.toString()}');
        }
  }
}