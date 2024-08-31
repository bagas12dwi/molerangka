import 'package:dio/dio.dart';
import 'package:media_pembelajaran/helpers/api.dart';
import 'package:media_pembelajaran/models/materi_model.dart';

class MateriProvider {
  Future<Materi> getMateri() async {
    try {
      final response = await Dio().get('${Api.baseUrl}/getMateri');

      if (response.statusCode == 200) {
        return Materi.fromJson(response.data); // Directly pass response.data
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}