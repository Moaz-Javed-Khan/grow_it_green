import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:grow_it_green/domain/auth_repository/repository.dart';
import 'package:grow_it_green/presentation/utils/validators/email.dart';
import 'package:grow_it_green/presentation/utils/validators/password.dart';

class SignUpProvider extends ChangeNotifier {
  SignUpProvider({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  // State Variables
  Email email = const Email.pure();
  Password password = const Password.pure();
  FormzStatus formzStatus = FormzStatus.pure;
  String? error;

  void emailChanged(String value) {
    email = Email.dirty(value);
    formzStatus = Formz.validate([email, password]);
    notifyListeners();
  }

  void passwordChanged(String value) {
    password = Password.dirty(value);
    formzStatus = Formz.validate([email, password]);
    notifyListeners();
  }

  Future<void> signUp() async {
    if (!formzStatus.isValidated) return;
    formzStatus = FormzStatus.submissionInProgress;
    notifyListeners();

    try {
      await _authRepository.signUp(
        email: email.value,
        password: password.value,
      );
      formzStatus = FormzStatus.submissionSuccess;
    } on RegisterFailure catch (e) {
      formzStatus = FormzStatus.submissionFailure;
      error = e.message;
    }
    // catch (e) {
    //   formzStatus = FormzStatus.submissionFailure;
    //   error = 'Something went wrong!';
    // }
    notifyListeners();
  }

  String? getEmailError() {
    if (email.pure) return null;
    if (email.error == EmailValidationError.invalid) {
      return 'Please enter a valid email.';
    } else {
      return null;
    }
  }

  String? getPasswordError() {
    if (password.pure) return null;
    if (password.error == PasswordValidationError.invalid) {
      return 'Please enter a valid password (Atleast 8 characters).';
    } else {
      return null;
    }
  }
}
