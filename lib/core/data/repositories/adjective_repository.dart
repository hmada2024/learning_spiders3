// lib/features/learning/data/repositories/adjective_repository.dart
import 'package:learning_spiders/core/data/models/adjective_model.dart';
import 'package:sqflite/sqflite.dart';
import '../../config/database_constants.dart';

class AdjectiveRepository {
  final Future<Database> database;

  AdjectiveRepository(this.database);

   Future<List<Adjective>> getAllAdjectives() async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps =
          await db.query(Constants.adjectivesTable);
      return maps.map((map) => Adjective.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to load adjectives: ${e.toString()}');
    }
  }

  Future<void> insertAdjective(Adjective adjective) async {
    final db = await database;
    try {
        await db.insert(
          Constants.adjectivesTable,
          adjective.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
    } catch (e) {
        throw Exception('Failed to insert adjective: ${e.toString()}');
    }
  }

  Future<void> updateAdjective(Adjective adjective) async {
    final db = await database;
    try {
        await db.update(
          Constants.adjectivesTable,
          adjective.toMap(),
          where: '${Constants.adjectiveIdColumn} = ?',
          whereArgs: [adjective.id],
        );
    } catch (e) {
        throw Exception('Failed to update adjective: ${e.toString()}');
    }
  }

  Future<void> deleteAdjective(int id) async {
    final db = await database;
    try {
        await db.delete(
          Constants.adjectivesTable,
          where: '${Constants.adjectiveIdColumn} = ?',
          whereArgs: [id],
        );
    } catch (e) {
        throw Exception('Failed to delete adjective: ${e.toString()}');
    }
  }
}