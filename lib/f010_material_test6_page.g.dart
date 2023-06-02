// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'f010_material_test6_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Api1Result _$Api1ResultFromJson(Map<String, dynamic> json) => Api1Result(
      uniqueId: json['uniqueId'] as String,
    );

Map<String, dynamic> _$Api1ResultToJson(Api1Result instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _GetApiTestInfoDataSource implements GetApiTestInfoDataSource {
  _GetApiTestInfoDataSource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://wakizaka24.sakura.ne.jp/reversi/php';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Api1Result> getUniqueId() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<Api1Result>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api1_get_unique_id.php',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Api1Result.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
