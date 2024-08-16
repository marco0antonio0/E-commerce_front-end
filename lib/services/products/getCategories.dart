getCateroies(products) {
  // Função para obter todas as categorias
  List<String> getCategories(List<Map<String, dynamic>> products) {
    Set<String> categories = {};

    for (var product in products) {
      if (product.containsKey('categoria') || product.containsKey('category')) {
        if (product.containsKey('categoria')) {
          categories.add(product['categoria']);
        }
        if (product.containsKey('category')) {
          categories.add(product['category']);
        }
      } else if (product.containsKey('details')) {
        if (product['details'].containsKey('adjective')) {
          categories.add(product['details']['adjective']);
        }
      }
    }

    return categories.toList();
  }

  // Chamando a função e imprimindo as categorias
  List<String> categories = getCategories(products);
  return categories;
}
