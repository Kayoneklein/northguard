import 'package:northguard/model/password.dart';
import 'package:northguard/model/user.dart' show User;

class LocalDBModel {
  const LocalDBModel({
    this.user,
    this.passwords = const [],
    //  this.messages,
  });

  final User? user;
  final List<Password> passwords;
  // final List<Message> messages;
}
