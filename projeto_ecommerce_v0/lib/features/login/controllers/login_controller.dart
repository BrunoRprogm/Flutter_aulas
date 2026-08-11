class LoginController {
  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _senhaRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  String email = '';
  String senha = '';
  bool isActiveCheckbox = false;
  bool isActiveButton = false;

  bool get isEmailValid => _emailRegex.hasMatch(email.trim());
  bool get isSenhaValid => _senhaRegex.hasMatch(senha.trim());

  //adicionar lógica ex: Regex.
  String? get emailError {
    if (email.trim().isEmpty || isEmailValid) {
      return null;
    }
    return 'E-mail inválido!';
  }

  //adicionar lógica ex: RegexSenha.
  String? get senhaError {
    if (senha.trim().isEmpty || isSenhaValid) {
      return null;
    }
    return 'Senha inválida';
  }

  void changeActivateButton() {
    isActiveButton = isEmailValid && isSenhaValid;
  }

  void setSenha(String senhaParam) {
    senha = senhaParam;
    changeActivateButton();
  }

  void setEmail(String emailParam) {
    email = emailParam;
    changeActivateButton();
  }

  void changeAtivateCheckBox() {
    isActiveCheckbox = !isActiveCheckbox;
  }
}
