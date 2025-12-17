import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/user.dart';
import '../models/cart_item.dart';
import '../services/whatsapp_service.dart';
import '../widgets/custom_button.dart';

class SuccessScreen extends StatelessWidget {
  final List<CartItem> cartItems;
  final DateTime pickupDate;
  final String pickupTime;
  final User user;
  final VoidCallback onReturnHome;

  const SuccessScreen({
    super.key,
    required this.cartItems,
    required this.pickupDate,
    required this.pickupTime,
    required this.user,
    required this.onReturnHome,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0C0A09),
              Color(0xFF1C1917),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Success Icon
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: const Color(0xFF14532D).withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF22C55E).withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    size: 64,
                    color: Color(0xFF22C55E),
                  ),
                ),
                const SizedBox(height: 32),
                
                // Title
                const Text(
                  'Request Confirmed!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                
                // Message
                Text(
                  'Your pickup for ${cartItems.length} item${cartItems.length == 1 ? '' : 's'} has been scheduled.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${DateFormat('EEE, MMM d').format(pickupDate)} • $pickupTime',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFDABB7E),
                  ),
                ),
                const SizedBox(height: 48),
                
                // Order Summary
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1917),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF292524)),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Order Summary',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...cartItems.map((item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.name,
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Text(
                              item.price,
                              style: const TextStyle(
                                color: Color(0xFFDABB7E),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )).toList(),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Buttons
                Column(
                  children: [
                    CustomButton(
                      text: 'NOTIFY ADMIN ON WHATSAPP',
                      onPressed: _notifyAdmin,
                      icon: Icons.message,
                      isPrimary: true,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: 'RETURN TO HOME',
                      onPressed: onReturnHome,
                      isPrimary: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _notifyAdmin() async {
    final success = await WhatsAppService.sendOrderNotification(
      user: user,
      cartItems: cartItems,
      pickupDate: pickupDate,
      pickupTime: pickupTime,
    );
    
    if (!success) {
      // Handle error - show snackbar or alert
    }
  }
}