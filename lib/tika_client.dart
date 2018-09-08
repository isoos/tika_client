import 'dart:async';

import 'package:http_client/http_client.dart';

import './src/tika_client_impl.dart';

/// Dart bindings for Tika server REST API.
abstract class TikaClient {
  factory TikaClient(String url, Client client) => TikaClientImpl(url, client);

  /// Sends [buffer] to the Tika server and gets its parsed version as HTML text.
  Future<String> parseBufferAsHtmlText(List<int> buffer);

  /// Sends [buffer] to the Tika server and gets its parsed version as plain text.
  Future<String> parseBufferAsPlainText(List<int> buffer);
}
