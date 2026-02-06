import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:northguard/authentication/bloc/authentication.dart';
import 'package:northguard/config/configuration_bloc.dart';
import 'package:northguard/home/presentation/widgets/user_account_drawer_header.dart';
import 'package:northguard/model/language.dart';
import 'package:northguard/passwords/bloc/passwords.dart';
import 'package:northguard/settings/bloc/settings.dart';
import 'package:northguard/settings/index.dart';
import 'package:northguard/tags/index.dart';
import 'package:northguard/user_info/index.dart';
import 'package:northguard/util/localization.dart';
import 'package:northguard/util/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    final passwordsBloc = BlocProvider.of<PasswordsBloc>(context);
    final authState = authBloc.state;

    final themeData = Theme.of(context);
    final primaryColor = themeData.primaryColor;
    final textStyle = themeData.textTheme.bodyMedium
        ?.apply(color: primaryColor)
        .copyWith(fontWeight: FontWeight.w500);

    Widget _tile({
      required String text,
      required IconData icon,
      required VoidCallback onTap,
    }) {
      return ListTile(
        title: Text(text, style: textStyle),
        leading: Icon(icon, color: themeData.primaryColor),
        onTap: onTap,
      );
    }

    final tiles = <Widget>[
      if (authState is Authenticated)
        UserAccountDrawerHeader(user: authState.user),
      _tile(
        text: Strings.drawerMenuItemUserInfo,
        icon: FontAwesomeIcons.circleUser,
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => UserInfoScreen()),
          );
        },
      ),
      const Divider(),
      _tile(
        text: Strings.drawerMenuItemSettings,
        icon: FontAwesomeIcons.gear,
        onTap: () async {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => BlocProvider(
                create: (context) => SettingsBloc()..loadInitialState(),
                child: SettingScreen(),
              ),
            ),
          );
          //  await AutofillService().requestSetAutofillService();
          // await Navigator.push(context, MaterialPageRoute<void>(builder: (context) => TagsScreen()));
          // passwordsBloc.add(RetryPressed());
        },
      ),
      const Divider(),
      _tile(
        text: Strings.drawerMenuItemTagsManager,
        icon: FontAwesomeIcons.tags,
        onTap: () async {
          Navigator.of(context).pop();
          await Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => TagsScreen()),
          );
          passwordsBloc.add(const RetryPressed());
        },
      ),
      const Divider(),
      _tile(
        text: Strings.drawerMenuItemUserManual,
        icon: FontAwesomeIcons.bookOpen,
        onTap: () {
          Navigator.of(context).pop();
          final Language language = Localization.get.currentLanguage;
          launchUrl(Uri.parse(getManualUrl(context, language.code)));
        },
      ),
    ];
    return Drawer(child: ListView(children: tiles));
  }

  String getManualUrl(BuildContext context, String languageCode) =>
      BlocProvider.of<ConfigurationBloc>(context)
          .state
          .configuration
          .manualAppUrl
          ?.manuals
          .firstWhere((element) => element.name == languageCode)
          .link ??
      '';
}
