import 'dart:math';

String getRandomImage() {
  return 'http://loremflickr.com/640/${Random().nextInt(100) + 400}/house';
}
