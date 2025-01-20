// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE8F4FF),
            Color(0xFFFFFDE7),
            Colors.white,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: const [0.0, 0.5, 1.0],
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
                    height: 32,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideX(begin: -0.2, end: 0),

                  // Menu centralizado
                  if (!isMobile)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildNavItem('Home'),
                          _buildNavItem('About'),
                          _buildNavItem('Services'),
                        ],
                      ),
                    ),

                  // Botão Contact
                  if (!isMobile)
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFF9C4),
                        foregroundColor: Color(0xFF333333),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Text('Contact',
                          style:
                              GoogleFonts.inter(fontWeight: FontWeight.w500)),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideX(begin: 0.2, end: 0),

                  if (isMobile)
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
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
              child: !isMobile
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Conteúdo da esquerda
                        Expanded(
                          child: _buildLeftContent(isMobile),
                        ),
                        // Imagem hero
                        Expanded(
                          child: _buildHeroImage(isMobile),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _buildLeftContent(isMobile),
                        _buildHeroImage(isMobile),
                      ],
                    ),
            ),

            // Logo Carousel atualizado
            Container(
              margin: EdgeInsets.symmetric(vertical: isMobile ? 24 : 40),
              height: 40,
              child: Stack(
                children: [
                  // Máscara de gradiente para suavizar as bordas
                  Positioned.fill(
                    child: IgnorePointer(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(1),
                              Colors.white.withOpacity(0),
                              Colors.white.withOpacity(0),
                              Colors.white.withOpacity(1),
                            ],
                            stops: const [0.0, 0.1, 0.9, 1.0],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 40,
                      autoPlay: true,
                      viewportFraction: isMobile ? 0.4 : 0.15,
                      enlargeCenterPage: false,
                      autoPlayInterval: Duration(milliseconds: 0),
                      scrollPhysics: NeverScrollableScrollPhysics(),
                      autoPlayAnimationDuration: Duration(seconds: 10),
                      autoPlayCurve: Curves.linear,
                      pauseAutoPlayInFiniteScroll: false,
                      initialPage: 1,
                    ),
                    items: [
                      ...logoImages,
                      ...logoImages,
                    ].map((url) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Image.network(
                                url,
                                fit: BoxFit.contain,
                                color: Color(0xFF666666),
                                height: 30,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String text) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: Color(0xFF333333),
            fontWeight: FontWeight.w500,
          ),
        ),
      )
          .animate(onPlay: (controller) => controller.repeat())
          .fadeIn(duration: 600.ms)
          .shimmer(duration: 1800.ms, delay: 800.ms),
    );
  }

  Widget _buildLeftContent(bool isMobile) {
    return Container(
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
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),
          SizedBox(height: 16),
          Text(
            'Streamline your efforts, generate higher quality leads, close deals efficiently, and ultimately, accelerate your business growth like never before.',
            style: GoogleFonts.inter(
              fontSize: isMobile ? 16 : 18,
              color: Color(0xFF666666),
            ),
          )
              .animate()
              .fadeIn(duration: 800.ms, delay: 200.ms)
              .slideY(begin: 0.2, end: 0),
          SizedBox(height: 32),
          MouseRegion(
            cursor: SystemMouseCursors.click,
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
          )
              .animate()
              .fadeIn(duration: 800.ms, delay: 400.ms)
              .slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }

  Widget _buildHeroImage(bool isMobile) {
    return Container(
      width: double.infinity,
      height: isMobile ? 300 : 400,
      child: Image.network(
        'https://framerusercontent.com/images/ajES5dmnyWqAlHSYD1e42adRra4.png?scale-down-to=1024',
        fit: BoxFit.contain,
      ),
    )
        .animate()
        .fadeIn(duration: 800.ms, delay: 200.ms)
        .slideX(begin: 0.2, end: 0);
  }
}
