import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xploreceylon_mobile/models/visa_info_model/visa_info_model.dart';

import '../constants/urls.dart';

class VisaService {

  // Method to send POST request with JSON data
  Future<http.Response> createNewVisa(VisaInfoModel visaInfoModel) async {
    final url = Uri.parse('$local/createNewVisa');  // API endpoint

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', 
        },
        body: json.encode(visaInfoModel),  
      );
      
      return response;  
    } catch (e) {
      throw Exception('Failed to submit visa application: $e');
    }
  }
}
