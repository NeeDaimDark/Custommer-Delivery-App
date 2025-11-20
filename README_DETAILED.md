# Food Delivery Customer App - Complete Documentation

## 📱 Project Overview

This is a comprehensive **Food Delivery Customer Application** built with Flutter. The app provides a complete customer experience for browsing restaurants, ordering food, tracking deliveries, and managing user profiles.

**Version:** 1.0.0+1  
**Flutter SDK:** >=3.0.0 <4.0.0  
**Platform Support:** Android, iOS, Web

---

## 🎯 Key Features

### 1. **User Authentication & Onboarding**
- Splash screen with app branding
- 4-step onboarding flow
- Login / Sign Up system
- OTP verification
- Password reset functionality
- Social authentication ready

### 2. **Home & Discovery**
- Browse featured restaurants
- Search functionality
- Category-based filtering
- Special offers and promotions
- Nearby restaurants with geolocation

### 3. **Restaurant & Menu**
- Restaurant details view
- Menu browsing by categories (Food, Beverages, Desserts)
- Product view with details
- Product images and descriptions
- Price display
- Add to cart functionality

### 4. **Shopping Cart & Checkout**
- Cart management (add, remove, update quantities)
- Order summary
- Delivery address selection
- Payment method selection (Credit Card, PayPal, Cash)
- Promo code application
- Order notes

### 5. **Address Management**
- Address search with Google Maps integration
- Multiple address types:
  - Home
  - Office
  - Apartment
  - Other (custom)
- Address CRUD operations (Create, Read, Update, Delete, Search)
- Map-based address selection
- Set default delivery address

### 6. **Order Management**
- Place orders
- View ongoing orders
- Order history
- Track order in real-time
- Order status updates
- Delivery tracking with map

### 7. **User Profile**
- View/Edit profile information
- Upload profile photo
- Language selection
- Notification preferences
- About us page

### 8. **Communication**
- In-app messaging
- Chat with delivery driver
- Call delivery driver
- Customer support chat

### 9. **Additional Features**
- Push notifications
- Offers & promotions page
- Order arrival notifications
- Bottom sheet modals for quick actions
- Responsive UI design

---

## 📂 Project Structure

```
lib/
├── about_us_page/              # About us screen
├── adress/                     # Address management module
│   ├── adress/                 # Main address list
│   ├── adress_apartment/       # Apartment address form
│   ├── adress_apartment_c_a_d/ # Apartment CRUD
│   ├── adress_apartment_c_a_d_s/ # Apartment CRUD with search
│   ├── adress_home/            # Home address form
│   ├── adress_home_c_a_d/      # Home CRUD
│   ├── adress_home_c_a_d_s/    # Home CRUD with search
│   ├── adress_office/          # Office address form
│   ├── adress_office_c_a_d/    # Office CRUD
│   ├── adress_office_c_a_d_s/  # Office CRUD with search
│   ├── adress_other/           # Other address form
│   ├── adress_other_c_a_d/     # Other CRUD
│   ├── adress_other_c_a_d_s/   # Other CRUD with search
│   ├── adress_search/          # Address search with maps
│   ├── adress_type/            # Address type selector
│   └── change_adress/          # Change delivery address
├── auth/                       # Authentication module
│   ├── log_in_or_signup/       # Initial auth screen
│   ├── login/                  # Login screen
│   ├── sign_up/                # Registration screen
│   ├── otp/                    # OTP verification
│   ├── reset_password/         # Password reset request
│   └── new_password/           # Set new password
├── cart_page/                  # Shopping cart
├── categories_page/            # Food categories browser
├── chat_box/                   # Chat interface
├── checkout/                   # Checkout flow
├── components/                 # Reusable widgets
│   ├── calling_widget          # Call driver modal
│   ├── cash_amount_widget      # Cash payment input
│   ├── navbar_widget           # Bottom navigation
│   ├── notes_widget            # Order notes input
│   ├── order_placed_widget     # Order confirmation modal
│   ├── pay_credit_card_widget  # Credit card payment
│   ├── pay_paypal_widget       # PayPal payment
│   ├── prduct_added_widget     # Product added confirmation
│   ├── promo_widget            # Promo code input
│   ├── track_order_bottomsheet # Order tracking sheet
│   └── upload_photo_widget     # Photo upload
├── edit_profile/               # Edit user profile
├── enjoy/                      # Post-order success screen
├── flutter_flow/               # FlutterFlow framework
│   ├── flutter_flow_choice_chips
│   ├── flutter_flow_count_controller
│   ├── flutter_flow_drop_down
│   ├── flutter_flow_google_map
│   ├── flutter_flow_icon_button
│   ├── flutter_flow_model
│   ├── flutter_flow_theme
│   ├── flutter_flow_util
│   ├── flutter_flow_widgets
│   ├── form_field_controller
│   ├── lat_lng
│   ├── place
│   ├── uploaded_file
│   └── nav/                    # Navigation & routing
├── home_page/                  # Main home screen
├── language/                   # Language selection
├── menu_beverages/             # Beverages menu
├── menu_dessert/               # Desserts menu
├── menu_food/                  # Food menu
├── menu_page/                  # Menu categories
├── messages/                   # Messages list
├── more_page/                  # More options menu
├── my_ongoing_orders/          # Active orders
├── my_orders_history/          # Past orders
├── notifications/              # Notifications center
├── offers/                     # Offers & deals
├── onboardings/                # Onboarding screens (1-4)
├── order_arrival/              # Order arrival screen
├── payment_method/             # Payment selection
├── product_view/               # Product details
├── profile/                    # User profile view
├── restaurant_view/            # Restaurant details
├── splash/                     # Splash screen
├── track_order/                # Order tracking with map
├── index.dart                  # Export barrel file
└── main.dart                   # App entry point
```

---

## 🎨 Screens & Widgets

### Authentication Screens
| Screen | File | Purpose |
|--------|------|---------|
| Splash | `splash/splash_widget.dart` | App initialization screen |
| Onboarding 1-4 | `onboardings/onboarding_[1-4]/` | Introduction slides |
| Login/Signup Selector | `auth/log_in_or_signup/` | Choose auth method |
| Login | `auth/login/` | User login |
| Sign Up | `auth/sign_up/` | New user registration |
| OTP Verification | `auth/otp/` | Verify phone/email |
| Reset Password | `auth/reset_password/` | Request password reset |
| New Password | `auth/new_password/` | Set new password |

### Main App Screens
| Screen | File | Purpose |
|--------|------|---------|
| Home | `home_page/` | Main dashboard |
| Categories | `categories_page/` | Browse food categories |
| Restaurant View | `restaurant_view/` | Restaurant details & menu |
| Product View | `product_view/` | Product details |
| Cart | `cart_page/` | Shopping cart |
| Checkout | `checkout/` | Order checkout |
| Menu Food | `menu_food/` | Food items |
| Menu Beverages | `menu_beverages/` | Drinks |
| Menu Dessert | `menu_dessert/` | Desserts |
| Menu Page | `menu_page/` | Menu category selector |

### Order Screens
| Screen | File | Purpose |
|--------|------|---------|
| Ongoing Orders | `my_ongoing_orders/` | Active orders |
| Order History | `my_orders_history/` | Past orders |
| Track Order | `track_order/` | Real-time tracking |
| Order Arrival | `order_arrival/` | Delivery notification |
| Enjoy | `enjoy/` | Order success |

### Address Screens
| Screen | File | Purpose |
|--------|------|---------|
| Addresses List | `adress/adress/` | Saved addresses |
| Address Search | `adress/adress_search/` | Find address on map |
| Address Type | `adress/adress_type/` | Select address type |
| Change Address | `adress/change_adress/` | Update delivery address |
| Home Address | `adress/adress_home/` | Add home address |
| Office Address | `adress/adress_office/` | Add office address |
| Apartment Address | `adress/adress_apartment/` | Add apartment address |
| Other Address | `adress/adress_other/` | Add custom address |

### Profile & Settings
| Screen | File | Purpose |
|--------|------|---------|
| Profile | `profile/` | User profile |
| Edit Profile | `edit_profile/` | Update profile info |
| Language | `language/` | Language settings |
| About Us | `about_us_page/` | App information |
| More | `more_page/` | Additional options |

### Communication
| Screen | File | Purpose |
|--------|------|---------|
| Messages | `messages/` | Chat list |
| Chat Box | `chat_box/` | Message conversation |
| Notifications | `notifications/` | Push notifications |

### Payment
| Screen | File | Purpose |
|--------|------|---------|
| Payment Method | `payment_method/` | Select payment type |
| Credit Card Payment | `components/pay_credit_card_widget` | Card payment |
| PayPal Payment | `components/pay_paypal_widget` | PayPal payment |
| Cash Amount | `components/cash_amount_widget` | Cash on delivery |

### Reusable Components
| Component | File | Purpose |
|-----------|------|---------|
| Navbar | `components/navbar_widget` | Bottom navigation bar |
| Calling | `components/calling_widget` | Call driver modal |
| Notes | `components/notes_widget` | Add order notes |
| Promo | `components/promo_widget` | Apply promo code |
| Product Added | `components/prduct_added_widget` | Add to cart confirmation |
| Order Placed | `components/order_placed_widget` | Order success modal |
| Track Order Sheet | `components/track_order_bottomsheet` | Quick tracking view |
| Upload Photo | `components/upload_photo_widget` | Photo picker |

---

## 🔧 Technical Stack

### Core Dependencies

#### UI & Navigation
- **go_router** (12.1.3) - Advanced routing
- **page_transition** (2.1.0) - Page animations
- **flutter_animate** (4.5.0) - Widget animations
- **auto_size_text** (3.0.0) - Responsive text
- **dropdown_button2** (2.3.9) - Custom dropdowns
- **font_awesome_flutter** (10.7.0) - Icons

#### Styling
- **google_fonts** (6.1.0) - Custom fonts
- **from_css_color** (2.0.0) - CSS color support

#### Maps & Location
- **google_maps_flutter** (2.9.0) - Google Maps
- **flutter_map** (5.0.0) - Alternative map solution
- **geolocator** (14.0.0) - Location services
- **latlong2** (0.9.0) - GPS coordinates

#### Media & Caching
- **cached_network_image** (3.4.1) - Image caching
- **flutter_cache_manager** (3.4.1) - Cache management

#### Data & Storage
- **provider** (6.1.2) - State management
- **shared_preferences** (2.3.2) - Local preferences
- **sqflite** (2.3.3+1) - Local database
- **path_provider** (2.1.4) - File paths

#### Networking
- **http** (1.2.2) - HTTP requests
- **json_path** (0.7.2) - JSON parsing

#### Utilities
- **intl** (0.20.2) - Internationalization
- **timeago** (3.7.1) - Time formatting
- **url_launcher** (6.3.0) - External links
- **collection** (1.19.0) - Collection utilities

---

## 🗄️ Backend Integration Points

### API Endpoints Needed

#### Authentication APIs
```
POST /api/auth/register
POST /api/auth/login
POST /api/auth/verify-otp
POST /api/auth/reset-password
POST /api/auth/refresh-token
POST /api/auth/logout
```

#### User Profile APIs
```
GET /api/user/profile
PUT /api/user/profile
POST /api/user/upload-photo
GET /api/user/addresses
POST /api/user/addresses
PUT /api/user/addresses/:id
DELETE /api/user/addresses/:id
```

#### Restaurant & Menu APIs
```
GET /api/restaurants
GET /api/restaurants/:id
GET /api/restaurants/nearby?lat=&lng=
GET /api/restaurants/:id/menu
GET /api/categories
GET /api/products/:id
GET /api/products/search?query=
```

#### Order APIs
```
POST /api/orders
GET /api/orders/ongoing
GET /api/orders/history
GET /api/orders/:id
GET /api/orders/:id/track
PUT /api/orders/:id/cancel
POST /api/orders/:id/rating
```

#### Cart APIs
```
GET /api/cart
POST /api/cart/items
PUT /api/cart/items/:id
DELETE /api/cart/items/:id
DELETE /api/cart/clear
POST /api/cart/apply-promo
```

#### Payment APIs
```
POST /api/payments/process
GET /api/payments/methods
POST /api/payments/credit-card
POST /api/payments/paypal
```

#### Communication APIs
```
GET /api/messages
POST /api/messages
GET /api/messages/:conversationId
POST /api/chat/send
WebSocket /api/chat/connect
```

#### Notification APIs
```
GET /api/notifications
PUT /api/notifications/:id/read
DELETE /api/notifications/:id
POST /api/notifications/token (FCM)
```

#### Offers & Promotions
```
GET /api/offers
GET /api/offers/:id
POST /api/promo/validate
```

---

## 📊 Data Models

### User Model
```dart
{
  "id": String,
  "name": String,
  "email": String,
  "phone": String,
  "profileImage": String,
  "addresses": List<Address>,
  "defaultAddressId": String,
  "language": String,
  "createdAt": DateTime
}
```

### Address Model
```dart
{
  "id": String,
  "userId": String,
  "type": String, // home, office, apartment, other
  "label": String,
  "street": String,
  "building": String,
  "floor": String,
  "apartment": String,
  "city": String,
  "latitude": double,
  "longitude": double,
  "isDefault": bool
}
```

### Restaurant Model
```dart
{
  "id": String,
  "name": String,
  "description": String,
  "image": String,
  "rating": double,
  "reviewCount": int,
  "deliveryTime": String,
  "deliveryFee": double,
  "minimumOrder": double,
  "categories": List<String>,
  "latitude": double,
  "longitude": double,
  "isOpen": bool,
  "openingHours": Map
}
```

### Product Model
```dart
{
  "id": String,
  "restaurantId": String,
  "name": String,
  "description": String,
  "image": String,
  "price": double,
  "category": String,
  "isAvailable": bool,
  "options": List<ProductOption>,
  "tags": List<String>
}
```

### Order Model
```dart
{
  "id": String,
  "userId": String,
  "restaurantId": String,
  "items": List<OrderItem>,
  "subtotal": double,
  "deliveryFee": double,
  "discount": double,
  "total": double,
  "status": String, // pending, confirmed, preparing, on_the_way, delivered, cancelled
  "paymentMethod": String,
  "paymentStatus": String,
  "deliveryAddress": Address,
  "notes": String,
  "driverId": String,
  "driverLocation": LatLng,
  "estimatedDeliveryTime": DateTime,
  "createdAt": DateTime,
  "updatedAt": DateTime
}
```

### Cart Item Model
```dart
{
  "productId": String,
  "name": String,
  "image": String,
  "price": double,
  "quantity": int,
  "options": Map,
  "notes": String
}
```

---

## 🎨 Design System

### Theme
The app uses FlutterFlow's theming system (`flutter_flow_theme.dart`):
- Primary color scheme
- Secondary color scheme
- Success/Error/Warning colors
- Text styles (heading, body, label)
- Custom fonts (Poppins, Ubuntu, Newsreader)

### Typography
- **Heading Fonts**: Poppins-SemiBold
- **Body Fonts**: Poppins-Regular, Ubuntu-Regular
- **Custom Font**: Newsreader-Italic (Variable)

### Assets Structure
```
assets/
├── fonts/          # Custom fonts
├── images/         # App images & icons
├── videos/         # Video content
├── audios/         # Audio files
├── rive_animations/ # Rive animations
├── pdfs/           # PDF documents
└── jsons/          # JSON data files
```

---

## 🔐 Features Requiring Backend

### Authentication & Security
- [ ] User registration with email/phone
- [ ] OTP generation and verification
- [ ] JWT token management
- [ ] Password hashing & validation
- [ ] Session management
- [ ] Social authentication (optional)

### Real-time Features
- [ ] Live order tracking (WebSocket)
- [ ] Driver location updates
- [ ] In-app messaging (WebSocket)
- [ ] Push notifications (FCM)
- [ ] Order status updates

### Payment Integration
- [ ] Payment gateway integration
- [ ] Credit card processing
- [ ] PayPal integration
- [ ] Cash on delivery handling
- [ ] Transaction history
- [ ] Refund processing

### Data Management
- [ ] Restaurant database
- [ ] Menu & product catalog
- [ ] User profile storage
- [ ] Order management system
- [ ] Address geocoding
- [ ] Review & rating system

### Business Logic
- [ ] Promo code validation
- [ ] Delivery fee calculation
- [ ] Restaurant availability logic
- [ ] Order assignment to drivers
- [ ] Distance-based restaurant filtering
- [ ] ETA calculation

---

## 🚀 Getting Started

### Prerequisites
```bash
Flutter SDK: >=3.0.0 <4.0.0
Dart SDK: >=3.0.0
Android Studio / Xcode
```

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd customer_app_temp_7
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Configure Google Maps**
   - Add Google Maps API key in `android/app/src/main/AndroidManifest.xml`
   - Add API key in `ios/Runner/AppDelegate.swift`

4. **Run the app**
```bash
flutter run
```

---

## 📱 Supported Platforms

- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 12+)
- ✅ **Web** (Chrome, Edge, Safari)
- ⚠️ **Windows** (Desktop - partial support)

---

## 🔑 Environment Configuration

Create a `.env` file for backend configuration:
```env
API_BASE_URL=https://your-api.com/api
GOOGLE_MAPS_API_KEY=your_google_maps_key
PAYPAL_CLIENT_ID=your_paypal_client_id
FCM_SERVER_KEY=your_fcm_server_key
```

---

## 📝 Backend Development Checklist

### Phase 1: Core Setup
- [ ] Set up database (PostgreSQL/MongoDB)
- [ ] Create user authentication system
- [ ] Implement JWT token handling
- [ ] Set up file storage (AWS S3/Cloudinary)

### Phase 2: Restaurant Management
- [ ] Restaurant CRUD APIs
- [ ] Menu management system
- [ ] Product catalog APIs
- [ ] Category management
- [ ] Image upload handling

### Phase 3: Order System
- [ ] Cart management APIs
- [ ] Order creation & tracking
- [ ] Order status workflow
- [ ] Driver assignment logic
- [ ] Real-time location tracking

### Phase 4: Payments
- [ ] Payment gateway integration
- [ ] Transaction processing
- [ ] Payment method management
- [ ] Promo code system
- [ ] Invoice generation

### Phase 5: Communication
- [ ] Push notification service
- [ ] WebSocket server for chat
- [ ] Email/SMS notifications
- [ ] In-app messaging system

### Phase 6: Advanced Features
- [ ] Review & rating system
- [ ] Analytics dashboard
- [ ] Admin panel
- [ ] Reporting system
- [ ] Multi-language support

---

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/

# Generate coverage
flutter test --coverage
```

---

## 📦 Build & Deploy

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

---

## 📄 License

This project is a template for food delivery applications. Modify and use according to your needs.

---

## 👨‍💻 Developer Notes

### State Management
The app uses **Provider** for state management. Each screen has its own model file (`*_model.dart`) that extends `FlutterFlowModel`.

### Navigation
Uses **GoRouter** for declarative routing. Routes are defined in `lib/flutter_flow/nav/nav.dart`.

### Custom Widgets
FlutterFlow provides custom widgets in `lib/flutter_flow/`:
- `FlutterFlowIconButton` - Custom icon buttons
- `FlutterFlowDropDown` - Styled dropdowns
- `FlutterFlowCountController` - Quantity selector
- `FlutterFlowChoiceChips` - Choice chip widgets
- `FlutterFlowGoogleMap` - Google Maps integration

### API Integration Pattern
1. Create service classes in a new `lib/services/` directory
2. Implement HTTP calls using the `http` package
3. Use Provider to manage API state
4. Handle errors and loading states
5. Cache responses where appropriate

---

## 🎯 Recommended Backend Stack

- **Framework**: Node.js (Express) / Python (Django/FastAPI) / PHP (Laravel)
- **Database**: PostgreSQL / MongoDB
- **Cache**: Redis
- **File Storage**: AWS S3 / Google Cloud Storage
- **Real-time**: Socket.IO / Firebase
- **Payment**: Stripe / PayPal / Local payment gateway
- **Maps**: Google Maps API
- **Notifications**: Firebase Cloud Messaging
- **Deployment**: AWS / Google Cloud / DigitalOcean

---

## 📞 Support & Contact

For backend integration support or questions about the app structure, please refer to this documentation or contact the development team.

---

**Last Updated:** November 2025  
**App Version:** 1.0.0+1  
**Documentation Version:** 1.0
