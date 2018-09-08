# Dart Tika client

`tika_client` is a Dart client library for accessing the Apache Tika Server API.

## Run Tika server as docker image

```
docker run --rm -p 9998:9998 logicalspark/docker-tikaserver:1.18
```

## Usage

A simple usage example:

```dart
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
```
