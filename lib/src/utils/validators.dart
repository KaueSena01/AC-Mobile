String? validateName(name) {
  if (name == null || name.isEmpty) {
    return "- Digite seu nome";
  }

  final names = name.split(' ');

  if (names.length == 1) {
    return '- Digite seu nome completo!';
  }

  if (name.length <= 8) {
    return '- Nome muito pequeno!';
  }

  return null;
}

String? validateEmail(email) {
  if (email == null || email.isEmpty) {
    return "- Digite seu e-mail";
  }

  final exp = RegExp(r"^([\w\.-_]+)(@+)([\w]+)((\.+\w{2,3}){1,2})$");
  if (!exp.hasMatch(email ?? '')) {
    return '- Email invalido!';
  }

  return null;
}

String? validatePassword(password) {
  if (password == null || password.isEmpty) {
    return "- Digite sua senha";
  }

  if (password.length < 8) {
    return "- A senha deve ter pelo menos 8 caractéres";
  }

  return null;
}

String? validateNewPassword(newPassword) {
  if (newPassword == null || newPassword.isEmpty) {
    return "- Digite a nova senha";
  }

  return null;
}

String? validatePasswordConfirmation(newPassword) {
  if (newPassword == null || newPassword.isEmpty) {
    return "- Por favor, confime a senha";
  }

  return null;
}

String? validateTransactionTitle(title) {
  if (title == null || title.isEmpty) {
    return "- Por favor, informe um título";
  }

  return null;
}

String? validateTransactionDate(date) {
  if (date == null || date.isEmpty) {
    return "- A data deve ser preenchida";
  }

  int day = int.parse(date.substring(0, 2));
  int month = int.parse(date.substring(3, 5));
  int year = int.parse(date.substring(6, 10));

  String dateTime = DateTime.now().toString();

  int currentYear = int.parse(dateTime.substring(0, 4));

  if (day > 32 || month > 13 || year > currentYear) {
    return "- Data inválida";
  }

  return null;
}

String? validateTransactionDescription(description) {
  if (description == null || description.isEmpty) {
    return "- Por favor, informe uma descrição";
  }

  if (description.length <= 12) {
    return "- Descrição muito curta";
  }

  return null;
}
