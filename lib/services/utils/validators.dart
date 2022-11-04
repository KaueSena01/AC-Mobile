String? validateName(name) {
  if(name == null || name.isEmpty) {
    return "Digite seu nome";
  }

  return null;
}

String? validateEmail(name) {
  if(name == null || name.isEmpty) {
    return "Digite seu e-mail";
  }

  return null;
}

String? validatePassword(name) {
  if(name == null || name.isEmpty) {
    return "Digite sua senha";
  }

  return null;
}