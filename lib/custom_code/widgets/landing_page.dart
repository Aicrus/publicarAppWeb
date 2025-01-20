// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui' as ui;

class LandingPage extends StatefulWidget {
  const LandingPage({
    super.key,
    this.width,
    this.height,
    this.onGetStartedPressed,
  });

  final double? width;
  final double? height;
  final Future Function()? onGetStartedPressed;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isMenuOpen = false;
  bool isLoading = false;

  Future<void> _handleGetStarted() async {
    if (widget.onGetStartedPressed != null) {
      setState(() => isLoading = true);
      try {
        await widget.onGetStartedPressed!();
      } finally {
        if (mounted) {
          setState(() => isLoading = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=2072&auto=format&fit=crop',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.92),
            BlendMode.lighten,
          ),
        ),
      ),
      child: Column(
        children: [
          // Header/Navigation
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 80,
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                Image.network(
                  'https://static.vecteezy.com/system/resources/thumbnails/038/516/357/small_2x/ai-generated-eagle-logo-design-in-black-style-on-transparant-background-png.png',
                  height: isMobile ? 50 : 60,
                )
                    .animate()
                    .fadeIn(duration: 800.ms)
                    .slideX(begin: -30, duration: 800.ms),

                // Navigation Links
                if (!isMobile)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildNavLink('Features'),
                        _buildNavLink('Pricing'),
                        _buildNavLink('Blog'),
                        _buildNavLink('Changelog'),
                        _buildNavLink('Careers'),
                        _buildNavLink('Support'),
                      ],
                    )
                        .animate()
                        .fadeIn(duration: 800.ms)
                        .slideY(begin: -20, duration: 800.ms),
                  ),

                if (!isMobile)
                  _buildLoginButton()
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .slideX(begin: 30, duration: 800.ms)
                else
                  IconButton(
                    icon: Icon(
                      isMenuOpen ? Icons.close : Icons.menu,
                      size: 30,
                    ),
                    onPressed: () => setState(() => isMenuOpen = !isMenuOpen),
                  ),
              ],
            ),
          ),

          // Mobile Menu
          if (isMobile && isMenuOpen)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildMobileNavLink('Features'),
                  _buildMobileNavLink('Pricing'),
                  _buildMobileNavLink('Blog'),
                  _buildMobileNavLink('Changelog'),
                  _buildMobileNavLink('Careers'),
                  _buildMobileNavLink('Support'),
                  SizedBox(height: 15),
                  _buildLoginButton(),
                  SizedBox(height: 15),
                ],
              ),
            ),

          // Hero Section
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 40 : 80,
                horizontal: isMobile ? 20 : 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Beta Tag
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.auto_awesome,
                            size: isMobile ? 18 : 20,
                            color: Colors.orange[700]),
                        SizedBox(width: 8),
                        Text(
                          'Index 1.0 • Public Beta',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: isMobile ? 14 : 16,
                          ),
                        ),
                        Icon(Icons.chevron_right,
                            size: isMobile ? 18 : 20, color: Colors.black54),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .slideY(begin: -30, duration: 800.ms),

                  SizedBox(height: isMobile ? 30 : 50),

                  // Main Heading with Animation
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? screenSize.width * 0.9 : 800,
                    ),
                    child: Column(
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Data to insights',
                              textStyle: TextStyle(
                                fontSize: isMobile ? 42 : 72,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: -1,
                              ),
                              speed: Duration(milliseconds: 100),
                              textAlign: TextAlign.center,
                            ),
                          ],
                          totalRepeatCount: 1,
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'in minutes',
                              textStyle: TextStyle(
                                fontSize: isMobile ? 42 : 72,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: -1,
                              ),
                              speed: Duration(milliseconds: 100),
                              textAlign: TextAlign.center,
                            ),
                          ],
                          totalRepeatCount: 1,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: isMobile ? 20 : 30),

                  // Subheading
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? screenSize.width * 0.9 : 600,
                    ),
                    child: Text(
                      'Explore your data, build your dashboard,\nbring your team together.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 18 : 22,
                        color: Colors.black54,
                        height: 1.6,
                        letterSpacing: -0.5,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 1200.ms, duration: 800.ms)
                      .slideY(begin: 30, duration: 800.ms),

                  SizedBox(height: isMobile ? 30 : 50),

                  // Get Started Button com loading state
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black87,
                          Colors.black54,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: ElevatedButton(
                          onPressed: isLoading ? null : _handleGetStarted,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 32 : 40,
                              vertical: isMobile ? 16 : 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isLoading)
                                Container(
                                  width: 20,
                                  height: 20,
                                  margin: EdgeInsets.only(right: 12),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                ),
                              Text(
                                isLoading ? 'Loading...' : 'Get started',
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 1600.ms, duration: 800.ms)
                      .slideY(begin: 30, duration: 800.ms),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavLink(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.black54,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNavLink(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 4),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black26),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black87,
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
        ),
        child: Text(
          'Log in',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
