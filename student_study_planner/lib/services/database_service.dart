import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  Database? _database;

  DatabaseService._internal();

  factory DatabaseService() => _instance;

  // Initialize database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'study_planner.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE users(id TEXT PRIMARY KEY, name TEXT, email TEXT)',
        );
        db.execute(
          'CREATE TABLE products(id TEXT PRIMARY KEY, name TEXT, description TEXT, price REAL)',
        );
      },
      version: 1,
    );
  }

  // Insert data
  Future<void> insertData(String table, Map<String, dynamic> data) async {
    final db = await database;
    await db.insert(table, data);
  }

  // Fetch data
  Future<List<Map<String, dynamic>>> fetchData(String table) async {
    final db = await database;
    return await db.query(table);
  }
}
