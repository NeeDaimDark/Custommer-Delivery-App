// Image Assets Configuration
// This file contains placeholder images for the food delivery app

class ImageAssets {
  // Food Images
  static const String foodPlaceholder =
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&h=500';
  static const String burger =
      'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&h=500';
  static const String pizza =
      'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=500&h=500';
  static const String sushi =
      'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=500&h=500';
  static const String pasta =
      'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=500&h=500';
  static const String salad =
      'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&h=500';
  static const String dessert =
      'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=500&h=500';
  static const String cake =
      'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&h=500';
  static const String iceCream =
      'https://images.unsplash.com/photo-1497534446932-c925b458314e?w=500&h=500';

  // Beverages
  static const String coffee =
      'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=500&h=500';
  static const String juice =
      'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=500&h=500';
  static const String smoothie =
      'https://images.unsplash.com/photo-1505252585461-04db1eb84625?w=500&h=500';
  static const String tea =
      'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500&h=500';

  // Restaurant Images
  static const String restaurant1 =
      'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800&h=500';
  static const String restaurant2 =
      'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=800&h=500';
  static const String restaurant3 =
      'https://images.unsplash.com/photo-1514933651103-005eec06c04b?w=800&h=500';
  static const String restaurantInterior =
      'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=800&h=500';

  // Delivery & Service
  static const String deliveryScooter =
      'https://images.unsplash.com/photo-1526367790999-0150786686a2?w=500&h=500';
  static const String deliveryMan =
      'https://images.unsplash.com/photo-1566576721346-d4a3b4eaeb55?w=500&h=500';
  static const String foodBox =
      'https://images.unsplash.com/photo-1598866594230-a7c12756260f?w=500&h=500';

  // Category Icons/Images
  static const String categoryFood =
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=300&h=300';
  static const String categoryBeverages =
      'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=300&h=300';
  static const String categoryDesserts =
      'https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=300&h=300';
  static const String categoryFastFood =
      'https://images.unsplash.com/photo-1561758033-d89a9ad46330?w=300&h=300';

  // User/Profile
  static const String userPlaceholder =
      'https://images.unsplash.com/photo-1511367461989-f85a21fda167?w=400&h=400';
  static const String avatarMale =
      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=400&h=400';
  static const String avatarFemale =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400&h=400';

  // Backgrounds
  static const String foodPattern =
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&h=500';
  static const String restaurantBackground =
      'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=1200&h=800';

  // Onboarding
  static const String onboarding1 =
      'https://images.unsplash.com/photo-1526367790999-0150786686a2?w=600&h=600';
  static const String onboarding2 =
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=600&h=600';
  static const String onboarding3 =
      'https://images.unsplash.com/photo-1565299507177-b0ac66763828?w=600&h=600';
  static const String onboarding4 =
      'https://images.unsplash.com/photo-1598866594230-a7c12756260f?w=600&h=600';

  // Promo/Offers
  static const String promoCard =
      'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800&h=400';
  static const String specialOffer =
      'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=800&h=400';

  // Payment
  static const String creditCard =
      'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=400&h=250';
  static const String paypal =
      'https://images.unsplash.com/photo-1563013544-824ae1b704d3?w=400&h=250';

  // Empty States
  static const String emptyCart =
      'https://images.unsplash.com/photo-1563986768609-322da13575f3?w=400&h=400';
  static const String noOrders =
      'https://images.unsplash.com/photo-1598866594230-a7c12756260f?w=400&h=400';
  static const String noNotifications =
      'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=400&h=400';

  // Get random food image from a list
  static List<String> get foodImages => [
        burger,
        pizza,
        sushi,
        pasta,
        salad,
        dessert,
        cake,
        iceCream,
      ];

  // Get random restaurant image from a list
  static List<String> get restaurantImages => [
        restaurant1,
        restaurant2,
        restaurant3,
        restaurantInterior,
      ];
}
