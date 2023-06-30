void programa(int num) {
  if (num.isEven) {
    print("Entrada correta, voce inseriu um numero par.");
  } else {
    throw Exception("Entrada invalida. Insira apenas numeros pares.");
  }
}

void main() {
  try {
    // Tenta executar o programa
    programa(13);
  } catch (e) {
    // Em caso de erro, mostra a mensagem
    print(e);
  }
}
