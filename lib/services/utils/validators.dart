String? validateName(name) {
  if(name == null || name.isEmpty) {
    return "Digite seu nome";
  }

  return null;
}

String? validateEmail(email) {
  if(email == null || email.isEmpty) {
    return "Digite seu e-mail";
  }

  return null;
}

String? validatePassword(password) {
  if(password == null || password.isEmpty) {
    return "Digite sua senha";
  }

  return null;
}

String? validateNewPassword(newPassword) {
  if(newPassword == null || newPassword.isEmpty) {
    return "Digite a nova senha";
  }

  return null;
}

String? validatePasswordConfirmation(newPassword) {
  if(newPassword == null || newPassword.isEmpty) {
    return "Por favor, confime a senha";
  }

  return null;
}