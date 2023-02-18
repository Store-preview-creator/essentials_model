import 'package:hive_flutter/adapters.dart';

class Storage {
  // inicializa o Hive para ser usado no Flutter.
  static void init() async {
    await Hive.initFlutter();
  }

  // faz o registro do adapter para o tipo T no Hive (que é um singleton) para que possa ser usado em qualquer
  //lugar do app sem precisar registrar novamente (e.g. em outro arquivo).
  static void registerAdapter<T>(TypeAdapter<T> adapter) {
    Hive.registerAdapter(adapter);
  }

  // abre uma caixa (Storage) com o nome name e o tipo T (que é o tipo dos dados que serão armazenados nessa caixa)..
  static Future<void> openStorage<T>(String name) async {
    await Hive.openBox<T>(name);
  }

  // fecha a caixa (Storage) com o nome.
  static Future<void> closeStorage(String name) async {
    await Hive.box(name).close();
  }

  // fecha todas as caixas (Storages) abertas.
  static Future<void> deleteStorage(String name) async {
    await Hive.deleteBoxFromDisk(name);
  }

  // fecha todas as caixas (Storages) abertas.
  static Future<void> deleteStorages() async {
    await Hive.deleteFromDisk();
  }

  // limpa todos os dados da caixa (Storage) com o nome name.
  static Future<void> clearStorage(String name) async {
    await Hive.box(name).clear();
  }

  // armazena um dado na caixa (Storage) com o nome name.
  static Future<void> put<T>(String name, String key, T value) async {
    await Hive.box(name).put(key, value);
  }

  // armazena uma lista de dados na caixa (Storage) com o nome name.
  static Future<void> putAll<T>(String name, Map<String, T> map) async {
    await Hive.box(name).putAll(map);
  }

  // recupera um dado da caixa (Storage) com o nome name.
  static T get<T>(String name, String key) {
    return Hive.box(name).get(key);
  }

  // recupera uma lista de dados da caixa (Storage) com o nome name.
  static Map<dynamic, dynamic> getAll<T>(String name) {
    return Hive.box(name).toMap();
  }

  // deleta um dado da caixa (Storage) com o nome name.
  static Future<void> delete(String name, String key) async {
    await Hive.box(name).delete(key);
  }

  // deleta uma lista de dados da caixa (Storage) com o nome name.
  static Future<void> deleteAll(String name, List<String> keys) async {
    await Hive.box(name).deleteAll(keys);
  }

  // verifica se a caixa (Storage) com o nome name contém um dado com a chave key.
  static bool containsKey(String name, String key) {
    return Hive.box(name).containsKey(key);
  }

  // cria varias boxs (Storages) com o nome name e o tipo T (que é o tipo dos dados que serão armazenados nessa caixa).
  static Future<void> openStorages<T>(List<String> names) async {
    for (var name in names) {
      await Hive.openBox<T>(name);
    }
  }

  // fecha varias boxs (Storages) com o nome name.
  static Future<void> closeStorages(List<String> names) async {
    for (var name in names) {
      await Hive.box(name).close();
    }
  }

  // deleta varias boxs (Storages) com o nome name.
  static Future<void> deleteStoragesByName(List<String> names) async {
    for (var name in names) {
      await Hive.deleteBoxFromDisk(name);
    }
  }

  // limpa varios dados da caixa (Storage) com o nome name.
  static Future<void> clearStorages(List<String> names) async {
    for (var name in names) {
      await Hive.box(name).clear();
    }
  }

  // recupera varios dados da caixa (Storage) com o nome name.
  static Map<dynamic, dynamic> getAllStorages<T>(List<String> names) {
    Map<dynamic, dynamic> map = {};
    for (var name in names) {
      map.addAll(Hive.box(name).toMap());
    }
    return map;
  }
}
