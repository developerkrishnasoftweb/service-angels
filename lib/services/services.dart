import 'dart:convert';
import 'dart:io';
import 'package:service_angels/enc_dec/enc_dec.dart';
import 'package:service_angels/models/proposal_model.dart';
import 'package:service_angels/models/seller_data_model.dart';

import 'data.dart';
import 'urls.dart';
import 'package:http/http.dart' as http;

class Services {
  static String noInternetConnection = "No internet connection";
  static String somethingWentWrong = "Something went wrong, please try later";

  static Future<Data> login(String body) async {
    try {
      http.Response response = await http.post(
          Uri.https(Urls.baseUrl, Urls.login),
          body: {"token": encrypt(body)});
      if (response.statusCode == 200) {
        return Data.fromJson(jsonDecode(decrypt(response.body)));
      }
      return Data(status: false, message: somethingWentWrong, data: null);
    } on SocketException catch (_) {
      return Data(status: false, message: noInternetConnection, data: null);
    } catch (e) {
      return Data(status: false, message: somethingWentWrong, data: null);
    }
  }

  static Future<Data> register(String body) async {
    try {
      http.Response response = await http.post(
          Uri.https(Urls.baseUrl, Urls.register),
          body: {"token": encrypt(body)});
      if (response.statusCode == 200) {
        return Data.fromJson(jsonDecode(decrypt(response.body)));
      }
      return Data(status: false, message: somethingWentWrong, data: null);
    } on SocketException catch (_) {
      return Data(status: false, message: noInternetConnection, data: null);
    } catch (e) {
      return Data(status: false, message: somethingWentWrong, data: null);
    }
  }

  static Future<Data<List<Proposal>>> getProposals(String body) async {
    try {
      http.Response response = await http.post(
          Uri.https(Urls.baseUrl, Urls.getProposals),
          body: {"token": encrypt(body)});
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(decrypt(response.body));
        List<Proposal> proposals = [];
        jsonResponse['data'].forEach((v) {
          proposals.add(Proposal.fromJson(v));
        });
        return Data(
            message: jsonResponse["msg"],
            data: proposals,
            status: true);
      }
      return Data(status: false, message: somethingWentWrong, data: null);
    } on SocketException catch (_) {
      return Data(status: false, message: noInternetConnection, data: null);
    } catch (e) {
      return Data(status: false, message: somethingWentWrong, data: null);
    }
  }

  static Future<Data<SellerData>> getSeller(String body) async {
    try {
      http.Response response = await http.post(
          Uri.https(Urls.baseUrl, Urls.getSellers),
          body: {"token": encrypt(body)});
      if (response.statusCode == 200) {
        return Data(
          status: true,
          data: SellerData.fromJson(jsonDecode(decrypt(response.body))['data'][0]),
          message: "Seller fetched successfully"
        );
      }
      return Data(status: false, message: somethingWentWrong, data: null);
    } on SocketException catch (_) {
      return Data(status: false, message: noInternetConnection, data: null);
    } catch (e) {
      return Data(status: false, message: somethingWentWrong, data: null);
    }
  }
}
