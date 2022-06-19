import 'dart:convert';
import 'dart:io';

import 'package:stream_deck_cli/cli.dart' as cli;

void main(List<String> arguments) {
  var pluginUUID = cli.getUserInput('Plugin UUID');
  var manifest = cli.getManifest(pluginUUID);
  var directoryPath = pluginUUID.toLowerCase() + '.sdPlugin';
  Directory(directoryPath).createSync();

  cli.createManifestFile(manifest, directoryPath);
}
