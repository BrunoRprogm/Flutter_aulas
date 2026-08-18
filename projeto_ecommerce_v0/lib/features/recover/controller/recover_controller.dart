class RecoverController {
  String email = '';
  bool isActiveButton = false;

  void updateEmail(String value) {
    email = value;
    changeActivateButton();
  }

  void changeActivateButton() {
    isActiveButton = email.trim().isNotEmpty;
  }
}
