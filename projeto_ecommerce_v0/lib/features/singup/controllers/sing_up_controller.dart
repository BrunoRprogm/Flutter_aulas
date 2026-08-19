class singUpController {
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isActiveCheckbox = false;
  bool isActiveButton = false;
  bool isValidPassword = false;
  bool isLoading = false;

  final RegExp specialCaracterPassword = RegExp(
    r'^(?=.*[!@#$%^&*(),.?":{}|<>_\-+=]).*$',
  );
  final RegExp miniumCaracterMaisculo = RegExp(r'[A-Z]');
  final RegExp miniumCaracterMinusculo = RegExp(r'[a-z]');
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  bool isEmailValid() {
    return emailRegex.hasMatch(email.trim());
  }

  bool validacaoTamanhoSenha() {
    return senha.length >= 6;
  }

  bool validacaoCaracterEspecial() {
    return specialCaracterPassword.hasMatch(senha);
  }

  bool validacaoMinimoLetraMaiscula() {
    return miniumCaracterMaisculo.hasMatch(senha);
  }

  bool validacaoMinimoLetraMinusculo() {
    return miniumCaracterMinusculo.hasMatch(senha);
  }

  bool senhasConcidem() {
    return senha.isNotEmpty && senha == confirmarSenha;
  }

  void updateEmail(String value) {
    email = value;
    changeActivateButton();
  }

  void updateNome(String value) {
    nome = value;
    changeActivateButton();
  }

  void updateSenha(String value) {
    senha = value;
    changeActivateButton();
  }

  void updateConfirmarSenha(String value) {
    confirmarSenha = value;
    changeActivateButton();
  }

  void changeAtivateCheckBox() {
    isActiveCheckbox = !isActiveCheckbox;
    changeActivateButton();
  }

  void changeActivateButton() {
    isActiveButton =
        senhasConcidem() &&
        validacaoTamanhoSenha() &&
        validacaoCaracterEspecial() &&
        validacaoMinimoLetraMaiscula() &&
        validacaoMinimoLetraMinusculo() &&
        isActiveCheckbox;
  }

  List<Map<String, bool>> getPasswordRequirements() {
    return [
      {'Tamanho mínimo de 6 caracteres': validacaoTamanhoSenha()},
      {'Pelo menos um caractere especial': validacaoCaracterEspecial()},
      {'Pelo menos uma letra maiúscula': validacaoMinimoLetraMaiscula()},
      {'Pelo menos uma letra minúscula': validacaoMinimoLetraMinusculo()},
    ];
  }

  Future<void> singup() async {
    await Future.delayed(Duration(seconds: 2));
    print('Verifição dos dois segundos');
  }
}
