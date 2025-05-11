import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AiContentGenerationApiCall {
  static Future<ApiCallResponse> call({
    bool? generateFlashcard = true,
    int? numOfQuestions = 10,
    int? numOfChoices = 4,
    String? url = '',
    String? textContent = '',
    String? pdfBinary = '',
  }) async {
    final ffApiRequestBody = '''
{
  "data": {
    "generate_flashcards": ${generateFlashcard},
    "num_questions": ${numOfQuestions},
    "num_choices": ${numOfChoices},
    "url": "${url}",
    "text_content": "${textContent}",
"pdf_file": "${pdfBinary}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AiContentGenerationApi',
      apiUrl:
          'https://2mmjiwjyo27dfsa227qdc67jue0drajz.lambda-url.eu-west-1.on.aws/',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AiContentGenerationApiCopyCall {
  static Future<ApiCallResponse> call({
    bool? generateFlashcard = true,
    int? numOfQuestions = 10,
    int? numOfChoices = 4,
    String? url = '',
    String? textContent = '',
    String? pdfBinary = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'AiContentGenerationApi Copy',
      apiUrl:
          'https://2mmjiwjyo27dfsa227qdc67jue0drajz.lambda-url.eu-west-1.on.aws/',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'data': generateFlashcard,
        'pdf_file': numOfQuestions,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
