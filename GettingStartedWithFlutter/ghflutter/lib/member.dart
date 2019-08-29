class Member {
  final String login;
  final String avatarURL;

  Member(this.login, this.avatarURL) {
    if (login == null) {
      throw ArgumentError("login of Membver cannot be null. "
          "Received: '$login'");
    }

    if (avatarURL == null) {
      throw ArgumentError("avatarURL of Member cannot be null."
          "Received: '$avatarURL'");
    }
  }
}
