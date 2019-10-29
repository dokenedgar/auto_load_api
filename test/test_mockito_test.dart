//File created by mcedgar
//by 3:19 AM
//on 29/Oct/2019

import 'package:auto_load_api/test_mockito.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  test('mockito', () {
    final MockCat myCat = MockCat();

    when(myCat.sound()).thenReturn('something');
    //String sound = myCat.sound();
    //expect(sound, 'something');

    when(myCat.lives).thenReturn(2);
    expect(myCat.lives, 2);
  });
}

class MockCat extends Mock implements Cat {}
