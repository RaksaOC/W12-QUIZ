/// Repository Base
///
/// Abstract base class that provides common CRUD operations for repositories.
/// Child classes only need to implement JSON serialization methods.
library;

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';

abstract class RepositoryBase<T> {
  final String dbPath;
  final String? assetPath;
  bool _initialized = false;
  static String? _documentsDirectory;

  RepositoryBase(this.dbPath, {this.assetPath}) {
    initialize();
    initializeAsset();
  }

  /// Initialize documents directory (call this once in main before creating repositories)
  static Future<void> initializeDocumentsDirectory() async {
    if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
      final directory = await getApplicationDocumentsDirectory();
      _documentsDirectory = directory.path;
    }
  }

  /// Resolve the actual file path (use documents directory on mobile)
  String _resolvePath(String filePath) {
    if (!kIsWeb &&
        (Platform.isIOS || Platform.isAndroid) &&
        _documentsDirectory != null) {
      return path.join(_documentsDirectory!, path.basename(filePath));
    }
    return filePath;
  }

  /// Abstract methods - must be implemented by child classes
  Map<String, dynamic> toJson(T entity);
  T fromJson(Map<String, dynamic> json);

  /// Initialize the repository with database/path configuration
  void initialize() {
    if (_initialized) return;

    final resolvedPath = _resolvePath(dbPath);
    final file = File(resolvedPath);
    if (!file.existsSync()) {
      file.parent.createSync(recursive: true);
      // Create empty array initially, will be populated from asset in loadAll if needed
      file.writeAsStringSync('[]');
    }
    _initialized = true;
  }

  /// Copy data from asset bundle to the target file (async)
  static Future<void> copyAssetToFile(
    String assetPath,
    String targetPath,
  ) async {
    try {
      // Load from asset bundle asynchronously
      final assetData = await rootBundle.loadString(assetPath);
      // Write to target file
      File(targetPath).writeAsStringSync(assetData);
    } catch (e) {
      // If asset loading fails, keep empty array
    }
  }

  /// Initialize asset data for this repository (call before first use)
  Future<void> initializeAsset() async {
    if (assetPath == null) return;

    final resolvedPath = _resolvePath(dbPath);
    final file = File(resolvedPath);

    // Only copy if file doesn't exist or is empty
    if (!file.existsSync() || file.readAsStringSync().trim() == '[]') {
      await copyAssetToFile(assetPath!, resolvedPath);
    }
  }

  /// Load all entities from storage
  List<T> loadAll() {
    initialize();
    final resolvedPath = _resolvePath(dbPath);
    final file = File(resolvedPath);
    final content = file.readAsStringSync();
    final List<dynamic> jsonList = json.decode(content);
    return jsonList.map((json) => fromJson(json)).toList();
  }

  /// Save entities list to storage
  void saveAll(List<T> entities) {
    initialize();
    final resolvedPath = _resolvePath(dbPath);
    final file = File(resolvedPath);
    final jsonList = entities.map((e) => toJson(e)).toList();
    file.writeAsStringSync(json.encode(jsonList));
  }

  /// Create a new entity record
  T? create(T entity) {
    final entities = loadAll();
    entities.add(entity);
    saveAll(entities);
    return entity;
  }

  /// Retrieve an entity by ID
  T? getById(String id) {
    final entities = loadAll();
    try {
      return entities.firstWhere((entity) => _getId(entity) == id);
    } catch (e) {
      return null;
    }
  }

  /// Update an existing entity
  bool update(T entity) {
    final entities = loadAll();
    final index = entities.indexWhere((e) => _getId(e) == _getId(entity));
    if (index == -1) return false;

    entities[index] = entity;
    saveAll(entities);
    return true;
  }

  /// Delete an entity by ID
  bool delete(String id) {
    final entities = loadAll();
    final originalLength = entities.length;
    entities.removeWhere((entity) => _getId(entity) == id);
    final newLength = entities.length;
    saveAll(entities);
    return newLength < originalLength;
  }

  /// Get all entities
  List<T> getAll() {
    return loadAll();
  }

  /// Extract ID from entity - to be implemented by child class if needed
  String _getId(T entity) {
    // This is a generic implementation that tries to read 'id' from the JSON
    // Child classes can override if needed
    final json = toJson(entity);
    final idValue = json['id'];
    return idValue?.toString() ?? '';
  }
}
