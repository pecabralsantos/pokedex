// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forms_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormsController on _FormsControllerBase, Store {
  Computed<bool> _$registerIsValidComputed;

  @override
  bool get registerIsValid =>
      (_$registerIsValidComputed ??= Computed<bool>(() => super.registerIsValid,
              name: '_FormsControllerBase.registerIsValid'))
          .value;
  Computed<bool> _$loginIsValidComputed;

  @override
  bool get loginIsValid =>
      (_$loginIsValidComputed ??= Computed<bool>(() => super.loginIsValid,
              name: '_FormsControllerBase.loginIsValid'))
          .value;

  final _$nameAtom = Atom(name: '_FormsControllerBase.name');

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

  final _$emailAtom = Atom(name: '_FormsControllerBase.email');

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

  final _$phoneAtom = Atom(name: '_FormsControllerBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$passwordAtom = Atom(name: '_FormsControllerBase.password');

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

  final _$_FormsControllerBaseActionController =
      ActionController(name: '_FormsControllerBase');

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_FormsControllerBaseActionController.startAction(
        name: '_FormsControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_FormsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_FormsControllerBaseActionController.startAction(
        name: '_FormsControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_FormsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhone(String value) {
    final _$actionInfo = _$_FormsControllerBaseActionController.startAction(
        name: '_FormsControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_FormsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_FormsControllerBaseActionController.startAction(
        name: '_FormsControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_FormsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
phone: ${phone},
password: ${password},
registerIsValid: ${registerIsValid},
loginIsValid: ${loginIsValid}
    ''';
  }
}
