class Calculadora {
  double? primeiroValor;
  double? segundoValor;
  String? operacao;

  Calculadora();

  double soma(double primeiroValor, double segundoValor) {
    return primeiroValor + segundoValor;
  }

  double sub(double primeiroValor, double segundoValor) {
    return primeiroValor - segundoValor;
  }

  double multiplicacao(double primeiroValor, double segundoValor) {
    return primeiroValor * segundoValor;
  }

  double divisao(double primeiroValor, double segundoValor) {
    return primeiroValor / segundoValor;
  }

  double calcular(String operacao, double primeiroValor, double segundoValor) {
    switch (operacao) {
      case '+':
        return primeiroValor + segundoValor;
      case '-':
        return primeiroValor - segundoValor;
      case '*':
        return primeiroValor * segundoValor;
      case '/':
        return primeiroValor / segundoValor;
      default:
        return 0;
    }
  }
}
