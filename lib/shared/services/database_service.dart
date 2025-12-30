abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  });

  Future<bool> exists({
    required String path,
    required String documentId,
  });

  Future<void> updateData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  });

  Future<void> setData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  });

  Future<void> deleteData({
    required String path,
    required String documentId,
  });

  Future<void> deleteCollection({
    required String path,
  });

  Stream<Map<String, dynamic>> streamDocument({
    required String path,
    required String documentId,
  });

  Stream<List<Map<String, dynamic>>> streamCollection({
    required String path,
  });

  Future<List<Map<String, dynamic>>> getCollection({
    required String path,
    int? limit,
  });
}
