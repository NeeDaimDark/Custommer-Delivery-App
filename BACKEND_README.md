# Food Delivery App - Backend Documentation

## 🏗️ Architecture Overview

This backend is built with **Node.js**, **Express.js**, and **MongoDB** following a modular MVC (Model-View-Controller) architecture.

---

## 📁 Project Structure

```
backend/
│
├── config/
│   └── database.js              # MongoDB connection configuration
│
├── middlewares/
│   ├── auth.js                  # Authentication middleware (JWT verification)
│   ├── error-handler.js         # Global error handling middleware
│   ├── mailer.js                # Email sending functionality
│   ├── multer-config.js         # File upload configuration (images, videos, PDFs)
│   ├── storage-videos.js        # Video storage configuration
│   └── storage.js               # General file storage configuration
│
├── models/
│   ├── User.js                  # User schema (customers, delivery drivers)
│   ├── Restaurant.js            # Restaurant/Merchant schema
│   ├── Category.js              # Food category schema
│   ├── Product.js               # Food item/menu schema
│   ├── Order.js                 # Order schema
│   ├── Cart.js                  # Shopping cart schema
│   ├── Address.js               # User address schema
│   ├── Review.js                # Restaurant/Product review schema
│   ├── Offer.js                 # Promotional offers schema
│   ├── Notification.js          # Push notification schema
│   ├── Payment.js               # Payment transaction schema
│   └── DeliveryTracking.js      # Real-time order tracking schema
│
├── controllers/
│   ├── authController.js        # Authentication (login, register, logout, password reset)
│   ├── userController.js        # User CRUD operations
│   ├── restaurantController.js  # Restaurant CRUD operations
│   ├── categoryController.js    # Category CRUD operations
│   ├── productController.js     # Product/Menu CRUD operations
│   ├── orderController.js       # Order management (create, update, track)
│   ├── cartController.js        # Cart operations (add, update, remove items)
│   ├── addressController.js     # Address management
│   ├── reviewController.js      # Review and rating operations
│   ├── offerController.js       # Promotional offers management
│   ├── notificationController.js # Push notification handling
│   ├── paymentController.js     # Payment processing
│   ├── searchController.js      # Search functionality (restaurants, products)
│   └── trackingController.js    # Real-time order tracking
│
├── routes/
│   ├── authRoutes.js            # /api/auth/* endpoints
│   ├── userRoutes.js            # /api/users/* endpoints
│   ├── restaurantRoutes.js      # /api/restaurants/* endpoints
│   ├── categoryRoutes.js        # /api/categories/* endpoints
│   ├── productRoutes.js         # /api/products/* endpoints
│   ├── orderRoutes.js           # /api/orders/* endpoints
│   ├── cartRoutes.js            # /api/cart/* endpoints
│   ├── addressRoutes.js         # /api/addresses/* endpoints
│   ├── reviewRoutes.js          # /api/reviews/* endpoints
│   ├── offerRoutes.js           # /api/offers/* endpoints
│   ├── notificationRoutes.js    # /api/notifications/* endpoints
│   ├── paymentRoutes.js         # /api/payments/* endpoints
│   ├── searchRoutes.js          # /api/search/* endpoints
│   └── trackingRoutes.js        # /api/tracking/* endpoints
│
├── uploads/
│   └── images/                  # Uploaded images (restaurant, products, user profiles)
│
├── server.js                    # Main application entry point
├── package.json                 # Dependencies and scripts
├── .env                         # Environment variables
└── .gitignore                   # Git ignore file
```

---

## 🚀 Core Features

### 1. **Authentication & Authorization**
- User registration (Customer, Restaurant, Delivery Driver)
- Login with JWT token generation
- Password reset via email
- Email verification
- Role-based access control
- Token refresh mechanism

### 2. **User Management**
- Create, Read, Update, Delete (CRUD) operations
- Profile management
- Upload profile pictures
- Manage multiple delivery addresses
- Order history
- Favorites/Wishlist

### 3. **Restaurant Management**
- Restaurant registration and profile
- Menu/Product catalog management
- Restaurant categories
- Operating hours
- Delivery zones
- Restaurant ratings and reviews
- Upload restaurant images

### 4. **Product/Menu Management**
- Add, update, delete menu items
- Product categories (Food, Beverages, Desserts)
- Product images
- Pricing and variants
- Availability status
- Nutritional information

### 5. **Order Management**
- Create new orders
- Order status tracking (Pending, Confirmed, Preparing, Out for Delivery, Delivered, Cancelled)
- Order history
- Real-time order updates
- Order cancellation
- Reorder functionality

### 6. **Cart Management**
- Add/remove items
- Update quantities
- Calculate total price
- Apply discounts/promo codes
- Save cart for later

### 7. **Address Management**
- Add multiple addresses (Home, Work, Custom)
- Set default address
- Update/delete addresses
- GPS coordinates integration

### 8. **Review & Rating System**
- Rate restaurants (1-5 stars)
- Rate products
- Write reviews
- View average ratings
- Reply to reviews (restaurant owners)

### 9. **Offers & Promotions**
- Create promotional offers
- Discount codes
- Free delivery offers
- Time-limited deals
- User-specific offers

### 10. **Payment Processing**
- Multiple payment methods (Card, Cash on Delivery, Mobile Payment)
- Payment gateway integration
- Transaction history
- Refund processing
- Payment receipts

### 11. **Notifications**
- Push notifications
- Order status updates
- Promotional notifications
- Email notifications
- SMS notifications

### 12. **Search & Filter**
- Search restaurants by name, cuisine, location
- Search products/dishes
- Filter by category, price, rating
- Sort by popularity, rating, distance
- Advanced filters

### 13. **Real-time Tracking**
- Live order tracking
- Delivery driver location
- Estimated delivery time
- Route optimization
- GPS integration

### 14. **File Upload**
- Image upload (restaurants, products, profiles)
- Video upload (promotional content)
- PDF upload (menus, receipts)
- File size validation
- File type validation

---

## 🛠️ Technology Stack

| Technology | Purpose |
|------------|---------|
| **Node.js** | Runtime environment |
| **Express.js** | Web framework |
| **MongoDB** | NoSQL database |
| **Mongoose** | MongoDB ODM |
| **JWT** | Authentication tokens |
| **Bcrypt** | Password hashing |
| **Multer** | File upload handling |
| **Nodemailer** | Email sending |
| **Socket.io** | Real-time communication |
| **Stripe/PayPal** | Payment processing |
| **Firebase** | Push notifications |
| **Cloudinary** | Image hosting (optional) |

---

## 📦 NPM Packages Required

```json
{
  "dependencies": {
    "express": "^4.18.2",
    "mongoose": "^8.0.0",
    "dotenv": "^16.3.1",
    "bcryptjs": "^2.4.3",
    "jsonwebtoken": "^9.0.2",
    "cors": "^2.8.5",
    "helmet": "^7.1.0",
    "express-validator": "^7.0.1",
    "multer": "^1.4.5-lts.1",
    "nodemailer": "^6.9.7",
    "socket.io": "^4.6.2",
    "stripe": "^14.5.0",
    "firebase-admin": "^12.0.0",
    "cloudinary": "^1.41.0",
    "compression": "^1.7.4",
    "morgan": "^1.10.0"
  },
  "devDependencies": {
    "nodemon": "^3.0.2"
  }
}
```

---

## 🔧 Environment Variables (.env)

```env
# Server Configuration
PORT=5000
NODE_ENV=development

# Database
MONGO_URI=mongodb://localhost:27017/food_delivery_app
# OR for MongoDB Atlas:
# MONGO_URI=mongodb+srv://<username>:<password>@cluster.mongodb.net/food_delivery_app

# JWT Secret
JWT_SECRET=your_super_secret_jwt_key_here
JWT_EXPIRE=7d
JWT_REFRESH_SECRET=your_refresh_token_secret
JWT_REFRESH_EXPIRE=30d

# Email Configuration (Nodemailer)
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_email@gmail.com
EMAIL_PASSWORD=your_app_password
EMAIL_FROM=Food Delivery App <noreply@fooddelivery.com>

# File Upload
MAX_FILE_SIZE=5242880
UPLOAD_PATH=./uploads

# Payment Gateway (Stripe)
STRIPE_SECRET_KEY=sk_test_your_stripe_secret_key
STRIPE_PUBLISHABLE_KEY=pk_test_your_stripe_publishable_key

# Firebase (Push Notifications)
FIREBASE_PROJECT_ID=your_firebase_project_id
FIREBASE_PRIVATE_KEY=your_firebase_private_key
FIREBASE_CLIENT_EMAIL=your_firebase_client_email

# Cloudinary (Optional - Image Hosting)
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret

# Google Maps API (for location services)
GOOGLE_MAPS_API_KEY=your_google_maps_api_key

# Client URL (for CORS)
CLIENT_URL=http://localhost:3000

# SMS Gateway (Optional)
SMS_API_KEY=your_sms_api_key
SMS_SENDER_ID=FOODAPP
```

---

## 🗄️ Database Models Schema

### User Model
```javascript
{
  name: String,
  email: String (unique),
  password: String (hashed),
  phone: String,
  role: Enum ['customer', 'restaurant', 'driver', 'admin'],
  profileImage: String,
  addresses: [AddressId],
  isVerified: Boolean,
  isActive: Boolean,
  createdAt: Date,
  updatedAt: Date
}
```

### Restaurant Model
```javascript
{
  name: String,
  description: String,
  email: String,
  phone: String,
  address: Object,
  images: [String],
  categories: [CategoryId],
  rating: Number,
  totalReviews: Number,
  minimumOrder: Number,
  deliveryFee: Number,
  deliveryTime: String,
  operatingHours: Object,
  isActive: Boolean,
  ownerId: UserId,
  createdAt: Date,
  updatedAt: Date
}
```

### Order Model
```javascript
{
  orderNumber: String (unique),
  customerId: UserId,
  restaurantId: RestaurantId,
  items: [{ productId, quantity, price }],
  totalAmount: Number,
  deliveryAddress: Object,
  deliveryFee: Number,
  status: Enum ['pending', 'confirmed', 'preparing', 'out_for_delivery', 'delivered', 'cancelled'],
  paymentMethod: String,
  paymentStatus: Enum ['pending', 'paid', 'refunded'],
  driverId: UserId,
  notes: String,
  createdAt: Date,
  updatedAt: Date
}
```

---

## 🔌 API Endpoints Overview

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout
- `POST /api/auth/forgot-password` - Request password reset
- `POST /api/auth/reset-password` - Reset password
- `POST /api/auth/verify-email` - Verify email
- `POST /api/auth/refresh-token` - Refresh JWT token

### Users
- `GET /api/users/profile` - Get current user profile
- `PUT /api/users/profile` - Update user profile
- `POST /api/users/upload-image` - Upload profile image
- `GET /api/users/:id` - Get user by ID (admin)
- `DELETE /api/users/:id` - Delete user (admin)

### Restaurants
- `GET /api/restaurants` - Get all restaurants (with filters)
- `GET /api/restaurants/:id` - Get restaurant details
- `POST /api/restaurants` - Create restaurant (auth required)
- `PUT /api/restaurants/:id` - Update restaurant
- `DELETE /api/restaurants/:id` - Delete restaurant
- `POST /api/restaurants/:id/images` - Upload restaurant images

### Products
- `GET /api/products` - Get all products (with filters)
- `GET /api/products/:id` - Get product details
- `GET /api/products/restaurant/:restaurantId` - Get products by restaurant
- `POST /api/products` - Create product
- `PUT /api/products/:id` - Update product
- `DELETE /api/products/:id` - Delete product

### Orders
- `GET /api/orders` - Get user orders
- `GET /api/orders/:id` - Get order details
- `POST /api/orders` - Create new order
- `PUT /api/orders/:id/status` - Update order status
- `DELETE /api/orders/:id` - Cancel order

### Cart
- `GET /api/cart` - Get user cart
- `POST /api/cart/add` - Add item to cart
- `PUT /api/cart/update` - Update cart item
- `DELETE /api/cart/remove/:itemId` - Remove item from cart
- `DELETE /api/cart/clear` - Clear cart

### Search
- `GET /api/search/restaurants?q=query` - Search restaurants
- `GET /api/search/products?q=query` - Search products
- `GET /api/search/all?q=query` - Search everything

---

## 🚦 Getting Started

### 1. Installation
```bash
npm install
```

### 2. Setup Environment Variables
Create a `.env` file in the root directory and add all required variables.

### 3. Start MongoDB
```bash
# Local MongoDB
mongod

# OR use MongoDB Atlas (cloud)
```

### 4. Run the Server
```bash
# Development mode with auto-restart
npm run dev

# Production mode
npm start
```

### 5. Test the API
```bash
# Server should be running on
http://localhost:5000
```

---

## 📝 Development Guidelines

1. **Code Organization**: Keep controllers thin, move business logic to services
2. **Error Handling**: Use try-catch blocks and centralized error middleware
3. **Validation**: Validate all inputs using express-validator
4. **Security**: Use helmet, rate limiting, and input sanitization
5. **Testing**: Write unit and integration tests
6. **Documentation**: Keep API documentation updated
7. **Git Workflow**: Use feature branches and pull requests
8. **Code Review**: All code must be reviewed before merging

---

## 🔐 Security Best Practices

- ✅ Hash all passwords using bcrypt
- ✅ Use JWT for authentication
- ✅ Implement rate limiting to prevent DDoS
- ✅ Sanitize user inputs to prevent XSS/SQL injection
- ✅ Use HTTPS in production
- ✅ Implement CORS properly
- ✅ Keep dependencies updated
- ✅ Use environment variables for secrets
- ✅ Implement proper error handling (don't expose stack traces)
- ✅ Use helmet for security headers

---

## 📊 Monitoring & Logging

- Use Morgan for HTTP request logging
- Implement Winston for application logging
- Set up error tracking (Sentry)
- Monitor server performance
- Track API response times
- Database query optimization

---

## 🚀 Deployment

### Production Checklist
- [ ] Set NODE_ENV=production
- [ ] Use production MongoDB instance
- [ ] Configure proper CORS origins
- [ ] Enable SSL/HTTPS
- [ ] Set up process manager (PM2)
- [ ] Configure reverse proxy (Nginx)
- [ ] Set up monitoring and logging
- [ ] Implement backups
- [ ] Configure CDN for static assets

---

## 📞 Support & Contribution

For questions or contributions, please contact the development team.

---

**Version**: 1.0.0  
**Last Updated**: November 21, 2025  
**Maintained by**: Food Delivery App Team
