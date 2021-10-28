import 'package:flutter_social_login/_constant/enviroment.dart';
import 'package:flutter_social_login/_constant/main_common.dart';

Future<void> main() async {
  await mainCommon(Enviroment.production);
}
