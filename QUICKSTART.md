# Cambodia Store - Quick Start Guide

## 🚀 Run the App in 3 Steps

### Step 1: Install Dependencies
```bash
cd "d:\Lessons_and_Codes\MAF-I\my_project_mobile_app - Copy"
flutter pub get
```

### Step 2: Run on Chrome
```bash
flutter run -d chrome
```

### Step 3: Login as Admin
Use these credentials:
- **Username:** `admin_narith`
- **Password:** `admin123`

## 🎯 What You'll See

1. **Splash Screen** (2 seconds)
   - Cambodia flag logo
   - Loading animation

2. **Login Screen**
   - Enter admin credentials
   - Click "Login" button

3. **Home Screen**
   - Auto-playing image carousel
   - 6 featured products
   - Search bar
   - Cart icon with badge

## 🛍️ Try These Features

### As a Customer:
1. **Browse Products**
   - View products on home screen
   - Click "View All" to see all products
   - Use search bar to find products

2. **Shopping Cart**
   - Click "Add" button on any product
   - Click cart icon to view cart
   - Adjust quantities with +/- buttons
   - Click "Checkout" to complete order

3. **View Product Details**
   - Click "View" button on any product
   - See full description and price

### As an Admin:
1. **Access Admin Dashboard**
   - Open drawer menu (☰)
   - Click "Admin Dashboard"

2. **Add New Product**
   - Fill in the form:
     - Product Name
     - Description
     - Price
     - Image URL
   - Click "Add Product"

3. **Edit Product**
   - Click "Edit" button on any product
   - Modify the details
   - Click "Update Product"

4. **Delete Product**
   - Click "Delete" button
   - Confirm deletion

## 📱 Navigation Guide

### Main Menu (Drawer)
Open by clicking the ☰ icon:
- **Home** - Featured products and carousel
- **Products** - Full product catalog
- **Admin Dashboard** - Product management (admin only)
- **Profile** - User information
- **Settings** - App preferences
- **Contact Us** - Contact form
- **Logout** - Sign out

### Top App Bar
- **Search** - Type to search products
- **Cart** - View shopping cart (shows item count)

## 🎨 Screen Tour

| Screen | Purpose |
|--------|---------|
| Splash | Initial loading screen |
| Login | Admin authentication |
| Home | Featured products + carousel |
| Products | All products with search |
| Cart | Shopping cart management |
| Admin | Product CRUD operations |
| Contact | Contact form + info |
| Profile | User profile display |
| Settings | App preferences |

## 💡 Pro Tips

1. **Quick Add to Cart**
   - Add items from any screen
   - Cart badge updates automatically

2. **Search Products**
   - Start typing in search bar
   - Results filter in real-time
   - Automatically opens Products screen

3. **Manage Products**
   - Products are saved locally
   - Changes persist after app restart
   - Use admin dashboard for full control

4. **Contact Form**
   - All fields are required
   - Phone and email are clickable
   - "Open in Maps" button for location

## 🔧 Troubleshooting

### App won't start?
```bash
flutter clean
flutter pub get
flutter run -d chrome
```

### Can't login?
Make sure you're using:
- Username: `admin_narith`
- Password: `admin123`

### Chrome not opening?
Check if Chrome is running:
```bash
flutter devices
```

### Carousel error?
Already fixed! The app uses carousel_slider 5.1.2

## 📊 Sample Products

The app includes 12 pre-loaded products:
1. Bicycle ($150)
2. Camera ($4,999.50)
3. Bag ($22.75)
4. Tie ($16.99)
5. iPhone ($1,350)
6. Headphones ($150)
7. Tennis Shoes ($69.99)
8. Laptop ($999.50)
9. GYM Equipment ($999)
10. Boots ($76.50)
11. Belt ($9.50)
12. Sample Book ($15)

## 🎓 Learning Points

This app demonstrates:
- ✅ State management with Provider
- ✅ Data persistence with SharedPreferences
- ✅ Navigation and routing
- ✅ Form handling and validation
- ✅ CRUD operations
- ✅ Material Design UI
- ✅ Responsive layouts
- ✅ Custom widgets
- ✅ Image handling
- ✅ Shopping cart logic

## 📞 Support

Need help? Contact:
- Email: narithby225@gmail.com
- Phone: +855 968421774

## 🎉 Enjoy Shopping!

Your Cambodia Store app is ready to use. Happy shopping and managing! 🛒
