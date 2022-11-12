abstract class CacheService {
  String? find({
    required String key,
  });

  void create({
    required String key,
    required String value,
  });

  void delete({
    required String key,
  });
}
