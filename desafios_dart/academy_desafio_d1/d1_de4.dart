DateTime avancaDias(DateTime data, [int dias = 18]) {
  // Passar dias
  while (dias > 0) {
    data = data.add(Duration(days: 1));

    // Ignorar sábados e domingos
    if (data.weekday == DateTime.saturday || data.weekday == DateTime.sunday)
      continue;

    // Caso não for sábado ou domingo, diminuir o contador
    dias--;
  }

  return data;
}

void main() {
  // Data atual
  final DateTime agora = DateTime.now();

  // Data avançado
  final DateTime dataAvancado = avancaDias(agora);

  // Mostra resultado
  print("Data atual: ${agora.day}/${agora.month}/${agora.year}");
  print(
      "Data calculada: ${dataAvancado.day}/${dataAvancado.month}/${dataAvancado.year}");
}
