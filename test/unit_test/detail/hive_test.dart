import 'detail_hive_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mockito/mockito.dart';

class MockHiveInterface extends Mock implements HiveInterface {}

class MockHiveBox extends Mock implements Box {}

main() {
  MockHiveInterface mockHiveInterface = MockHiveInterface();
  HiveDetailRepoImpl repo = HiveDetailRepoImpl(hiveInterface: mockHiveInterface);
  MockHiveBox mockHiveBox = MockHiveBox();

  test("Store last 5 reference test", () async {
    when(mockHiveInterface.openBox("product")).thenAnswer((_) async => mockHiveBox);
    verify(mockHiveInterface.openBox("product"));
  });
}
