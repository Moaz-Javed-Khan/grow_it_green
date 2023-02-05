import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:grow_it_green/data/helpers/api_config.dart';
import 'package:grow_it_green/data/helpers/exception_model.dart';
import 'package:grow_it_green/domain/auth_repository/repository.dart';
import 'package:http/http.dart' as http;

/// API Client to interact with any REST API
class APIClient {
  APIClient({
    this.authRepository,
    http.Client? client,
  }) : _client = client ?? http.Client();

  final http.Client _client;
  final AuthRepository? authRepository;

  /// Header with [JWT] token
  Map<String, String>? get headerWithToken =>
      (authRepository?.authToken == null)
          ? {'Content-Type': 'application/json'}
          : {
              'Content-Type': 'application/json',
              'Authorization': "Bearer ${authRepository?.authToken ?? ""}",
            };

  /// Used to initiate a [GET] request
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [APIConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<dynamic> get({
    required String handle,
    String? baseUrl,
    Map<String, String>? kHeader,
    Duration? kTimeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    final url = (baseUrl ?? APIConfig.baseUrl) + handle;

    // uri to be passed to request
    final uri = Uri.parse(url);

    // final header which will be used to make call
    final header = kHeader ?? headerWithToken;

    // final timeout to be used with request
    final timeOut = kTimeOut ?? APIConfig.responseTimeOut;

    if (enableLogs) {
      log(
        'Request URl: $url',
        name: 'package.rest_api.$handle',
      );
      log(
        'Request Header: ${jsonEncode(header)}',
        name: 'package.rest_api.$handle',
      );
    }

    http.Response? rawResponse;
    dynamic responseJson;
    try {
      rawResponse = await _client
          .get(
            uri,
            headers: header,
          )
          .timeout(timeOut);
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw const FetchDataException();
    } on TimeoutException {
      throw const TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.rest_api.$handle',
        );
        log(
          'Request Raw Response: ${rawResponse?.body}',
          name: 'package.rest_api.$handle',
        );
      }
    }

    return responseJson;
  }

  /// Used to initiate a [POST] request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [APIConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<dynamic> post({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? kHeader,
    Duration? kTimeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    final url = (baseUrl ?? APIConfig.baseUrl) + handle;

    // uri to be passed to request
    final uri = Uri.parse(url);

    // final header which will be used to make call
    final header = kHeader ?? headerWithToken;

    // final timeout to be used with request
    final timeOut = kTimeOut ?? APIConfig.responseTimeOut;

    if (enableLogs) {
      log(
        'Request URl: $url',
        name: 'package.rest_api.$handle',
      );
      log(
        'Request Header: ${jsonEncode(header)}',
        name: 'package.rest_api.$handle',
      );
      log(
        'Request Body: $body',
        name: 'package.rest_api.$handle',
      );
    }

    http.Response? rawResponse;
    dynamic responseJson;
    try {
      rawResponse = await _client
          .post(
            uri,
            body: jsonEncode(body),
            headers: header,
          )
          .timeout(timeOut);
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw const FetchDataException();
    } on TimeoutException {
      throw const TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.rest_api.$handle',
        );
        log(
          'Request Raw Response: ${rawResponse?.body}',
          name: 'package.rest_api.$handle',
        );
      }
    }

    return responseJson;
  }

  /// Used to initiate a [POST] multipart request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [APIConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<dynamic> postMultipart({
    required String handle,
    required String fileField,
    required List<String> files,
    Map<String, String>? body,
    String? baseUrl,
    Map<String, String>? kHeader,
    Duration? kTimeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    final url = (baseUrl ?? APIConfig.baseUrl) + handle;

    // uri to be passed to request
    final uri = Uri.parse(url);

    // final header which will be used to make call
    final header = kHeader ?? headerWithToken;

    // final timeout to be used with request
    final timeOut = kTimeOut ?? APIConfig.responseTimeOut;

    if (enableLogs) {
      log(
        'Request URl: $url',
        name: 'package.rest_api.$handle',
      );
      log(
        'Request Header: ${jsonEncode(header)}',
        name: 'package.rest_api.$handle',
      );
      log(
        'Request Body: $body',
        name: 'package.rest_api.$handle',
      );
    }

    http.Response? rawResponse;
    dynamic responseJson;
    try {
      final request = http.MultipartRequest('POST', uri);

      request.headers.addAll(header ?? {});

      if (body != null) request.fields.addAll(body);

      final List<http.MultipartFile> filePaths = [];

      for (int i = 0; i < files.length; i++) {
        final file = await http.MultipartFile.fromPath(
          fileField,
          files[i],
          filename: 'complainImage$i.jpg',
        );
        filePaths.add(file);
      }

      request.files.addAll(filePaths);

      final multipartResponse = await request.send().timeout(timeOut);

      rawResponse = await http.Response.fromStream(multipartResponse);
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw const FetchDataException();
    } on TimeoutException {
      throw const TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.rest_api.$handle',
        );
        log(
          'Request Raw Response: ${rawResponse?.body}',
          name: 'package.rest_api.$handle',
        );
      }
    }

    return responseJson;
  }

  /// Used to initiate a [PATCH] request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [APIConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<dynamic> patch({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? kHeader,
    Duration? kTimeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    final url = (baseUrl ?? APIConfig.baseUrl) + handle;

    // uri to be passed to request
    final uri = Uri.parse(url);

    // final header which will be used to make call
    final header = kHeader ?? headerWithToken;

    // final timeout to be used with request
    final timeOut = kTimeOut ?? APIConfig.responseTimeOut;

    if (enableLogs) {
      log(
        'Request URl: $url',
        name: 'package.rest_api.$handle',
      );
      log(
        'Request Header: ${jsonEncode(header)}',
        name: 'package.rest_api.$handle',
      );
      log(
        'Request Body: $body',
        name: 'package.rest_api.$handle',
      );
    }

    http.Response? rawResponse;
    dynamic responseJson;
    try {
      rawResponse = await _client
          .patch(
            uri,
            body: jsonEncode(body),
            headers: header,
          )
          .timeout(timeOut);
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw const FetchDataException();
    } on TimeoutException {
      throw const TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.rest_api.$handle',
        );
        log(
          'Request Raw Response: ${rawResponse?.body}',
          name: 'package.rest_api.$handle',
        );
      }
    }

    return responseJson;
  }

  /// Used to initiate a [DELETE] request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [APIConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<dynamic> delete({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? kHeader,
    Duration? kTimeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    final url = (baseUrl ?? APIConfig.baseUrl) + handle;

    // uri to be passed to request
    final uri = Uri.parse(url);

    // final header which will be used to make call
    final header = kHeader ?? headerWithToken;

    // final timeout to be used with request
    final timeOut = kTimeOut ?? APIConfig.responseTimeOut;

    if (enableLogs) {
      log(
        'Request URl: $url',
        name: 'package.rest_api.$handle',
      );
      log(
        'Request Header: ${jsonEncode(header)}',
        name: 'package.rest_api.$handle',
      );
      log(
        'Request Body: $body',
        name: 'package.rest_api.$handle',
      );
    }

    http.Response? rawResponse;
    dynamic responseJson;
    try {
      rawResponse = await _client
          .delete(
            uri,
            body: body != null ? jsonEncode(body) : null,
            headers: header,
          )
          .timeout(timeOut);
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw const FetchDataException();
    } on TimeoutException {
      throw const TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.rest_api.$handle',
        );
        log(
          'Request Raw Response: ${rawResponse?.body}',
          name: 'package.rest_api.$handle',
        );
      }
    }

    return responseJson;
  }

  /// Used to initiate a [PUT] request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [APIConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<dynamic> put({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? kHeader,
    Duration? kTimeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    final url = (baseUrl ?? APIConfig.baseUrl) + handle;

    // uri to be passed to request
    final uri = Uri.parse(url);

    // final header which will be used to make call
    final header = kHeader ?? headerWithToken;

    // final timeout to be used with request
    final timeOut = kTimeOut ?? APIConfig.responseTimeOut;

    if (enableLogs) {
      log(
        'Request URl: $url',
        name: 'package.rest_api.$handle',
      );
      log(
        'Request Header: ${jsonEncode(header)}',
        name: 'package.rest_api.$handle',
      );
      log(
        'Request Body: $body',
        name: 'package.rest_api.$handle',
      );
    }

    http.Response? rawResponse;
    dynamic responseJson;
    try {
      rawResponse = await _client
          .put(
            uri,
            body: body != null ? jsonEncode(body) : null,
            headers: header,
          )
          .timeout(timeOut);
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw const FetchDataException();
    } on TimeoutException {
      throw const TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.rest_api.$handle',
        );
        log(
          'Request Raw Response: ${rawResponse?.body}',
          name: 'package.rest_api.$handle',
        );
      }
    }

    return responseJson;
  }

  /// Used to convert a locally provided [json] String to json Map
  Future<Map<String, dynamic>?> local(
    String json, {
    bool enableLogs = false,
  }) async {
    if (enableLogs) {
      log(
        'JSON String: $json',
        name: 'package.rest_api.local',
      );
    }

    late final Map<String, dynamic> rawResponse;
    try {
      rawResponse = jsonDecode(json) as Map<String, dynamic>;
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      if (enableLogs) {
        log(
          'Raw JSON: $rawResponse',
          name: 'package.rest_api.local',
        );
      }
    }
    return rawResponse;
  }

  /// General HTTP code responses
  Future<dynamic> _response(http.Response response) async {
    final json = jsonDecode(response.body);
    final message = json is Map
        ? json['message'] == null
            ? ((json['error'] as Map<String, dynamic>?)?['message']
                        as String?) ==
                    null
                ? null
                : (json['error'] as Map<String, dynamic>)['message'].toString()
            : json['message'].toString()
        : null;
    switch (response.statusCode) {
      case 200:
      case 201:
        final responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
      case 422:
        throw BadRequestException(message);
      case 401:
      case 403:
        throw UnauthorizedException(message);
      case 404:
        throw NotFoundException(message);
      case 500:
      default:
        throw FetchDataException(
          'Something went wrong, please try again later.\n\nStatus Code : ${response.statusCode}',
        );
    }
  }
}
