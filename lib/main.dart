import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/auth_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/success_screen.dart';
import 'models/user.dart';
import 'models/cart_item.dart';
import 'constants/constants.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const AlterXApp());
}

// class AlterXApp extends StatelessWidget {
//   const AlterXApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'AlterX | Premium Alterations',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: const Color(AppConstants.primaryColor),
//         scaffoldBackgroundColor: const Color(AppConstants.backgroundColor),
//         fontFamily: 'Lato',
//         colorScheme: const ColorScheme.dark(
//           primary: Color(AppConstants.primaryColor),
//           secondary: Color(AppConstants.textSecondary),
//           background: Color(AppConstants.backgroundColor),
//           surface: Color(AppConstants.cardColor),
//         ),
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Color(AppConstants.backgroundColor),
//           elevation: 0,
//           centerTitle: false,
//           titleTextStyle: TextStyle(
//             fontFamily: 'Playfair',
//             fontSize: 24,
//             fontWeight: FontWeight.w600,
//             color: Color(AppConstants.textPrimary),
//           ),
//         ),
//         bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//           backgroundColor: Color(AppConstants.backgroundColor),
//           selectedItemColor: Color(AppConstants.primaryColor),
//           unselectedItemColor: Color(AppConstants.textSecondary),
//         ),
//       ),
//       home: const AlterXHome(),
//     );
//   }
// }

class AlterXApp extends StatelessWidget {
  const AlterXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlterX | Premium Alterations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(AppConstants.primaryColor),
        scaffoldBackgroundColor: const Color(AppConstants.backgroundColor),
        fontFamily: 'Lato',
        colorScheme: const ColorScheme.dark(
          primary: Color(AppConstants.primaryColor),
          secondary: Color(AppConstants.textSecondary),
          background: Color(AppConstants.backgroundColor),
          surface: Color(AppConstants.cardColor),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(AppConstants.backgroundColor),
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontFamily: 'Playfair',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(AppConstants.textPrimary),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(AppConstants.backgroundColor),
          selectedItemColor: Color(AppConstants.primaryColor),
          unselectedItemColor: Color(AppConstants.textSecondary),
        ),
        // REMOVE any textDirection here
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Playfair',
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Color(AppConstants.textPrimary),
          ),
          displayMedium: TextStyle(
            fontFamily: 'Playfair',
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Color(AppConstants.textPrimary),
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.textPrimary),
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Lato',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(AppConstants.textPrimary),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1C1917),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF292524)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF292524)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFDABB7E)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          hintStyle: const TextStyle(
            color: Color(0xFF57534E),
            fontSize: 16,
          ),
          labelStyle: const TextStyle(
            color: Color(0xFFDABB7E),
            fontSize: 12,
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      // REMOVE the Directionality widget - Flutter should auto-detect LTR
      home: const AlterXHome(),
    );
  }
}

class AlterXHome extends StatefulWidget {
  const AlterXHome({super.key});

  @override
  State<AlterXHome> createState() => _AlterXHomeState();
}

class _AlterXHomeState extends State<AlterXHome> {
  // App State
  User? _currentUser;
  List<CartItem> _cartItems = [];
  AppView _currentView = AppView.auth;
  
  // Auth State
  String _mobileNumber = '';
  String _otp = '';
  String _name = '';
  String _address = '';
  String _city = AppConstants.uaeCities[0];
  AuthStep _authStep = AuthStep.phone;
  
  // Booking State
  DateTime? _pickupDate;
  String _pickupTime = AppConstants.timeSlots[0];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentView(),
    );
  }

  Widget _buildCurrentView() {
    switch (_currentView) {
      case AppView.auth:
        return AuthScreen(
          authStep: _authStep,
          mobileNumber: _mobileNumber,
          otp: _otp,
          name: _name,
          address: _address,
          city: _city,
          onMobileChanged: (value) => setState(() => _mobileNumber = value),
          onOtpChanged: (value) => setState(() => _otp = value),
          onNameChanged: (value) => setState(() => _name = value),
          onAddressChanged: (value) => setState(() => _address = value),
          onCityChanged: (value) => setState(() => _city = value),
          onSendOtp: _handleSendOtp,
          onVerifyOtp: _handleVerifyOtp,
          onRegister: _handleRegister,
          onBackToPhone: () => setState(() => _authStep = AuthStep.phone),
        );
      case AppView.dashboard:
        return DashboardScreen(
          user: _currentUser!,
          cartItems: _cartItems,
          onAddToCart: _addToCart,
          onViewCart: () => setState(() => _currentView = AppView.booking),
          onOpenAIChat: _openAIChat,
          onLogout: _handleLogout,
        );
      case AppView.booking:
        return BookingScreen(
          user: _currentUser!,
          cartItems: _cartItems,
          pickupDate: _pickupDate,
          pickupTime: _pickupTime,
          onDateChanged: (date) => setState(() => _pickupDate = date),
          onTimeChanged: (time) => setState(() => _pickupTime = time),
          onRemoveFromCart: _removeFromCart,
          onUpdateNotes: _updateItemNotes,
          onConfirmBooking: _handleBooking,
          onBack: () => setState(() => _currentView = AppView.dashboard),
        );
      case AppView.success:
        return SuccessScreen(
          cartItems: _cartItems,
          pickupDate: _pickupDate!,
          pickupTime: _pickupTime,
          user: _currentUser!,
          onReturnHome: _returnToHome,
        );
    }
  }

  // Auth Handlers
  void _handleSendOtp() {
    if (_mobileNumber.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid mobile number')),
      );
      return;
    }
    setState(() => _authStep = AuthStep.otp);
  }

  void _handleVerifyOtp() {
    if (_otp != '1234') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP. Use 1234 for testing')),
      );
      return;
    }
    setState(() => _authStep = AuthStep.details);
  }

  void _handleRegister() {
    if (_name.isEmpty || _address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all details')),
      );
      return;
    }

    final newUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _name,
      mobile: '+971$_mobileNumber',
      address: _address,
      city: _city,
      createdAt: DateTime.now(),
    );

    setState(() {
      _currentUser = newUser;
      _currentView = AppView.dashboard;
    });
  }

  void _handleLogout() {
    setState(() {
      _currentUser = null;
      _cartItems.clear();
      _currentView = AppView.auth;
      _authStep = AuthStep.phone;
      _mobileNumber = '';
      _otp = '';
      _name = '';
      _address = '';
      _city = AppConstants.uaeCities[0];
    });
  }

  // Cart Handlers
  void _addToCart(Map<String, dynamic> itemData) {
    final newItem = CartItem(
      id: itemData['id'],
      name: itemData['name'],
      category: itemData['category'],
      image: itemData['image'],
      price: itemData['price'],
      addedAt: DateTime.now(),
    );
    
    setState(() {
      _cartItems.add(newItem);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${itemData['name']} added to cart'),
        backgroundColor: const Color(AppConstants.primaryColor),
      ),
    );
  }

  void _removeFromCart(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  void _updateItemNotes(int index, String notes) {
    setState(() {
      _cartItems[index] = _cartItems[index].copyWith(notes: notes);
    });
  }

  // Booking Handler
  void _handleBooking() {
    if (_pickupDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a pickup date')),
      );
      return;
    }
    setState(() => _currentView = AppView.success);
  }

  void _returnToHome() {
    setState(() {
      _cartItems.clear();
      _pickupDate = null;
      _currentView = AppView.dashboard;
    });
  }

  void _openAIChat() {
    // TODO: Implement AI Chat
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('AI Stylist'),
        content: const Text('AI Chat feature will be implemented soon.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

enum AppView {
  auth,
  dashboard,
  booking,
  success,
}

enum AuthStep {
  phone,
  otp,
  details,
}