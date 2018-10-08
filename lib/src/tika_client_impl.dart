import 'dart:async';

import 'package:http_client/http_client.dart';
import 'package:tika_client/tika_client.dart';

class TikaClientImpl implements TikaClient {
  final String _url;
  final Client _client;

  TikaClientImpl(String url, Client client)
      : _url = _stripEndingSlash(url),
        _client = client;

  @override
  Future<String> parseBufferAsHtmlText(List<int> buffer) async {
    final rq = new Request('PUT', '$_url/tika',
        headers: {'Accept': 'text/html'}, body: buffer);
    final rs = await _client.send(rq);
    return await rs.readAsString();
  }

  @override
  Future<String> parseBufferAsPlainText(List<int> buffer) async {
    final rq = new Request('PUT', '$_url/tika',
        headers: {'Accept': 'text/plain'}, body: buffer);
    final rs = await _client.send(rq);
    return await rs.readAsString();
  }
}

String _stripEndingSlash(String url) {
  return url.endsWith('/') ? url.substring(0, url.length - 1) : url;
}
