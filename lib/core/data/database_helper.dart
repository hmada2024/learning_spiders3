// lib/core/data/database_helper.dart
import 'package:learning_spiders/core/config/database_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:learning_spiders/core/data/models/adjective_model.dart';
import 'package:learning_spiders/core/data/models/compound_word_model.dart';
import 'package:learning_spiders/core/data/models/nouns_model.dart';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

import 'package:learning_spiders/core/data/models/verb_conjugations_models.dart';

class DatabaseHelper {
  static Database? _database;
  static DatabaseHelper? _databaseHelperInstance;
  static const String _dbCopyKey = 'db_copied'; // Key for SharedPreferences


  static DatabaseHelper getInstance() {
    _databaseHelperInstance ??= DatabaseHelper._internal();
    return _databaseHelperInstance!;
  }

  DatabaseHelper._internal();

  static Future<DatabaseHelper> initialize() async {
    final dbHelper = getInstance();
    await dbHelper.database;
    return dbHelper;
  }

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'database_files', Constants.databaseName);
    bool exists = await databaseExists(path);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool dbCopied = prefs.getBool(_dbCopyKey) ?? false;

    if (!exists || !dbCopied) {
      try {
        await Directory(dirname(path)).create(recursive: true);
        ByteData data = await rootBundle
            .load("assets/database_files/${Constants.databaseName}");
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(path).writeAsBytes(bytes, flush: true);

        await prefs.setBool(_dbCopyKey, true);
        debugPrint("DatabaseHelper: Database copied from assets.");
      } catch (e) {
        debugPrint("DatabaseHelper: Error copying database from assets: $e");
        throw Exception("Failed to copy database from assets: $e");
      }
    }

    try {
        final db = await openDatabase(path);
        return db;
    } catch (e) {
        debugPrint("DatabaseHelper: failed to open the database: $e");
        throw Exception("Failed to open the database: $e");
    }
  }

  Future<List<Adjective>> getAdjectives() async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps =
          await db.query(Constants.adjectivesTable);
      return maps.map((map) => Adjective.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to load adjectives: ${e.toString()}');
    }
  }

  Future<List<CompoundWord>> getCompoundWords() async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps =
          await db.query(Constants.compoundWordsTable);
      return maps.map((map) => CompoundWord.fromMap(map)).toList();
    } catch (e) {
        throw Exception('Failed to load Compound Words: ${e.toString()}');
    }
  }

  Future<List<Noun>> getNouns() async {
    final db = await database;
    try {
        final List<Map<String, dynamic>> maps =
            await db.query(Constants.nounsTable);
        return maps.map((map) => Noun.fromMap(map)).toList();
    } catch (e) {
        throw Exception('Failed to load nouns: ${e.toString()}');
      }
  }

  Future<List<Noun>> getNounsByCategory(String category) async {
    final db = await database;
    try {
        List<Map<String, dynamic>> maps;

        if (category == 'all') {
            maps = await db.query(Constants.nounsTable);
        } else {
            maps = await db.query(
                Constants.nounsTable,
                where: '${Constants.nounCategoryColumn} = ?',
                whereArgs: [category],
            );
        }
        return maps.map((map) => Noun.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to load nouns by category: ${e.toString()}');
    }
  }

    Future<List<Noun>> getNounsForMatchingQuiz() async {
        final db = await database;
        try {
            final List<Map<String, dynamic>> maps =
                await db.query(Constants.nounsTable);
            return maps.map((e) => Noun.fromMap(e)).toList();
        } catch (e) {
            throw Exception('Failed to load nouns for matching quiz: ${e.toString()}');
        }
  }

  Future<List<Verb>> getVerbs() async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps =
          await db.query(Constants.verbsTable);

      return maps.map((map) => Verb.fromMap(map)).toList();
    } catch (e) {
        throw Exception('Failed to load verbs: ${e.toString()}');
    }
  }

  Future<List<Conjugations>> getConjugationsByVerbId(int verbId) async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps = await db.query(
        Constants.conjugationsTable,
        where: '${Constants.conjugationVerbIdColumn} = ?',
        whereArgs: [verbId],
      );
      return maps.map((map) => Conjugations.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Failed to load conjugations by verb ID: ${e.toString()}');
    }
  }
}