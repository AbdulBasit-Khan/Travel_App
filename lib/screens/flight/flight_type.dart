class Category {
  final int categoryId;
  final String name;
  Category({required this.categoryId,required  this.name});
}

final trainCategory = Category(
  categoryId: 0,
  name: 'On way',
);

final busCategory = Category(
  categoryId: 1,
  name: 'Round Trip',
);

final planeCategory = Category(
  categoryId: 2,
  name: 'Multiplicity',
);

final categories = [
  trainCategory,
  busCategory,
  planeCategory,
];
