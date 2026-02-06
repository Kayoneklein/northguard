import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:northguard/authentication/bloc/authentication_bloc.dart';
import 'package:northguard/authentication/bloc/authentication_event.dart';
import 'package:northguard/model/group.dart';
import 'package:northguard/tags/bloc/tags_bloc.dart';
import 'package:northguard/tags/bloc/tags_event.dart';
import 'package:northguard/tags/bloc/tags_state.dart';
import 'package:northguard/tags/presentation/widgets/tags_list.dart';
import 'package:northguard/util/strings.dart';
import 'package:northguard/widget/custom_widgets.dart';

part 'presentation/screens/tags_screen.dart';
