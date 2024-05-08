String authErrosString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha invalida';
    case 'Invalid session token':
      return 'Login expirado, logue novamente';
    default:
      return 'Ocorreu um problema, tente novamente';
  }
}
