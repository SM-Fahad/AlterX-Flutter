// import 'package:alterx_flutter/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../constants/constants.dart';

// class AuthScreen extends StatelessWidget {
//   final AuthStep authStep;
//   final String mobileNumber;
//   final String otp;
//   final String name;
//   final String address;
//   final String city;
//   final ValueChanged<String> onMobileChanged;
//   final ValueChanged<String> onOtpChanged;
//   final ValueChanged<String> onNameChanged;
//   final ValueChanged<String> onAddressChanged;
//   final ValueChanged<String> onCityChanged;
//   final VoidCallback onSendOtp;
//   final VoidCallback onVerifyOtp;
//   final VoidCallback onRegister;
//   final VoidCallback onBackToPhone;

//   const AuthScreen({
//     super.key,
//     required this.authStep,
//     required this.mobileNumber,
//     required this.otp,
//     required this.name,
//     required this.address,
//     required this.city,
//     required this.onMobileChanged,
//     required this.onOtpChanged,
//     required this.onNameChanged,
//     required this.onAddressChanged,
//     required this.onCityChanged,
//     required this.onSendOtp,
//     required this.onVerifyOtp,
//     required this.onRegister,
//     required this.onBackToPhone,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF0C0A09),
//               Color(0xFF1C1917),
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(24.0),
//             child: Column(
//               children: [
//                 // Logo Section
//                 _buildLogo(),
//                 const SizedBox(height: 40),
                
//                 // Auth Card
//                 _buildAuthCard(context),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLogo() {
//     return Column(
//       children: [
//         // Animated Logo Container
//         Container(
//           width: 120,
//           height: 120,
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xFFE5D1A8), // Beige 300
//                 Color(0xFFDABB7E), // Beige 400
//                 Color(0xFFC69F56), // Beige 500
//               ],
//             ),
//             borderRadius: BorderRadius.circular(24),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color(0xFFDABB7E).withOpacity(0.6),
//                 blurRadius: 20,
//                 spreadRadius: 0,
//               ),
//             ],
//           ),
//           child: const Center(
//             child: Icon(
//               Icons.cut,
//               size: 60,
//               color: Color(0xFF0C0A09),
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
        
//         // Title
//         const Text(
//           'AlterX',
//           style: TextStyle(
//             fontFamily: 'Playfair',
//             fontSize: 48,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         const SizedBox(height: 8),
        
//         // Subtitle
//         const Text(
//           'Premium Alterations • Dubai',
//           style: TextStyle(
//             fontSize: 12,
//             color: Color(0xFF78716C),
//             letterSpacing: 2,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildAuthCard(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1C1917).withOpacity(0.5),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: const Color(0xFF292524)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 20,
//             spreadRadius: 5,
//           ),
//         ],
//       ),
//       child: _buildAuthStep(context),
//     );
//   }

//   Widget _buildAuthStep(BuildContext context) {
//     switch (authStep) {
//       case AuthStep.phone:
//         return _buildPhoneStep();
//       case AuthStep.otp:
//         return _buildOtpStep();
//       case AuthStep.details:
//         return _buildDetailsStep();
//     }
//   }

//   Widget _buildPhoneStep() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'MOBILE NUMBER',
//           style: TextStyle(
//             fontSize: 12,
//             color: Color(0xFFDABB7E),
//             letterSpacing: 2,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
        
//         Row(
//           children: [
//             // Country Code
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF1C1917),
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: const Color(0xFF292524)),
//               ),
//               child: const Text(
//                 '+971',
//                 style: TextStyle(
//                   color: Color(0xFF78716C),
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 8),
            
//             // Mobile Input
//             Expanded(
//               child: TextField(
//                 style: const TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: '50 000 0000',
//                   hintStyle: const TextStyle(color: Color(0xFF57534E)),
//                   filled: true,
//                   fillColor: const Color(0xFF1C1917),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(color: Color(0xFF292524)),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(color: Color(0xFF292524)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(color: Color(0xFFDABB7E)),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 16,
//                   ),
//                 ),
//                 keyboardType: TextInputType.phone,
//                 inputFormatters: [
//                   FilteringTextInputFormatter.digitsOnly,
//                   LengthLimitingTextInputFormatter(9),
//                 ],
//                 onChanged: onMobileChanged,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 24),
        
//         // Send OTP Button
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: onSendOtp,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFDABB7E),
//               foregroundColor: const Color(0xFF0C0A09),
//               minimumSize: const Size(double.infinity, 56),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               textStyle: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 letterSpacing: 1,
//               ),
//             ),
//             child: const Text('SEND OTP CODE'),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildOtpStep() {
//     return Column(
//       children: [
//         const Text(
//           'Enter code sent to',
//           style: TextStyle(
//             color: Color(0xFFA8A29E),
//             fontSize: 14,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           '+971 $mobileNumber',
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
        
//         TextButton(
//           onPressed: onBackToPhone,
//           child: const Text(
//             'Change Number',
//             style: TextStyle(
//               color: Color(0xFFDABB7E),
//               fontSize: 12,
//               decoration: TextDecoration.underline,
//             ),
//           ),
//         ),
//         const SizedBox(height: 24),
        
//         // OTP Input
//         TextField(
//           controller: TextEditingController(text: otp),
//           style: const TextStyle(
//             fontSize: 32,
//             letterSpacing: 20,
//             fontWeight: FontWeight.w300,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//           maxLength: 4,
//           decoration: InputDecoration(
//             hintText: 'X X X X',
//             hintStyle: const TextStyle(
//               color: Color(0xFF57534E),
//               letterSpacing: 20,
//             ),
//             counterText: '',
//             filled: true,
//             fillColor: const Color(0xFF1C1917),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Color(0xFF292524)),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Color(0xFF292524)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Color(0xFFDABB7E)),
//             ),
//             contentPadding: const EdgeInsets.symmetric(vertical: 16),
//           ),
//           keyboardType: TextInputType.number,
//           inputFormatters: [
//             FilteringTextInputFormatter.digitsOnly,
//             LengthLimitingTextInputFormatter(4),
//           ],
//           onChanged: onOtpChanged,
//         ),
//         const SizedBox(height: 24),
        
//         // Verify Button
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: onVerifyOtp,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFDABB7E),
//               foregroundColor: const Color(0xFF0C0A09),
//               minimumSize: const Size(double.infinity, 56),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               textStyle: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 letterSpacing: 1,
//               ),
//             ),
//             child: const Text('VERIFY'),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDetailsStep() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Center(
//           child: Text(
//             'Registration',
//             style: TextStyle(
//               fontSize: 24,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         const SizedBox(height: 24),
        
//         // Name
//         _buildLabel('Full Name'),
//         const SizedBox(height: 8),
//         _buildTextField(
//           hint: 'Jane Doe',
//           value: name,
//           onChanged: onNameChanged,
//         ),
//         const SizedBox(height: 16),
        
//         // City
//         _buildLabel('City'),
//         const SizedBox(height: 8),
//         _buildCityDropdown(),
//         const SizedBox(height: 16),
        
//         // Address
//         _buildLabel('Address Details'),
//         const SizedBox(height: 8),
//         _buildTextField(
//           hint: 'Villa 12, Street 5...',
//           value: address,
//           onChanged: onAddressChanged,
//         ),
//         const SizedBox(height: 24),
        
//         // Register Button
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: onRegister,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFDABB7E),
//               foregroundColor: const Color(0xFF0C0A09),
//               minimumSize: const Size(double.infinity, 56),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               textStyle: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 letterSpacing: 1,
//               ),
//             ),
//             child: const Text('COMPLETE SETUP'),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildLabel(String text) {
//     return Text(
//       text,
//       style: const TextStyle(
//         fontSize: 12,
//         color: Color(0xFFDABB7E),
//         letterSpacing: 2,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required String hint,
//     required String value,
//     required ValueChanged<String> onChanged,
//   }) {
//     return TextField(
//       controller: TextEditingController(text: value),
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: Color(0xFF57534E)),
//         filled: true,
//         fillColor: const Color(0xFF1C1917),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Color(0xFF292524)),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Color(0xFF292524)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Color(0xFFDABB7E)),
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 16,
//         ),
//       ),
//       onChanged: onChanged,
//     );
//   }

//   Widget _buildCityDropdown() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1C1917),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: const Color(0xFF292524)),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           value: city,
//           isExpanded: true,
//           dropdownColor: const Color(0xFF1C1917),
//           style: const TextStyle(color: Colors.white),
//           icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF78716C)),
//           items: AppConstants.uaeCities.map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           onChanged: (value) => onCityChanged(value ?? AppConstants.uaeCities[0]),
//         ),
//       ),
//     );
//   }
// }

import 'package:alterx_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/constants.dart';

class AuthScreen extends StatelessWidget {
  final AuthStep authStep;
  final String mobileNumber;
  final String otp;
  final String name;
  final String address;
  final String city;
  final ValueChanged<String> onMobileChanged;
  final ValueChanged<String> onOtpChanged;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onAddressChanged;
  final ValueChanged<String> onCityChanged;
  final VoidCallback onSendOtp;
  final VoidCallback onVerifyOtp;
  final VoidCallback onRegister;
  final VoidCallback onBackToPhone;

  const AuthScreen({
    super.key,
    required this.authStep,
    required this.mobileNumber,
    required this.otp,
    required this.name,
    required this.address,
    required this.city,
    required this.onMobileChanged,
    required this.onOtpChanged,
    required this.onNameChanged,
    required this.onAddressChanged,
    required this.onCityChanged,
    required this.onSendOtp,
    required this.onVerifyOtp,
    required this.onRegister,
    required this.onBackToPhone,
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Logo Section
                _buildLogo(),
                const SizedBox(height: 40),
                
                // Auth Card
                _buildAuthCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFE5D1A8),
                Color(0xFFDABB7E),
                Color(0xFFC69F56),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFDABB7E).withOpacity(0.6),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.cut,
              size: 60,
              color: Color(0xFF0C0A09),
            ),
          ),
        ),
        const SizedBox(height: 20),
        
        const Text(
          'AlterX',
          style: TextStyle(
            fontFamily: 'Playfair',
            fontSize: 48,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        
        const Text(
          'Premium Alterations • Dubai',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF78716C),
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildAuthCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1917).withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF292524)),
      ),
      child: _buildAuthStep(),
    );
  }

  Widget _buildAuthStep() {
    switch (authStep) {
      case AuthStep.phone:
        return _buildPhoneStep();
      case AuthStep.otp:
        return _buildOtpStep();
      case AuthStep.details:
        return _buildDetailsStep();
    }
  }

  Widget _buildPhoneStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'MOBILE NUMBER',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFFDABB7E),
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1917),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF292524)),
              ),
              child: const Text(
                '+971',
                style: TextStyle(
                  color: Color(0xFF78716C),
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 8),
            
            Expanded(
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '50 000 0000',
                  hintStyle: const TextStyle(color: Color(0xFF57534E)),
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
                  contentPadding: const EdgeInsets.all(16),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(9),
                ],
                onChanged: onMobileChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onSendOtp,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDABB7E),
              foregroundColor: const Color(0xFF0C0A09),
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('SEND OTP CODE'),
          ),
        ),
      ],
    );
  }

  Widget _buildOtpStep() {
    return Column(
      children: [
        const Text(
          'Enter code sent to',
          style: TextStyle(
            color: Color(0xFFA8A29E),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '+971 $mobileNumber',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        
        TextButton(
          onPressed: onBackToPhone,
          child: const Text(
            'Change Number',
            style: TextStyle(
              color: Color(0xFFDABB7E),
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 24),
        
        // Simple OTP Input
        TextField(
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 10,
          ),
          textAlign: TextAlign.center,
          maxLength: 4,
          decoration: InputDecoration(
            hintText: 'XXXX',
            hintStyle: const TextStyle(
              color: Color(0xFF57534E),
              letterSpacing: 10,
            ),
            counterText: '',
            filled: true,
            fillColor: const Color(0xFF1C1917),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF292524)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFDABB7E)),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: onOtpChanged,
        ),
        const SizedBox(height: 24),
        
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onVerifyOtp,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDABB7E),
              foregroundColor: const Color(0xFF0C0A09),
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('VERIFY'),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Registration',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 24),
        
        const Text(
          'Full Name',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFFDABB7E),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'Jane Doe',
            hintStyle: const TextStyle(color: Color(0xFF57534E)),
            filled: true,
            fillColor: const Color(0xFF1C1917),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF292524)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFDABB7E)),
            ),
          ),
          onChanged: onNameChanged,
        ),
        const SizedBox(height: 16),
        
        const Text(
          'City',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFFDABB7E),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: city,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF1C1917),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF292524)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFDABB7E)),
            ),
          ),
          items: AppConstants.uaeCities.map((city) {
            return DropdownMenuItem(
              value: city,
              child: Text(city),
            );
          }).toList(),
          onChanged: (value) => onCityChanged(value!),
        ),
        const SizedBox(height: 16),
        
        const Text(
          'Address Details',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFFDABB7E),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'Villa 12, Street 5...',
            hintStyle: const TextStyle(color: Color(0xFF57534E)),
            filled: true,
            fillColor: const Color(0xFF1C1917),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF292524)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFDABB7E)),
            ),
          ),
          onChanged: onAddressChanged,
        ),
        const SizedBox(height: 24),
        
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onRegister,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDABB7E),
              foregroundColor: const Color(0xFF0C0A09),
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('COMPLETE SETUP'),
          ),
        ),
      ],
    );
  }
}