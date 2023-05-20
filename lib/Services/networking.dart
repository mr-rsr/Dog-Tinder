import 'dart:convert';

import 'package:dogtinder/Services/modal.dart';
import 'package:dogtinder/components/showLoading.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

final dialogbox = LoadingDialogBox();

//api fetching
class Networking {
  Future<Dog> apiFetch() async {
    var url = 'https://dog.ceo/api/breeds/image/random/150';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      // spData.addStringToSF(data);
      final decodedData = jsonDecode(data);

      return Dog.fromJson(decodedData!);
    } else {
      throw 'Error';
    }
  }
}
