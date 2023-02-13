import 'package:watchlux/screens/auth/sign_up/model/signup_model.dart';

import 'otp_enum.dart';

class OtpModel {
  final SignUpModel model;
  final OtpEnum screenCheck;

  OtpModel({
    required this.model,
    required this.screenCheck,
  });
}
