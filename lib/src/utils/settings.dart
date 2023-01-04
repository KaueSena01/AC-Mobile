abstract class ButtonLabel {
  static const String next = "Continuar";
  static const String logInAccount = "Entrar na minha conta";
  static const String noHaveAccount = "Não tenho conta";
  static const String logIn = "Entrar";
  static const String cancel = "Cancelar";
  static const String finalize = "Finalizar";
  static const String save = "Salvar";
}

abstract class AppInformation {
  static const String appName = "Atlas Coins";
  static const String appNameUpperCase = "ATLAS COINS";
  static const String appNameLowerCase = "atlas coins";
  static const String appIconLogo = "assets/icons/icon_logo.png";
  static const String appLogoPath = "assets/icons/logo.svg";
  static const String appLogoMini = "assets/icons/logo_mini.svg";
  static const String appWithoutConnection = "assets/icons/no_connec.png";
  static const String appLogoSecondaryPath = "assets/icons/logo_start.png";
  static const String backgroundAppPath = "assets/images/background 1.png";
}

abstract class TransactionType {
  static const String deposit = "Depósito";
  static const String expense = "Despesa";
}

abstract class TransactionInformation {
  static const String loading = "...";
  static const String lastMove = "Última movimentação: ";
  static const String zero = "R\$ 0,00";
  static const String noTransactionsPath = "assets/icons/no_transactions.png";
  static const String deposiTransactionPath = "assets/icons/deposit.png";
  static const String expenseTransactionPath = "assets/icons/expense.png";
}
