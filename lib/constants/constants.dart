class AppConstants {
  // Categories
  static const List<String> categories = [
    "Men's",
    "Women's",
    "Children's",
    "Formal Wear",
    "Traditional",
  ];

  // UAE Cities
  static const List<String> uaeCities = [
    'Dubai',
    'Abu Dhabi',
    'Sharjah',
    'Ajman',
    'Umm Al Quwain',
    'Ras Al Khaimah',
    'Fujairah',
    'Al Ain',
  ];

  // Admin WhatsApp Number
  static const String adminWhatsAppNumber = '971586274616';

  // Time Slots
  static const List<String> timeSlots = [
    '09:00 - 12:00',
    '12:00 - 15:00',
    '15:00 - 18:00',
    '18:00 - 21:00',
  ];

  // Sample Items
  static const List<Map<String, dynamic>> sampleItems = [
    {
      'id': '1',
      'name': 'Men\'s Suit Alteration',
      'category': "Men's",
      'price': 'AED 120',
      'image': 'https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=400&h=400&fit=crop',
      'description': 'Professional suit fitting and alteration',
    },
    {
      'id': '2',
      'name': 'Dress Hemming',
      'category': "Women's",
      'price': 'AED 80',
      'image': 'https://images.unsplash.com/photo-1539008835657-9e8e9680c956?w=400&h=400&fit=crop',
      'description': 'Perfect dress length adjustment',
    },
    {
      'id': '3',
      'name': 'Jeans Tapering',
      'category': "Men's",
      'price': 'AED 60',
      'image': 'https://images.unsplash.com/photo-1542272604-787c3835535d?w-400&h=400&fit=crop',
      'description': 'Modern fit adjustment for jeans',
    },
    {
      'id': '4',
      'name': 'Blouse Fitting',
      'category': "Women's",
      'price': 'AED 90',
      'image': 'https://images.unsplash.com/photo-1583496661160-fb5886a0aaaa?w=400&h=400&fit=crop',
      'description': 'Custom blouse fitting service',
    },
    {
      'id': '5',
      'name': 'Children\'s Uniform',
      'category': "Children's",
      'price': 'AED 50',
      'image': 'https://images.unsplash.com/photo-1621072156002-e2fccdc0b176?w=400&h=400&fit=crop',
      'description': 'School uniform adjustments',
    },
    {
      'id': '6',
      'name': 'Wedding Gown',
      'category': 'Formal Wear',
      'price': 'AED 250',
      'image': 'https://images.unsplash.com/photo-1519657337289-0776534f2f7d?w=400&h=400&fit=crop',
      'description': 'Bridal gown perfection service',
    },
  ];

  // Colors
  static const primaryColor = 0xFFDABB7E; // Beige 400
  static const primaryDarkColor = 0xFFC69F56; // Beige 500
  static const primaryLightColor = 0xFFE5D1A8; // Beige 300
  static const backgroundColor = 0xFF0C0A09; // Stone 950
  static const cardColor = 0xFF1C1917; // Stone 900
  static const borderColor = 0xFF292524; // Stone 800
  static const textPrimary = 0xFFF7F3E8; // Beige 100
  static const textSecondary = 0xFF78716C; // Stone 500
}