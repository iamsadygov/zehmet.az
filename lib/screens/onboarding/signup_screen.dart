//signup_screen.dart

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = 'SignUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+994 (##) ### ## ##',
    filter: { "#": RegExp(r'[0-9]') },
  );

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/800x800?text=service+marketplace'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0x80000000), Color(0xFF121212)],
                ),
              ),
              child: const Center(
                child: Text(
                  'Zehmet.az',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontFamily: 'Roboto Slab',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Hesab Yaradın',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter Tight',
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Zehmet.az iş bazarına qatılın',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xFFB0B0B0),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Ad Soyad',
                              filled: true,
                              fillColor: Color(0xFF1E1E1E),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Color(0xFF3A3A3A)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Color(0xFF4A80F0)),
                              ),
                              labelStyle: TextStyle(color: Color(0xFFB0B0B0)),
                            ),
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.name,
                            validator: (value) => value == null || value.isEmpty ? 'Ad Soyad daxil edin' : null,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [phoneMaskFormatter],
                            decoration: const InputDecoration(
                              labelText: 'Telefon nömrəsi',
                              hintText: '+994 (__) ___ __ __',
                              filled: true,
                              fillColor: Color(0xFF1E1E1E),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Color(0xFF3A3A3A)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(color: Color(0xFF4A80F0)),
                              ),
                              labelStyle: TextStyle(color: Color(0xFFB0B0B0)),
                            ),
                            style: const TextStyle(color: Colors.white),
                            validator: (value) => value == null || value.isEmpty ? 'Telefon daxil edin' : null,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                            onPressed: () {
                              if ((_formKey.currentState?.validate() ?? false) && phoneMaskFormatter.isFill()) {
                                Navigator.pushNamed(
                                  context,
                                  '/otp',
                                  arguments: {'from': 'signup'},
                                );
                              }
                            },
                            icon: const Icon(Icons.lock_person),
                            label: const Text('Hesab Yaradın'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4A80F0),
                              minimumSize: const Size.fromHeight(55),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              textStyle: const TextStyle(
                                fontFamily: 'Inter Tight',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Hesabınız var?',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFFB0B0B0),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/login'),
                          child: const Text(
                            'Daxil olun',
                            style: TextStyle(
                              color: Color(0xFF4A80F0),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}