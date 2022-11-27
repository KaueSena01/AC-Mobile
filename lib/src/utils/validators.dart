String? validateName(name) {
  if (name == null || name.isEmpty) {
    return "Digite seu nome";
  }

  final names = name.split(' ');

  if (names.length == 1) {
    return 'Digite seu nome completo!';
  }

  return null;
}

String? validateEmail(email) {
  if (email == null || email.isEmpty) {
    return "Digite seu e-mail";
  }

  return null;
}

String? validatePassword(password) {
  if (password == null || password.isEmpty) {
    return "Digite sua senha";
  }

  return null;
}

String? validateNewPassword(newPassword) {
  if (newPassword == null || newPassword.isEmpty) {
    return "Digite a nova senha";
  }

  return null;
}

String? validatePasswordConfirmation(newPassword) {
  if (newPassword == null || newPassword.isEmpty) {
    return "Por favor, confime a senha";
  }

  return null;
}

String? validateTransacionTitle(title) {
  if (title == null || title.isEmpty) {
    return "Por favor, informe um título";
  }

  return null;
}

String? validateTransacionValue(value) {
  if (value == null || value.isEmpty) {
    return "Por favor, insira um valor válido";
  }

  return null;
}

String? validateTransacionDate(date) {
  if (date == null || date.isEmpty) {
    return "A data deve ser preenchida";
  }

  return null;
}

String? validateTransacionDescription(description) {
  if (description == null || description.isEmpty) {
    return "Por favor, informe uma descrição";
  }

  return null;
}
