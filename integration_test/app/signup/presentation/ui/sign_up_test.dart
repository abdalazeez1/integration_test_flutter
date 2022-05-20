import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:login_integration_test_flutter/main.dart' as app;
import 'package:path_provider/path_provider.dart';
// flutter run  integration_test/app/signup/presentation/ui/sign_up_test.dart

void main() {
  group('test signup ', () {
    setUp(() {});
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    ///mock image and put initial image [assets/image/dash.jpeg]
    const MethodChannel channel =
        MethodChannel('plugins.flutter.io/image_picker');
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      ByteData data = await rootBundle.load('assets/image/dash.jpeg');
      Uint8List bytes = data.buffer.asUint8List();
      Directory tempDir = await getTemporaryDirectory();
      File file = await File(
        '${tempDir.path}/tmp.tmp',
      ).writeAsBytes(bytes);
      debugPrint(file.path);
      return file.path;
    });
    testWidgets('sign up ', (WidgetTester tester) async {
      //build widget
      await tester.pumpApp(); //extension methode to pump [main()]

      ///find widget by key
      final addOrRemoveImage = find.byKey(const Key('add_or_remove_image'));

      final textFieldEmail = find.byKey(const Key('email_sign_up'));
      final textFieldName = find.byKey(const Key('name_sign_up'));
      final textFieldPassword = find.byKey(const Key('password_sign_up'));
      final textFieldSubmitPassword =
          find.byKey(const Key('submit_password_sign_up'));

      final buttonSignUp = find.byKey(const Key('sign_up_button'));
      final buttonPickDateTime = find.byKey(const Key('pick_date_time'));

      ///execute
      await tester.enterText(textFieldEmail, 'abd@abd');
      await tester.enterText(textFieldName, 'abd alazeez Alyosfi');
      await tester.enterText(textFieldPassword, '11111111');
      await tester.enterText(textFieldSubmitPassword, '11111111');
      await delay(2);

      ///chose date
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.tap(buttonPickDateTime);
      await tester.pumpAndSettle();
      await delay();
      await tester.tap(find.text('15'));
      await delay();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      ///pick image

      await tester.tap(addOrRemoveImage);
      await delay(3);
      await tester.pumpAndSettle();

      ///delete iamge
      await tester.tap(addOrRemoveImage);
      await delay(3);
      await tester.pumpAndSettle();

      ///pick image

      await tester.tap(addOrRemoveImage);
      await delay(3);
      await tester.pumpAndSettle();

      ///sign up
      await tester.tap(buttonSignUp);
      await delay(2);
      await tester.pumpAndSettle();

      await tester.pumpAndSettle();
    });
  });
}

extension on WidgetTester {
  Future<void> pumpApp() async {
    app.main();
    await pumpAndSettle();
  }
}

Future<void> delay([int i = 1]) async {
  await Future.delayed(Duration(milliseconds: 500 * i));
}
