import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ widgets/brand_logo.dart';
import '../../../ core/constants/assets_constants.dart';
import '../../../ core/constants/color_constant.dart';

import 'package:flutter/material.dart';

import '../../../routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20), // Top spacing
              // Logo and App Name
              Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Or your primary color
                      ),
                      children: [
                        TextSpan(
                          text: 'Welcome to APEX\n',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'BIOTICS',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFF6B00), // Orange color
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Health in your hand',
                    style: TextStyle(fontSize: 16, color: Color(0xFFF45535C)),
                  ),
                  SizedBox(height: 40),
                  Image.asset(
                    AssetsConstants.orangeLogo,
                    width: 160,
                    height: 160,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                ],
              ),

              // Tagline

              // Version and Get Started Button
              Column(
                children: [
                  const Text(
                    'Version 1.9.0',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ColorConstant.primaryColor, // Use your orange color
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.register);
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
