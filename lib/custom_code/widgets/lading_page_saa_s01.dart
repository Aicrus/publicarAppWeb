// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class LadingPageSaaS01 extends StatefulWidget {
  const LadingPageSaaS01({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<LadingPageSaaS01> createState() => _LadingPageSaaS01State();
}

class _LadingPageSaaS01State extends State<LadingPageSaaS01> {
  final List<String> logoImages = [
    'https://framerusercontent.com/images/ZrQngLHLSVrmCi9Jog3LkyFNcI.png?scale-down-to=512',
    'https://framerusercontent.com/images/iSftT2JXqVgfLxuEHrIccSOoM.png?scale-down-to=512',
    'https://framerusercontent.com/images/A0ucPhuKWqwUhwz49SlzMfSVYk.png?scale-down-to=512',
  ];

  @override
  Widget build(BuildContext context) {
    // Obtém a largura atual da tela
    final screenWidth = MediaQuery.of(context).size.width;
    // Define se está em modo mobile (largura menor que 768px)
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE8F4FF),
            Color(0xFFFFFDE7),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  Image.network(
                    'https://framerusercontent.com/images/tUOOSLf6vrSzJqB1hRIAseDuXjk.png?scale-down-to=512',
                    height: 40,
                  ),
                  // Menu - Visível apenas em desktop
                  if (!isMobile)
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('Home',
                              style:
                                  GoogleFonts.inter(color: Color(0xFF333333))),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('About',
                              style:
                                  GoogleFonts.inter(color: Color(0xFF333333))),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Services',
                              style:
                                  GoogleFonts.inter(color: Color(0xFF333333))),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFF9C4),
                            foregroundColor: Color(0xFF333333),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text('Contact',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  // Menu hamburguer para mobile
                  if (isMobile)
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        // Implementar menu drawer aqui
                      },
                    ),
                ],
              ),
            ),

            // Hero Section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: isMobile ? 24 : 40,
              ),
              child: Column(
                children: [
                  // Conteúdo da esquerda
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? double.infinity : 600,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AdVantage: Propel Your Marketing & Sales to New Heights!',
                          style: GoogleFonts.inter(
                            fontSize: isMobile ? 32 : 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333333),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Streamline your efforts, generate higher quality leads, close deals efficiently, and ultimately, accelerate your business growth like never before.',
                          style: GoogleFonts.inter(
                            fontSize: isMobile ? 16 : 18,
                            color: Color(0xFF666666),
                          ),
                        ),
                        SizedBox(height: 32),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFFF9C4),
                              foregroundColor: Color(0xFF333333),
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 24 : 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Start Project',
                              style: GoogleFonts.inter(
                                fontSize: isMobile ? 14 : 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Imagem hero
                  if (!isMobile) SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: isMobile ? 300 : 400,
                    child: Image.network(
                      'https://framerusercontent.com/images/ajES5dmnyWqAlHSYD1e42adRra4.png?scale-down-to=1024',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            // Logo Carousel
            Container(
              margin: EdgeInsets.symmetric(vertical: isMobile ? 24 : 40),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 60,
                  autoPlay: true,
                  viewportFraction: isMobile ? 0.5 : 0.2,
                  enlargeCenterPage: false,
                  autoPlayInterval: Duration(seconds: 3),
                ),
                items: logoImages.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Image.network(
                          url,
                          fit: BoxFit.contain,
                          color: Color(0xFF666666),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
