class AppString {
  static String get update => 'update';
  static String get find => 'get';
  static String get delete => 'delete';
  static String get add => 'add';
  static String get post => 'post';
  static String get _logginRequired => 'You need to be logged in order to';
  static String get addPostUserNotFound => '$_logginRequired $add $post!';
  static String get deletePostUserNotFound => '$_logginRequired $delete $post!';
  static String get updatePostUserNotFound => '$_logginRequired $update $post!';
  static String get getPostUserNotFound => '$_logginRequired $find $post!';

  static String get genericError => 'Something went wrong, try again later!';
  static String get genericCriticalError =>
      'Ops and error ocurred, try again later!';
  static String get longMessageError =>
      'Your message is too long, try to stay below';
  static String get messageRequired => 'A message is required!';

  static String get updateOtherPeoplePostError =>
      'You can`t $update somebody else post!';
  static String get deleteOtherPeoplePostError =>
      'You can`t $delete somebody else post!';
  static String get postNotFound => 'A valid post is required!';
  static String get emailRequired => 'A valid email is required!';
  static String get nameRequired => 'A valid name is required!';
  static String get invalidPassword =>
      'A valid password is required, it needs to be more than 6 characteres';

  static String get userNotLogged => 'User not logged!';

  static String get invalidLogin => 'Invalid email or password!';

  static String get hello => 'Olá';
  static String get welcomeBack => 'Seja bem vindo de volta!';
  static String get news => 'novidades';
  static String get fullOf => 'Estamos cheio de';
  static String get toTell => 'para te contar!';
  static String get checkThisFeed => 'Confira esse feed recheado ;)';
  static String get newPost => 'Novidades? Conta mais!';
}
