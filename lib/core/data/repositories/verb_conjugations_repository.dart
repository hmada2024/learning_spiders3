// lib/features/learning/data/repositories/verb_conjugations_repository.dart
import 'package:sqflite/sqflite.dart';
import '../models/verb_conjugations_models.dart';
import '../../config/database_constants.dart';

class VerbConjugationsRepository {
  final Future<Database> database;

  VerbConjugationsRepository(this.database);

  Future<List<Verb>> getAllVerbs() async {
    final db = await database;
    try {
        final List<Map<String, dynamic>> maps =
            await db.query(Constants.verbsTable);
        return maps.map((map) => Verb.fromMap(map)).toList();
    } catch (e) {
        throw Exception('Failed to load verbs: ${e.toString()}');
    }
  }

  Future<List<Conjugations>> getConjugations(int verbId) async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps = await db.query(
        Constants.conjugationsTable,
        where: '${Constants.conjugationVerbIdColumn} = ?',
        whereArgs: [verbId],
      );
      return maps.map((map) => Conjugations.fromMap(map)).toList();
    } catch (e) {
        throw Exception('Failed to load conjugations: ${e.toString()}');
    }
  }

  Future<void> insertVerb(Verb verb) async {
    final db = await database;
    try {
        await db.insert(
          Constants.verbsTable,
          verb.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
    } catch (e) {
        throw Exception('Failed to insert verb: ${e.toString()}');
    }
  }

  Future<void> insertConjugation(Conjugations conjugation) async {
    final db = await database;
    try {
        await db.insert(
          Constants.conjugationsTable,
          conjugation.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
    } catch (e) {
        throw Exception('Failed to insert conjugation: ${e.toString()}');
    }
  }

  Future<void> updateVerb(Verb verb) async {
    final db = await database;
    try {
      await db.update(
        Constants.verbsTable,
        verb.toMap(),
        where: '${Constants.verbIdColumn} = ?',
        whereArgs: [verb.id],
      );
    } catch (e) {
        throw Exception('Failed to update verb: ${e.toString()}');
    }
  }

  Future<void> updateConjugation(Conjugations conjugation) async {
    final db = await database;
    try {
        await db.update(
          Constants.conjugationsTable,
          conjugation.toMap(),
          where: '${Constants.conjugationIdColumn} = ?',
          whereArgs: [conjugation.id],
        );
    } catch (e) {
        throw Exception('Failed to update conjugation: ${e.toString()}');
    }
  }

  Future<void> deleteVerb(int id) async {
    final db = await database;
    try {
      await db.delete(
        Constants.verbsTable,
        where: '${Constants.verbIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception('Failed to delete verb: ${e.toString()}');
    }
  }

  Future<void> deleteConjugation(int id) async {
    final db = await database;
    try {
      await db.delete(
        Constants.conjugationsTable,
        where: '${Constants.conjugationIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
        throw Exception('Failed to delete conjugation: ${e.toString()}');
    }
  }
}