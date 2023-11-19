import 'dart:async';
import 'dart:core';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/jugadas_enviadas_model.dart';
import '../models/jugadas_model.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._init();

  static Database? _database;
  LocalDatabase._init();

  final String tableJugada = 'jugadas';
  final String tableJugadaServer = 'jugadas_server';
  final String tableJugadaEnviadas = 'jugadas_enviadas';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('jugadas.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  FutureOr<void> _onCreateDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE jugadas(
    id INTEGER PRIMARY KEY,
    idem_pk INTEGER,
    number INTEGER,
    fijo DOUBLE,
    corrido DOUBLE,
    type TEXT,
    bet DOUBLE,
    numbers TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE jugadas_server(
    id INTEGER PRIMARY KEY,
    idem_pk INTEGER,
    number INTEGER,
    fijo DOUBLE,
    corrido DOUBLE,
    type TEXT,
    bet DOUBLE,
    numbers TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE jugadas_enviadas(
    id INTEGER PRIMARY KEY,
    number INTEGER,
    fijo DOUBLE,
    corrido DOUBLE,
    type TEXT,
    bet DOUBLE,
    numbers TEXT,
    day INTEGER,
    month INTEGER,
    year INTEGER,
    session TEXT
    )
    ''');
  }

  Future<void> insertServer(JugadasModel jm) async {
    final db = await instance.database;
    await db.insert(tableJugadaServer, jm.toMap());
  }

  Future<void> insertEnviadas(List<JugadasEnviadasModel> jm) async {
    final db = await instance.database;
    for (final i in jm) {
      await db.insert(tableJugadaEnviadas, i.toMap());
    }
  }

  Future<void> insert(JugadasModel jm) async {
    final db = await instance.database;
    await db.insert(tableJugada, jm.toMap());
  }

  Future<List<JugadasModel>> getAllItems() async {
    final db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableJugada);
    return List.generate(maps.length, (i) {
      return JugadasModel(
        maps[i]['idem_pk'],
        maps[i]['number'],
        maps[i]['fijo'],
        maps[i]['corrido'],
        maps[i]['type'],
        maps[i]['bet'],
        maps[i]['numbers'],
      );
    });
  }

  Future<List<JugadasEnviadasModel>> getAllItemsEnviadas(
      day, month, year, session) async {
    var query = "day = $day AND month = $month AND year = $year AND session = '"
        '$session'
        "'";
    final db = await instance.database;
    List<Map<String, dynamic>> mapsall = await db.query(tableJugadaEnviadas);

    List<Map<String, dynamic>> maps =
        await db.query(tableJugadaEnviadas, where: query);
    return List.generate(maps.length, (i) {
      return JugadasEnviadasModel(
          maps[i]['number'],
          maps[i]['fijo'],
          maps[i]['corrido'],
          maps[i]['type'],
          maps[i]['bet'],
          maps[i]['numbers'],
          maps[i]['day'],
          maps[i]['month'],
          maps[i]['year'],
          maps[i]['session']);
    });
  }

  Future<List<JugadasModel>> getAllItemsServer() async {
    final db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableJugada);
    return List.generate(maps.length, (i) {
      return JugadasModel(
          maps[i]['idem_pk'],
          maps[i]['number'],
          maps[i]['fijo'],
          maps[i]['corrido'],
          maps[i]['type'],
          maps[i]['bet'],
          maps[i]['numbers']);
    });
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db.delete(tableJugada, where: "idem_pk = $id");
  }

  Future<int> deleteAll() async {
    final db = await instance.database;
    return db.delete(tableJugada);
  }

  Future<List<JugadasModel>> getCentenaByNumber(centena) async {
    final db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(tableJugada,
        where: "number = $centena AND type = 'centena'");
    return List.generate(maps.length, (i) {
      return JugadasModel(
          maps[i]['idem_pk'],
          maps[i]['number'],
          maps[i]['fijo'],
          maps[i]['corrido'],
          maps[i]['type'],
          maps[i]['bet'],
          maps[i]['numbers']);
    });
  }
}
