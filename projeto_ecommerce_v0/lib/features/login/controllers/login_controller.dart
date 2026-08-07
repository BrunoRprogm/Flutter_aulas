class LoginController {
  String email = '';
  String senha = '';
  bool isActiveCheckbox = false;
  bool isActiveButton = false;

  void changeActivateButton() {
    isActiveButton = email.trim().isNotEmpty && senha.trim().isNotEmpty;
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
