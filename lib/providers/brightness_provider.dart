import 'package:hive/hive.dart';

part 'brightness_provider.g.dart';

@HiveType(typeId: 0)
class BrightnessProvider {
  @HiveField(0)
  bool isDark = false;

  void changeTheme()  {
    isDark = !isDark;
  }

}
