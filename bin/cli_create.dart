import 'package:args/args.dart';
import 'package:flutter_cli/flutter_cli.dart';

/// [android] platforma nomi
const android = 'android';

/// [macOS] platforma nomi
const macOS = 'macOS';

/// [ios] platforma nomi
const ios = 'ios';

/// [target] qaratilgan manzil.
const target = 'target';

/// [appname] dastur nomi.
const appname = 'appname';

/// [url] manzil.
const url = 'url';

/// [bundleId] bundleId nomi.
const bundleId = 'bundleId';

/// [launcherIcon] nomi.
const launcherIcon = 'launcherIcon';

/// [help] yordam.
const help = 'help';

/// [template] template nomi
const String template = 'template';

/// [softCLISample] yaratiladigan template manzili.
const String softCLISample = 'https://github.com/umidshox99/soft_cli_sample';
const String getTemplateURL = softCLISample;
const String multiModule = '';

/// [argParser] console ma'lumotlarini o'qish uchun.
final argParser = ArgParser()
  ..addOption(appname, abbr: 'a', help: 'Dastur nomini o\'rnatadi.')
  ..addOption(template,
      abbr: 't', help: 'Template nomi multiModule, sample, get')
  ..addFlag(help, abbr: 'h', help: 'Yordam.', negatable: false);

/// Asosiy [main] method.
void main(List<String> arguments) async {
  try {
    final results = argParser.parse(arguments);
    if (results[help] || results.arguments.isEmpty) {
      print(argParser.usage);
      print(
          'Ushbu extension SOFT CLI orqali proyekt tuzish uchun yaratildi.\nMuallif: Umidjon Shoniyozov');
      return;
    }

    if (results[template] == '' || results[template] == null) {
      print('Iltimos template nomini kiriting!');
      return;
    }

    if (results[appname] != null) {
      var sourceCreator = CLICreate();
      await sourceCreator.create(
        args: [
          getURL(results[template]),
          results[appname],
        ],
        appName: results[appname],
      );
    }
  } on FormatException catch (e) {
    print(e.message);
    print('');
    print(argParser.usage);
  }
}

String getURL(result) {
  switch (result) {
    case "multiModule":
      return multiModule;
    case "get":
      return getTemplateURL;
    case "bloc":
      return softCLISample;
    default:
      return "";
  }
}
