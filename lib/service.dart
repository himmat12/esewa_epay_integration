import 'dart:io';

import 'package:esewa_manual_api_integration/webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceClass extends GetxController {
  static Map<String, dynamic> formData = {
    "amt": 100,
    "pdc": 0,
    "psc": 0,
    "txAmt": 0,
    "tAmt": 100,
    "pid": UniqueKey().toString(),
    "scd": "EPAYTEST",
    "su": "http://merchant.com.np/page/esewa_payment_success?q=su",
    "fu": "http://merchant.com.np/page/esewa_payment_failed?q=fu",
  };

  static String url = "uat.esewa.com.np";
  static String production = "esewa.com.np";
  static String path = "/epay/main";
  static final client = http.Client();

  static Map<String, String> headers() {
    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
      HttpHeaders.acceptHeader: "application/json",
    };
    return header;
  }

  static Future<dynamic> postData() async {
    // print(jsonEncode(formData));
    try {
      final response = await client.post(
        Uri.https(url, path),
        body: jsonEncode(formData),
        headers: headers(),
        encoding: Encoding.getByName("x-www-form-urlencoded"),
      );

      print('RESPONSE STATUS => ${response.statusCode}');
      // print('RESPONSE HEADERS => ${jsonEncode(response.headers)}');

      if (response.statusCode == 302) {
        // Get.to(() => Webview());
        print('RESPONSE HEADERS => ${jsonEncode(response.headers)}');
      }

      if (response.statusCode == 200) {
        var _data = response.body;
        print(_data);
        print(response.statusCode);
        print(jsonDecode(jsonEncode(response.body)));

        return _data;
      }
    } on HttpException catch (e) {
      throw e.message;
    }
  }
}
