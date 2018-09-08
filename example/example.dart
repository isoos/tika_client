import 'dart:io';

import 'package:http_client/console.dart';
import 'package:tika_client/tika_client.dart';

main() async {
  final httpClient = new ConsoleClient();
  final tikaClient = new TikaClient('http://localhost:9998/', httpClient);

  final file = new File('example.pdf');
  final buffer = await file.readAsBytes();

  final html = await tikaClient.parseBufferAsHtmlText(buffer);
  print(html);

  await httpClient.close();
}
