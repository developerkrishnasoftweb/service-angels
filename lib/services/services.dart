import 'dart:convert';
import 'dart:io';
import 'package:service_angels/enc_dec/enc_dec.dart';

import 'data.dart';
import 'urls.dart';
import 'package:http/http.dart' as http;

class Services {
  static String internetMsg = "No internet connection";
  static String somethingWentWrong = "Something went wrong, please try later";

  static Future<Data> login(Map<String, dynamic> body) async {
    try {
      http.Response response = await http
          .post(Uri.https(Urls.baseUrl, Urls.login), body: {"token" : encrypt(body.toString())});
      if (response.statusCode == 200) {
        return Data.fromJson(jsonDecode(decrypt(response.body)));
      }
      return Data(status: false, message: somethingWentWrong, data: null);
    } on SocketException catch (_) {
      throw (_);
    } catch(_) {
      throw (_);
    }
  }
}