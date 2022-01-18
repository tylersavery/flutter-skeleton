import 'dart:convert';
import 'dart:io';

import 'package:flutter_skeleton/src/config/seo/seo.dart';
import 'package:path/path.dart';

// ignore: constant_identifier_names
const DEBUG_BOT = true;

String camelCase(String string) {
  return string; //TODO: implement
}

String prettyJson(jsonObject) {
  var encoder = const JsonEncoder.withIndent("  ");
  return encoder.convert(jsonObject);
}

class ReWrite {
  final String path;
  final String functionName;

  const ReWrite(this.path, this.functionName);

  Map<String, String> toMap() {
    return {
      'source': path,
      'function': functionName,
    };
  }

  static catchAll() {
    return {"source": "**", "destination": "/index.html"};
  }
}

Future<void> copyHtml() async {
  final inputPath = join(
    dirname(Platform.script.toFilePath()),
    '..',
    'build',
    'web',
    'index.html',
  );

  final outputPath = join(
    dirname(Platform.script.toFilePath()),
    '..',
    'functions',
    'index.html',
  );

  final file = File(inputPath);
  final contents = await file.readAsString();

  await File(outputPath).writeAsString(contents);
}

void main() async {
  Map<String, dynamic> config = {
    "hosting": {
      "public": "build/web",
      "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
      "rewrites": [],
    }
  };

  String jsOutput = """
const functions = require("firebase-functions");

const fs = require("fs");
const axios = require("axios");
const BotDetector = require("device-detector-js/dist/parsers/bot");

const DEBUG_BOT = ${DEBUG_BOT ? 'true' : 'false'};

  """;

  for (final route in SEO_ROUTES) {
    final name = camelCase(route.name);

    const siteTitle = SITE_TITLE;
    final title = route.title;
    final description = route.description;
    final keywords = route.keywords.join(',');

    final rewrite = ReWrite(route.path.replaceAll(RegExp(":id"), "**"), name);

    config['hosting']['rewrites'].add(rewrite.toMap());

    jsOutput = """$jsOutput
exports.$name = functions.https.onRequest(async (request, response) => {
  let html = fs.readFileSync("./index.html", "utf-8");

  const url = request.url;

  const urlParts = request.path.split("/");
  const id = urlParts[urlParts.length - 1];

  const botDetector = new BotDetector();
  const userAgent = request.headers["user-agent"].toString();
  const bot = botDetector.parse(userAgent);

  let siteTitle = '$siteTitle';
  let title = '$title';
  let image = '';

  if (bot || DEBUG_BOT) {

    try{

      ${route.apiUrl != null ? """
const url = '${route.apiUrl}'.replace(":id", id);
      const response = await axios.get(url);
      const result = response.data;

      ${route.responseToTitle != null ? """

      title = result.${route.responseToTitle!.join('.')};
      """ : ""}

      ${route.responseToImage != null ? """
      image = result.${route.responseToImage!.join('.')};
      """ : ""}

      """ : ""}

    var fullTitle = title ? `\${title} - \${siteTitle}` : title;

    html = `
      <!doctype html>
      <html lang="en">
      <head>
          <title>\${fullTitle}</title>
          <meta property="og:locale" content="en_US" />
          <meta property="og:type" content="website" />
          <meta property="og:title" content="\${fullTitle}" />
          <meta property="og:description" content="$description" />
          <meta property="og:site_name" content="\${fullTitle}" />
          <meta property="og:url" content="\${url}" />
          <meta property="og:image" content="\${image}" />

          <meta name="description" content="$description">
          <meta name="keywords" content="$keywords">

      </head>
      <body>
          <h1>\${siteTitle}</h1>
          <h2>\${title}</h2>
          <p>$description</p>
      </body>
      
      </html>
    `;
     } catch(e) {
       return response.send(html);
     }
  }
  return response.send(html);
});
""";
  }
  config['hosting']['rewrites'].add(ReWrite.catchAll());

  final pathToConfig = join(
    dirname(Platform.script.toFilePath()),
    '..',
    'firebase.json',
  );

  await File(pathToConfig).writeAsString(prettyJson(config));

  final pathToJs = join(
    dirname(Platform.script.toFilePath()),
    '..',
    'functions',
    'index.js',
  );
  await File(pathToJs).writeAsString(jsOutput);

  await copyHtml();

  print("SEO Compiled");
}
