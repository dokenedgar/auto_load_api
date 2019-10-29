//File created by mcedgar
//by 3:18 AM
//on 29/Oct/2019

// Real class
class Cat {
  String sound() => 'Meow';
  bool eatFood(String food, {bool hungry}) => true;
  Future<void> chew() async => print('Chewing...');
  int walk(List<String> places) => 7;
  void sleep() {}
  void hunt(String place, String prey) {}
  int lives = 9;
}
