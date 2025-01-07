import 'package:api_app/model/price_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetData extends ChangeNotifier {
  String url = 'https://www.goldapi.io/api/';
  String apiKey = 'goldapi-jssnsm09fapod-io';
  String gold = 'XAU';
  String silver = 'XAG';
  PriceModel? _prices;

  PriceModel? get prices => _prices;

  Future<PriceModel?> fetchData() async {
    try {
      final resGold = await http.get(Uri.parse('$url$gold'), headers: {
        'x-access-token': apiKey,
      });
      final resSilver = await http.get(Uri.parse('$url$silver'), headers: {
        'x-access-token': apiKey,
      });
      if (resGold.statusCode == 200 && resSilver.statusCode == 200) {
        var goldData = jsonDecode(resGold.body);
        var silverData = jsonDecode(resSilver.body);
        _prices = PriceModel.fromJson(goldData, silverData);
        notifyListeners();
      } else {
        print(
            'Failed to load data. Status codes: ${resGold.statusCode}, ${resSilver.statusCode}');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
