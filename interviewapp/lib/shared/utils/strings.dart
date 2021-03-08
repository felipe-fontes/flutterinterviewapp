class AppString {
  static String get update => 'atualizar';
  static String get find => 'encontrar';
  static String get delete => 'deletar';
  static String get add => 'adicionar';
  static String get post => 'post';
  static String get _logginRequired => 'Você precisa estar logado para';
  static String get addPostUserNotFound => '$_logginRequired $add $post!';
  static String get deletePostUserNotFound => '$_logginRequired $delete $post!';
  static String get updatePostUserNotFound => '$_logginRequired $update $post!';
  static String get getPostUserNotFound => '$_logginRequired $find $post!';

  static String get genericError => 'Alguma coisa deu errado, tente novamente!';
  static String get genericCriticalError =>
      'Ops aconteceu algum erro, tente novamente!';
  static String get longMessageError =>
      'Sua mensagem é muito longa, tente diminui-lá.';
  static String get messageRequired => 'Necessário digitar sua mensagem!';

  static String get updateOtherPeoplePostError =>
      'Você não pode $update o post de outra pessoa!';
  static String get deleteOtherPeoplePostError =>
      'Você não pode $delete o post de outra pessoa!';
  static String get postNotFound => 'Uma postagem válida é necessária!';
  static String get emailRequired => 'Um email válido é necessário!';
  static String get nameRequired => 'Um nome válido é necessário!';
  static String get invalidPassword =>
      'É necessária uma senha válida, que deve ter mais de 6 caracteres.';

  static String get userNotLogged => 'Usuário não logado!';

  static String get invalidLogin => 'Email ou senha inválidos!';

  static String get hello => 'Olá';
  static String get welcomeBack => 'Seja bem vindo de volta!';
  static String get news => 'novidades';
  static String get fullOf => 'Estamos cheio de';
  static String get toTell => 'para te contar!';
  static String get checkThisFeed => 'Confira esse feed recheado ;)';
  static String get newPost => 'Novidades? Conta mais!';
}
