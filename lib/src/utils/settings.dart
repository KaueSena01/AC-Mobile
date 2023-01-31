abstract class ButtonLabel {
  static const String useFingerprint = "Usar digital";
  static const String logInWithoutFingerprint = "Entrar sem usar a digital";
  static const String editProfile = "Editar perfil";
  static const String createAccount = "Criar conta";
  static const String logInAccount = "Entrar na minha conta";
  static const String noHaveAccount = "Não tenho conta";
  static const String next = "Continuar";
  static const String close = "Fechar";
  static const String logIn = "Entrar";
  static const String cancel = "Cancelar";
  static const String finalize = "Finalizar";
  static const String save = "Salvar";
}

abstract class AppInformation {
  static const String appName = "Manage Pay";
}

abstract class PaymentOptions {
  static const String money = "Dinheiro";
  static const String pix = "PIX";
  static const String card = "Cartão";
  static const String agency = "Agência";
}

abstract class DropDownType {
  static const String paymentOptions = "Payment";
  static const String transactionType = "Transaction";
}

abstract class TransactionType {
  static const String deposit = "Depósito";
  static const String expense = "Despesa";
}

abstract class BottomNavigationBarOptions {
  static String home = "home";
  static String money = "money";
  static String card = "credit_card";
  static String profile = "profile";

  static int homeIndex = 0;
  static int moneyIndex = 1;
  static int cardIndex = 2;
  static int profileIndex = 3;
}
