import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  late FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect(
      printCommunication: true,
    );
  });

  tearDownAll(() async {
    driver.close();
  });

  test('increments the counter', () async {
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    await driver.tap(buttonFinder);
    await driver.tap(buttonFinder);

    expect(await driver.getText(counterTextFinder), "2");
  });
}
