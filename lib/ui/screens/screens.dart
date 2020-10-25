import 'dart:async';

import 'package:comida/bloc/page_bloc.dart';
import 'package:comida/model/model.dart';
import 'package:comida/provider/provider.dart';
import 'package:comida/shared/shared.dart';
import 'package:comida/ui/widgets/widgets.dart';
import 'package:comida/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

part 'wrapper.dart';
part 'static/splash_screen.dart';
part 'static/location_permission_screen.dart';
part 'auth/sign_in_screen.dart';
part 'auth/sign_up_screen.dart';
part 'auth/number_address_screen.dart';
part 'auth/email_verification_screen.dart';
part 'auth/check_email_screen.dart';
part 'auth/reset_password_screen.dart';