import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

part 'f001_test_api_data_source.g.dart';

/*
cd /Users/rwakizaka/pc_data/project/rwakizaka32/flutter_test3
fvm flutter pub run build_runner build --delete-conflicting-outputs
 */

@JsonSerializable()
class TestApiApi1Result {
  TestApiApi1Result({required this.uniqueId});

  @JsonKey(name: 'unique_id') String uniqueId;
  factory TestApiApi1Result.fromJson(Map<String, dynamic> json)
  => _$TestApiApi1ResultFromJson(json);
  Map<String, dynamic> toJson() => _$TestApiApi1ResultToJson(this);
}
class TestApiDataSource {
  TestApiDataSource({required this.ref});
  final Ref ref;

  final baseUrl = 'https://wakizaka24.sakura.ne.jp/reversi/php';

  Future<TestApiApi1Result> getUniqueId() async {
    var response = await http.get(Uri.parse('$baseUrl/api1_get_unique_id.php'));
    var json = convert.json.decode(response.body) as Map<String, dynamic>;
    return TestApiApi1Result.fromJson(json);
  }
}
final testApiDataSourceProvider = Provider<TestApiDataSource>((ref) {
  return TestApiDataSource(ref: ref);
});




/*
@RestApi()
abstract class TestApiDataSource {
  factory TestApiDataSource(Ref ref) =>
      _TestApiDataSource(ref.read(testApiDioProvider));

  @GET("/api1_get_unique_id.php")
  Future<TestApiApi1Result> getUniqueId();
}
@JsonSerializable()
class TestApiApi1Result {
  TestApiApi1Result({required this.uniqueId});

  @JsonKey(name: "unique_id") String uniqueId;
  factory TestApiApi1Result.fromJson(Map<String, dynamic> json)
  => _$TestApiApi1ResultFromJson(json);
  Map<String, dynamic> toJson() => _$TestApiApi1ResultToJson(this);
}
final testApiDataSourceProvider =
Provider<TestApiDataSource>((ref) {
  return TestApiDataSource(ref);
});

// setting
class TestApiDio with DioMixin implements Dio {
  static final TestApiDio _instance = TestApiDio._internal();

  factory TestApiDio() {
    return _instance;
  }

  TestApiDio._internal([BaseOptions? options]) {
    httpClientAdapter = IOHttpClientAdapter();
    options = BaseOptions(
        baseUrl: "https://wakizaka24.sakura.ne.jp/reversi/php",
        headers: {"Content-Type": "application/json",});

    this.options = options;
  }
}
final testApiDioProvider = Provider((_) => TestApiDio());
*/
