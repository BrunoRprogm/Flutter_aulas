//Pedi para ia me dar um mock com mais conteúdo, assim deix o App mais rico
final List<Map<String, dynamic>> categoriesJson = [
  {'name': 'Frutas', 'imageUrl': 'https://i.postimg.cc/SNX7hc6F/Image.png'},
  {
    'name': 'Verduras',
    'imageUrl': 'https://i.postimg.cc/8PFBSLh2/Image-(1).png',
  },
  {'name': 'Padaria', 'imageUrl': 'https://i.postimg.cc/xTky2LvV/Image-1.png'},
  {
    'name': 'Importados',
    'imageUrl': 'https://i.postimg.cc/Yq4fHQ6w/Image-2.png',
  },
  {
    'name': 'Laticínios',
    'imageUrl':
        'https://images.unsplash.com/photo-1628088062854-d1870b4553da?w=300',
  },
  {
    'name': 'Carnes',
    'imageUrl':
        'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?w=300',
  },
];

final List<Map<String, dynamic>> productsJson = [
  // Verduras
  {
    'brand': 'Natural da terra',
    'name': 'Rabanete',
    'description': 'Colhido fresco, ideal para saladas e pratos leves.',
    'imageUrl':
        'https://images.unsplash.com/photo-1582284540020-8acbe03f4924?w=300',
    'price': 10.99,
    'category': 'Verduras',
  },
  {
    'brand': 'Akatsu',
    'name': 'Acerola',
    'imageUrl':
        'https://images.unsplash.com/photo-1601493700631-2b16ec4b4716?w=300',
    'price': 7.99,
    'category': 'Frutas',
    'description': 'Acerola rica em vitamina C. Ideal para sucos e vitaminas.',
  },
  {
    'brand': 'Natural da terra',
    'name': 'Cogumelo Shitake',
    'imageUrl':
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=300',
    'price': 12.19,
    'category': 'Verduras',
    'description':
        'Cogumelo Shitake fresco, ideal para risotos e pratos orientais.',
  },
  // Frutas
  {
    'brand': 'Fazenda Verde',
    'name': 'Manga Palmer',
    'imageUrl':
        'https://images.unsplash.com/photo-1563114773-84221bd62daa?w=300',
    'price': 8.49,
    'category': 'Frutas',
    'description':
        'Manga Palmer doce e suculenta, colhida no ponto certo de maturação.',
  },
  {
    'brand': 'Fazenda Verde',
    'name': 'Abacate',
    'imageUrl':
        'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=300',
    'price': 6.99,
    'category': 'Frutas',
    'description':
        'Abacate cremoso e nutritivo, rico em gorduras boas e vitaminas.',
  },
  {
    'brand': 'Fazenda Verde',
    'name': 'Morango',
    'imageUrl':
        'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=300',
    'price': 9.99,
    'category': 'Frutas',
    'description':
        'Morangos frescos e doces, perfeitos para sobremesas e vitaminas.',
  },
  // Padaria
  {
    'brand': 'Pão & Cia',
    'name': 'Pão Francês',
    'imageUrl':
        'https://images.unsplash.com/photo-1549931319-a545dcf3bc73?w=300',
    'price': 0.75,
    'category': 'Padaria',
    'description':
        'Pão francês crocante por fora e macio por dentro, fresquinho todos os dias.',
  },
  {
    'brand': 'Pão & Cia',
    'name': 'Croissant',
    'imageUrl':
        'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=300',
    'price': 4.50,
    'category': 'Padaria',
    'description':
        'Croissant amanteigado e crocante, feito com manteiga francesa importada.',
  },
  {
    'brand': 'Pão & Cia',
    'name': 'Bolo de Cenoura',
    'imageUrl':
        'https://images.unsplash.com/photo-1621303837174-89787a7d4729?w=300',
    'price': 18.99,
    'category': 'Padaria',
    'description': 'Bolo de cenoura fofinho com cobertura de chocolate belga.',
  },
  // Importados
  {
    'brand': 'Gourmet Import',
    'name': 'Azeite Italiano',
    'imageUrl':
        'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?w=300',
    'price': 45.99,
    'category': 'Importados',
    'description':
        'Azeite extra virgem importado da Itália, acidez máxima de 0,3%.',
  },
  {
    'brand': 'Gourmet Import',
    'name': 'Queijo Brie',
    'imageUrl':
        'https://images.unsplash.com/photo-1552767059-ce182ead6c1b?w=300',
    'price': 32.99,
    'category': 'Importados',
    'description':
        'Queijo Brie francês cremoso e suave, perfeito para tábuas de frios.',
  },
  // Laticínios
  {
    'brand': 'Fazenda Feliz',
    'name': 'Iogurte Natural',
    'imageUrl':
        'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=300',
    'price': 5.49,
    'category': 'Laticínios',
    'description':
        'Iogurte natural integral sem adição de açúcar, rico em probióticos.',
  },
  {
    'brand': 'Fazenda Feliz',
    'name': 'Manteiga',
    'imageUrl':
        'https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?w=300',
    'price': 11.99,
    'category': 'Laticínios',
    'description':
        'Manteiga sem sal de primeira qualidade, produzida com leite integral.',
  },
  // Carnes
  {
    'brand': 'Açougue Premium',
    'name': 'Picanha',
    'imageUrl':
        'https://images.unsplash.com/photo-1558030006-450675393462?w=300',
    'price': 89.99,
    'category': 'Carnes',
    'description':
        'Picanha bovina premium, maturada por 21 dias para máxima maciez.',
  },
  {
    'brand': 'Açougue Premium',
    'name': 'Frango Inteiro',
    'imageUrl':
        'https://images.unsplash.com/photo-1587593810167-a84920ea0781?w=300',
    'price': 24.99,
    'category': 'Carnes',
    'description': 'Frango caipira inteiro criado solto, sem uso de hormônios.',
  },
];
