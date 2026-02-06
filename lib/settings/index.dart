import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_autofill_service/flutter_autofill_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:northguard/authentication/bloc/authentication_bloc.dart';
import 'package:northguard/authentication/bloc/authentication_event.dart';
import 'package:northguard/home/index.dart';
import 'package:northguard/model/language.dart';
import 'package:northguard/settings/bloc/account_info.dart' as account;
import 'package:northguard/settings/bloc/settings.dart' as settings;
import 'package:northguard/util/strings.dart';
import 'package:northguard/widget/custom_widgets.dart';

part 'presentation/account_info_screen.dart';
part 'presentation/choose_language_screen.dart';
part 'presentation/settings_screen.dart';
