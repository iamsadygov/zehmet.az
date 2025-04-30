//otp_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();
  int _remainingSeconds = 30;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Future.doWhile(() async {
      if (_remainingSeconds == 0) return false;
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _remainingSeconds--;
      });
      return true;
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Təsdiq Kodunu Daxil Et',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Telefon nömrəsinə göndərilən 6 rəqəmli kodu daxil edin',
              style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: _otpController,
              focusNode: _otpFocusNode,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 6,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                hintText: '------',
                hintStyle: TextStyle(color: Color(0xFF666666), fontSize: 24),
                filled: true,
                fillColor: Color(0xFF1E1E1E),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF3D5AFE)),
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A80F0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  final cameFromSignup = args?['from'] == 'signup';
                  if (cameFromSignup) {
                    Navigator.pushReplacementNamed(context, '/account-type');
                  } else {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                child: const Text(
                  'Təsdiqlə',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Kodu yenidən göndər: 00:${_remainingSeconds.toString().padLeft(2, '0')}',
              style: const TextStyle(color: Color(0xFF3D5AFE), fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}