class singUpController {
  String email = '';
  String nome = '';
  String senha = '';
  String confirmarSenha = '';
  bool isActiveCheckbox = false;
  bool isActiveButton = false;

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
        email.trim().isNotEmpty &&
        nome.trim().isNotEmpty &&
        senha.trim().isNotEmpty &&
        confirmarSenha.trim().isNotEmpty &&
        isActiveCheckbox;
  }
}
