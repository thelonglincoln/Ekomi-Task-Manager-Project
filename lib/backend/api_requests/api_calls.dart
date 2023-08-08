import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class WeatherCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'weather',
      apiUrl: 'http://api.weatherapi.com/v1/current.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "42cca80aca5f4b5fad1163954230208",
        'q': "Cape Town",
        'aqi': "yes",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic celcius(dynamic response) => getJsonField(
        response,
        r'''$..temp_c''',
      );
  static dynamic humidity(dynamic response) => getJsonField(
        response,
        r'''$..humidity''',
      );
  static dynamic time(dynamic response) => getJsonField(
        response,
        r'''$..localtime''',
      );
  static dynamic airquality(dynamic response) => getJsonField(
        response,
        r'''$..air_quality''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
