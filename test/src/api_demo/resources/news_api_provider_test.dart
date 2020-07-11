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

  test('Fetch item returns a item model', () async {
    final mockClient = MockClient((request) async {
      final jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });
    provider.client = mockClient;
    final item = await provider.fetchItem(1);
    expect(item.id, 123);
  });



}
