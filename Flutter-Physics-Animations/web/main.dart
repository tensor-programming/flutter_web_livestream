import 'package:flutter_web_ui/ui.dart' as ui;
import 'package:box_animation/main.dart' as app;

Future main() async {
  await ui.webOnlyInitializePlatform();
  app.main();
}
