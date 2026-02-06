import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:northguard/authentication/bloc/authentication_bloc.dart';
import 'package:northguard/authentication/bloc/authentication_event.dart';
import 'package:northguard/model/global_message.dart';
import 'package:northguard/notifications/bloc/notifications.dart';
import 'package:northguard/notifications/presentation/widgets/notifications_list.dart';
import 'package:northguard/util/formatters.dart';
import 'package:northguard/util/strings.dart';
import 'package:northguard/widget/custom_widgets.dart';

part 'presentation/screens/notifications_screen.dart';
part 'presentation/screens/notification_details_screen.dart';
