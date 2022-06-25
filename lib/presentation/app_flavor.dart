enum AppFlavor {
  development(
    name: 'development',
    baseUrl: '',
  ),
  staging(
    name: 'staging',
    baseUrl: '',
  ),
  production(
    name: 'production',
    baseUrl: '',
  );

  final String name;
  final String baseUrl;

  const AppFlavor({
    required this.name,
    required this.baseUrl,
  });
}
