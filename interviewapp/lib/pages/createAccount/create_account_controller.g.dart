// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateAccountController on _CreateAccountControllerBase, Store {
  final _$emailAtom = Atom(name: '_CreateAccountControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_CreateAccountControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$nameAtom = Atom(name: '_CreateAccountControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$createdAtom = Atom(name: '_CreateAccountControllerBase.created');

  @override
  bool get created {
    _$createdAtom.reportRead();
    return super.created;
  }

  @override
  set created(bool value) {
    _$createdAtom.reportWrite(value, super.created, () {
      super.created = value;
    });
  }

  final _$errorAtom = Atom(name: '_CreateAccountControllerBase.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$errorMessageAtom =
      Atom(name: '_CreateAccountControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$createAsyncAction =
      AsyncAction('_CreateAccountControllerBase.create');

  @override
  Future<User> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  final _$_CreateAccountControllerBaseActionController =
      ActionController(name: '_CreateAccountControllerBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_CreateAccountControllerBaseActionController
        .startAction(name: '_CreateAccountControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_CreateAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_CreateAccountControllerBaseActionController
        .startAction(name: '_CreateAccountControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_CreateAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_CreateAccountControllerBaseActionController
        .startAction(name: '_CreateAccountControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CreateAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
name: ${name},
created: ${created},
error: ${error},
errorMessage: ${errorMessage}
    ''';
  }
}
