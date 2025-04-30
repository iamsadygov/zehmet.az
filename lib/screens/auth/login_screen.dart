

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();
  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+994 (##) ### ## ##',
    filter: { "#": RegExp(r'[0-9]') },
  );

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Zehmet.az',
                  style: TextStyle(
                    fontFamily: 'Roboto Slab',
                    fontSize: 60,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'telefon nömrəsi ilə daxil olun',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Color(0xFFB0B0B0),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _phoneController,
                  focusNode: _phoneFocus,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [phoneMaskFormatter],
                  decoration: InputDecoration(
                    hintText: '+994 (__) ___ __ __',
                    prefixIcon: const Icon(Icons.phone, color: Color(0xFFB0B0B0)),
                    suffixIcon: _phoneController.text.isNotEmpty
                        ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _phoneController.clear();
                        setState(() {});
                      },
                    )
                        : null,
                    filled: true,
                    fillColor: const Color(0xFF1E1E1E),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF3A3A3A)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF4A80F0)),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (phoneMaskFormatter.isFill()) {
                        Navigator.pushNamed(context, '/otp');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A80F0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Kodu Göndər',
                      style: TextStyle(
                        fontFamily: 'Inter Tight',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hesabınız yoxdur? ',
                      style: TextStyle(color: Color(0xFFB0B0B0)),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/signup'),
                      child: const Text(
                        'Hesab Yaradın',
                        style: TextStyle(
                          color: Color(0xFF4837E5),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}