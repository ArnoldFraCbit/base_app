import 'package:base/core/enviroment/environment.dart';

extension ProductionEnvironment on Environment {
  static Environment production() {
    return Environment(
      baseDomain:
          'aHR0cHM6Ly9zdGFnaW5nLm1vYmlsZS5za2FuZGlhLmNvbS5jby9PTS5DZXJ0aWZpY2F0aW9ucy5QdWJsaWMvYXBp',
      certificationDomain:
          'aHR0cHM6Ly93d3cuc2thbmRpYS5jb20uY28vU2VydmljaW9zL09NLkNlcnRpZmljYXRpb25zLlB1YmxpYy9hcGk=',
      iv: 'jpRMtCkChcKWcqQ9T0ruwg==',
      encriptionKey: '6oBzDGB+2xdzc7NAUNL7sR97a1DnuADnjpKfIT4qFok=',
    );
  }
}
