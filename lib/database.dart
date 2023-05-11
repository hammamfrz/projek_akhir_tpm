import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:bcrypt/bcrypt.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initializeDatabase();
    return _db;
  }

  DatabaseHelper._privateConstructor();
  DatabaseHelper.internal();

  Future<Database> initializeDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_db.db');
    final myDb = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY,
            username TEXT,
            password TEXT
          )
        ''');
      },
    );

    return myDb;
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await this.db;
    final result = await db!.insert('users', user);
    return result;
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await this.db;
    final result = await db!.query('users');
    return result;
  }

  Future<List<Map<String, dynamic>>> selectUser(String username) async {
    final db = await this.db;
    final result = await db!.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    return result;
  }

  Future<String> hashPassword(String password) async {
    final salt = await BCrypt.gensalt();
    final hash = await BCrypt.hashpw(password, salt);
    return hash;
  }

  Future<bool> checkPassword(String password, String hash) async {
    final result = await BCrypt.checkpw(password, hash);
    return result;
  }
}
