abstract class IApi {
  Map<String, dynamic> get({required String endpoint});

  Future<Map<String, dynamic>> getFilter({required String endpoint, required Map<String, dynamic> data});

  Future<Map<String, dynamic>> post({required String endpoint, required Map<String, dynamic> data});

  Future<Map<String, dynamic>> put({required String endpoint, required Map<String, dynamic> data});

  Future<Map<String, dynamic>> delete({required String endpoint, required Map<String, dynamic> data});

  Future<Map<String, dynamic>> patch({required String endpoint, required Map<String, dynamic> data});
}
