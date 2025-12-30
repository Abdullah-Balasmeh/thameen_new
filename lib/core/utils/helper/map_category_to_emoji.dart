String mapCategoryToEmoji(String itemCategory) {
  switch (itemCategory) {
    case 'Electronics':
      return '📱';
    case 'Documents':
      return '📄';
    case 'Clothing':
      return '👕';
    case 'Accessories':
      return '👜';
    case 'Bags':
      return '💼';
    case 'Keys':
      return '🔑';
    case 'Pets':
      return '🐶';
    case 'Other':
      return '📦';
    default:
      return '📦';
  }
}
