import 'package:url_launcher/url_launcher.dart';
import '../models/user.dart';
import '../models/cart_item.dart';

class WhatsAppService {
  static const String adminNumber = '971586274616';

  static Future<bool> sendOrderNotification({
    required User user,
    required List<CartItem> cartItems,
    required DateTime pickupDate,
    required String pickupTime,
  }) async {
    try {
      final message = _generateMessage(user, cartItems, pickupDate, pickupTime);
      final url = 'https://wa.me/$adminNumber?text=${Uri.encodeComponent(message)}';
      
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
        return true;
      }
      return false;
    } catch (e) {
      print('WhatsApp Error: $e');
      return false;
    }
  }

  static String _generateMessage(
    User user,
    List<CartItem> cartItems,
    DateTime pickupDate,
    String pickupTime,
  ) {
    final itemsList = cartItems.map((item) {
      final notes = item.notes.isNotEmpty ? " (${item.notes})" : "";
      return '- ${item.name}$notes - ${item.price}';
    }).join('\n');

    final formattedDate = '${pickupDate.day}/${pickupDate.month}/${pickupDate.year}';

    return '''
*🛎️ New Pickup Request - AlterX*

*👤 Customer Details:*
• Name: ${user.name}
• Mobile: ${user.mobile}
• Address: ${user.address}
• City: ${user.city}

*🛍️ Order Items (${cartItems.length}):*
$itemsList

*📅 Pickup Schedule:*
• Date: $formattedDate
• Time: $pickupTime

*💰 Total Items:* ${cartItems.length}

Thank you! 🎀
''';
  }
}