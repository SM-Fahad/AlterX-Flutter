import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/user.dart';
import '../models/cart_item.dart';

class BookingScreen extends StatefulWidget {
  final User user;
  final List<CartItem> cartItems;
  final DateTime? pickupDate;
  final String pickupTime;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<String> onTimeChanged;
  final ValueChanged<int> onRemoveFromCart;
  final ValueChanged2<int, String> onUpdateNotes;
  final VoidCallback onConfirmBooking;
  final VoidCallback onBack;

  const BookingScreen({
    super.key,
    required this.user,
    required this.cartItems,
    required this.pickupDate,
    required this.pickupTime,
    required this.onDateChanged,
    required this.onTimeChanged,
    required this.onRemoveFromCart,
    required this.onUpdateNotes,
    required this.onConfirmBooking,
    required this.onBack,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final List<String> _timeSlots = [
    '09:00 - 12:00',
    '12:00 - 15:00',
    '15:00 - 18:00',
    '18:00 - 21:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onBack,
        ),
        title: const Text('Finalize Request'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location Card
            _buildLocationCard(),
            const SizedBox(height: 16),
            
            // Items Card
            _buildItemsCard(),
            const SizedBox(height: 16),
            
            // Schedule Card
            _buildScheduleCard(),
            const SizedBox(height: 32),
            
            // Confirm Button
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationCard() {
    return Card(
      color: const Color(0xFF1C1917),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, size: 20, color: Color(0xFFDABB7E)),
                const SizedBox(width: 8),
                Text(
                  'Pickup Location',
                  style: TextStyle(
                    color: const Color(0xFFDABB7E),
                    fontSize: 12,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF0C0A09),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF292524)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.user.address,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${widget.user.city}, UAE',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.user.mobile,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsCard() {
    return Card(
      color: const Color(0xFF1C1917),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.shopping_bag, size: 20, color: Color(0xFFDABB7E)),
                const SizedBox(width: 8),
                Text(
                  'Items (${widget.cartItems.length})',
                  style: TextStyle(
                    color: const Color(0xFFDABB7E),
                    fontSize: 12,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            if (widget.cartItems.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: Text(
                    'Your bag is empty',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.cartItems.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[800],
                  height: 24,
                ),
                itemBuilder: (context, index) {
                  final item = widget.cartItems[index];
                  return _buildCartItem(item, index);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(CartItem item, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Item Image
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFF292524),
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(item.image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        
        // Item Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () => widget.onRemoveFromCart(index),
                    icon: const Icon(Icons.delete_outline, size: 18),
                    color: Colors.grey[600],
                  ),
                ],
              ),
              
              // Notes Input
              TextField(
                controller: TextEditingController(text: item.notes),
                onChanged: (value) => widget.onUpdateNotes(index, value),
                decoration: InputDecoration(
                  hintText: 'Add note (e.g. Shorten by 2 inches)...',
                  hintStyle: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

//   Widget _buildCartItem(CartItem item, int index) {
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       // Item Image
//       Container(
//         width: 60,
//         height: 60,
//         decoration: BoxDecoration(
//           color: const Color(0xFF292524),
//           borderRadius: BorderRadius.circular(8),
//           image: DecorationImage(
//             image: NetworkImage(item.image),
//             fit: BoxFit.cover,
//             colorFilter: ColorFilter.mode(
//               Colors.black.withOpacity(0.3),
//               BlendMode.darken,
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(width: 12),
      
//       // Item Details
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text(
//                     item.name,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () => widget.onRemoveFromCart(index),
//                   icon: const Icon(Icons.delete_outline, size: 18),
//                   color: Colors.grey[600],
//                 ),
//               ],
//             ),
            
//             // Notes Input - FIXED
//             TextField(
//               controller: TextEditingController(text: item.notes),
//               onChanged: (value) => widget.onUpdateNotes(index, value),
//               style: TextStyle(
//                 color: Colors.grey[400],
//                 fontSize: 12,
//               ),
//               decoration: InputDecoration(
//                 hintText: 'Add note (e.g. Shorten by 2 inches)...',
//                 hintStyle: TextStyle(
//                   color: Colors.grey[700],
//                   fontSize: 12,
//                 ),
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.zero,
//                 isDense: true,
//               ),
//               textDirection: TextDirection.ltr, // Force LTR
//               textAlign: TextAlign.left,
//               maxLines: 2,
//               keyboardType: TextInputType.text,
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

  Widget _buildScheduleCard() {
    return Card(
      color: const Color(0xFF1C1917),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 20, color: Color(0xFFDABB7E)),
                const SizedBox(width: 8),
                Text(
                  'Preferred Schedule',
                  style: TextStyle(
                    color: const Color(0xFFDABB7E),
                    fontSize: 12,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Date Picker
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date',
                  style: TextStyle(
                    color: const Color(0xFFDABB7E),
                    fontSize: 11,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: _selectDate,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0C0A09),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF292524)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.pickupDate != null
                              ? DateFormat('EEE, MMM d, yyyy').format(widget.pickupDate!)
                              : 'Select Date',
                          style: TextStyle(
                            color: widget.pickupDate != null 
                                ? Colors.white 
                                : Colors.grey[600],
                          ),
                        ),
                        Icon(Icons.calendar_month, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Time Slot
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time Slot',
                  style: TextStyle(
                    color: const Color(0xFFDABB7E),
                    fontSize: 11,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0C0A09),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF292524)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: widget.pickupTime,
                      isExpanded: true,
                      dropdownColor: const Color(0xFF1C1917),
                      style: const TextStyle(color: Colors.white),
                      icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF78716C)),
                      items: _timeSlots.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          widget.onTimeChanged(value);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.cartItems.isNotEmpty ? widget.onConfirmBooking : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFDABB7E),
          foregroundColor: const Color(0xFF0C0A09),
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        child: const Text('CONFIRM PICKUP REQUEST'),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFFDABB7E),
              onPrimary: Color(0xFF0C0A09),
              surface: Color(0xFF1C1917),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: const Color(0xFF1C1917),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null && picked != widget.pickupDate) {
      widget.onDateChanged(picked);
    }
  }
}

// Helper class for callback with two parameters
typedef ValueChanged2<T1, T2> = void Function(T1, T2);