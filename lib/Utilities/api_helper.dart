import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class API{
  static const String baseServerURL = "https://turathtijania.com/poems";
  static const String _baseURL = "$baseServerURL/api/";


  //=========================== api User ====================================
  static String poemMedia(int id) => "readers?poem_id=$id";





  static Future postRequest({
    required String url,
    required Map<String, String> body,
    List<http.MultipartFile> files = const [],
    Map<String, String>? headers,
  }) async {
    debugPrint(body.toString());
    debugPrint("$_baseURL$url");
    var request = MultipartRequest(
      'POST',
      Uri.parse('$_baseURL$url'),
      onProgress: (int bytes, int total) async {},
    );
    request.fields.addAll(body);
    for (int i = 0; i < files.length; i++) {
      request.files.add(files[i]);
    }

    request.headers.addAll({
      'Accept': 'application/json',
    });
    if (headers != null) request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    String result = await response.stream.bytesToString();
    log(response.statusCode.toString());

    log(result.toString());
    try {
      return json.decode(result);
    } catch (e) {
      return null;
    }
  }

  static Future getRequest({required String url, Map<String, String>? headers,}) async {
    debugPrint('$_baseURL$url');

    var request = http.Request('GET', Uri.parse('$_baseURL$url'));
    request.headers.addAll({
      'Accept': 'application/json',
    });
    if (headers != null) request.headers.addAll(headers);
    debugPrint(request.headers.toString());
    try{
      http.StreamedResponse response = await request.send().timeout(Duration(seconds: 5));

      String result = await response.stream.bytesToString();
      log(response.statusCode.toString());
      log(result.toString());
      return json.decode(result);
    }catch(e){
      return null;
    }
  }

  static Future<Uint8List?> getDataFromUrl({required String? url, Map<String, String>? headers,}) async {
    try{
      if(url == null) return null;
      var request = http.Request('GET', Uri.parse(url));
      request.headers.addAll({
        'Accept': 'application/json',
      });
      if (headers != null) request.headers.addAll(headers);
      debugPrint(request.headers.toString());

      http.StreamedResponse response = await request.send().timeout(Duration(seconds: 5));
      return await response.stream.toBytes();
    }catch(e){
      print(">>>>>>>>>>>>>>>::$e");
      return null;
    }
  }
}

class MultipartRequest extends http.MultipartRequest {
  MultipartRequest(
      String method,
      Uri url, {
        required this.onProgress,
      }) : super(method, url);
  final void Function(int bytes, int totalBytes) onProgress;

  @override
  http.ByteStream finalize() {
    final byteStream = super.finalize();

    final total = contentLength;
    int bytes = 0;

    final t = StreamTransformer.fromHandlers(
      handleData: (List<int> data, EventSink<List<int>> sink) {
        bytes += data.length;
        onProgress(bytes, total);
        if (total >= bytes) {
          sink.add(data);
        }
      },
    );
    final stream = byteStream.transform(t);
    return http.ByteStream(stream);
  }
}