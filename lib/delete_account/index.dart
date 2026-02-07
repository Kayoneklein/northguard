import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:northguard/authentication/bloc/authentication.dart';
import 'package:northguard/constants/colors.dart';
import 'package:northguard/constants/preferences.dart';
import 'package:northguard/util/snackbar.dart';
import 'package:northguard/util/strings.dart';
import 'package:northguard/web/server_adapter.dart';
import 'package:northguard/web/web.dart';

import '../widget/custom_widgets.dart';

part 'presentation/delete_account.dart';

part 'bloc/delete_account_bloc.dart';

part 'bloc/delete_account_event.dart';

part 'bloc/delete_account_state.dart';
