import 'dart:convert';
import 'dart:io';

String getUserInput(field) {
  stdout.write(field + ': ');
  final String input = stdin.readLineSync() ?? '';
  return input;
}

Map getManifest(pluginUUID) {
  var manifest = {};

  manifest['Author'] = getUserInput('Author');
  manifest['Category'] = getUserInput('Category');
  manifest['Description'] = getUserInput('Description');
  manifest['Name'] = getUserInput('Name');
  manifest['URL'] = getUserInput('URL');
  manifest['Actions'] = [getAction(pluginUUID)];

  // TODOZ: set paths for icon images PLACEHOLDER
  manifest['Icon'] = 'PLACEHOLDER';
  manifest['CategoryIcon'] = 'PLACEHOLDER';
  manifest['Version'] = '0.0.1';
  manifest['SDKVersion'] = '2';
  manifest['Software'] = {"MinimumVersion": "5.0"};
  manifest['CodePath'] = 'index.html';
  manifest['PropertyInspectorPath'] = 'propertyinspector/index.html';
  manifest['OS'] = [
    {"Platform": "mac", "MinimumVersion": "12.0"},
    {"Platform": "windows", "MinimumVersion": "10"}
  ];

  return manifest;
}

Map getAction(pluginUUID) {
  var action = {'Icon': 'PLACEHOLDER'};
  stdout.writeln('Enter your first action.');
  action['Name'] = getUserInput('Name');
  action['UUID'] =
      pluginUUID + '.' + action['Name']!.toLowerCase().replaceAll(' ', '-');

  return action;
}

void createManifestFile(manifest, directory) {
  var file = File(directory + '/' + 'manifest.json');

  file.writeAsString(json.encode(manifest));
}
