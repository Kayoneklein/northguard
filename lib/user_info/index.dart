import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:northguard/authentication/bloc/authentication_bloc.dart';
import 'package:northguard/authentication/bloc/authentication_event.dart';
import 'package:northguard/constants/colors.dart';
import 'package:northguard/delete_account/index.dart';
import 'package:northguard/model/user.dart';
import 'package:northguard/util/settings.dart';
import 'package:northguard/util/strings.dart';
import 'package:northguard/web/server_adapter.dart';
import 'package:northguard/widget/custom_widgets.dart';

part 'bloc/user_info_bloc.dart';

part 'bloc/user_info_event.dart';

part 'bloc/user_info_state.dart';

part 'presentation/user_info_screen.dart';
