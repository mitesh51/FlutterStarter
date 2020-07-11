import 'package:flutter_app/src/api_demo/resourses/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  final provider = NewsApiProvider();

  test('Sample test add', () {
    // SETUP
    final sum = 1 + 3;
    // EXPECTATION
    expect(sum, 4);
  });
  test('Sample test multiply', () {
    // SETUP
    final sum = 1 * 3;
    // EXPECTATION
    expect(sum, 3);
  });
  test('Fetch ids from the api call', () async {
    final mockClient = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });
    provider.client = mockClient;
    final ids = await provider.fetchTopIds();
    expect(ids, [1, 2, 3, 4]);
  });





}
