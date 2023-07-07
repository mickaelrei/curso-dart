double toFahrenheit(double celsius) {
  return celsius * 9 / 5 + 32;
}

double toKelvin(double celsius) {
  return celsius + 273.15;
}

void main() {
  // Lista com temperaturas em Celsius
  const List<double> listaCelsius = [
    0.0,
    4.2,
    15.0,
    18.1,
    21.7,
    32.0,
    40.0,
    41.0
  ];

  // Mostra cada temperatura convertida para Fahrenheit e Kelvin
  for (double celsius in listaCelsius) {
    final fahrenheit = toFahrenheit(celsius);
    final kelvin = toKelvin(celsius);

    // Mostra o resultado
    print(
        "Celsius: ${celsius.toStringAsFixed(2)}, fahrenheit: ${fahrenheit.toStringAsFixed(2)}, kelvin: ${kelvin.toStringAsFixed(2)}");
  }
}
