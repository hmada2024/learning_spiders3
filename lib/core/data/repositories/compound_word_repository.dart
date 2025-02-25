// lib/features/learning/data/repositories/compound_word_repository.dart
import 'package:sqflite/sqflite.dart';
import '../models/compound_word_model.dart';
import '../../config/database_constants.dart';

class CompoundWordRepository {
  final Future<Database> database;

  CompoundWordRepository(this.database);

  Future<List<CompoundWord>> getAllCompoundWords() async {
    final db = await database;
    try {
        final List<Map<String, dynamic>> maps = await db
            .query(Constants.compoundWordsTable);
        return maps.map((map) => CompoundWord.fromMap(map)).toList();
    } catch (e) {
        throw Exception('Failed to load compound words: ${e.toString()}');
    }
  }

  Future<void> insertCompoundWord(CompoundWord compoundWord) async {
    final db = await database;
    try {
        await db.insert(
          Constants.compoundWordsTable,
          compoundWord.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
    } catch (e) {
        throw Exception('Failed to insert compound word: ${e.toString()}');
    }
  }

  Future<void> updateCompoundWord(CompoundWord compoundWord) async {
    final db = await database;
    try {
        await db.update(
          Constants.compoundWordsTable,
          compoundWord.toMap(),
          where: '${Constants.compoundWordIdColumn} = ?',
          whereArgs: [compoundWord.id],
        );
    } catch (e) {
        throw Exception('Failed to update compound word: ${e.toString()}');
    }
  }

  Future<void> deleteCompoundWord(int id) async {
    final db = await database;
    try {
      await db.delete(
        Constants.compoundWordsTable,
        where: '${Constants.compoundWordIdColumn} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception('Failed to delete compound word: ${e.toString()}');
    }
  }
}