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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> logoImages = [
    'https://framerusercontent.com/images/ZrQngLHLSVrmCi9Jog3LkyFNcI.png?scale-down-to=512',
    'https://framerusercontent.com/images/iSftT2JXqVgfLxuEHrIccSOoM.png?scale-down-to=512',
    'https://framerusercontent.com/images/A0ucPhuKWqwUhwz49SlzMfSVYk.png?scale-down-to=512',
  ];
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final horizontalPadding = screenWidth > 1200 ? 120.0 : 24.0;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE8F4FF),
                Color(0xFFFFFDE7),
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [0.0, 0.3, 0.6, 1.0],
            ),
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 24,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Logo (alinhado à esquerda)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.network(
                        'https://framerusercontent.com/images/tUOOSLf6vrSzJqB1hRIAseDuXjk.png?scale-down-to=512',
                        height: 28,
                      )
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .slideX(begin: -0.2, end: 0),
                    ),

                    // Menu centralizado
                    if (!isMobile)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildNavItem('Home', true),
                          SizedBox(width: 40),
                          _buildNavItem('About', false),
                          SizedBox(width: 40),
                          _buildNavItem('Services', false),
                        ],
                      ),

                    // Contact button ou Menu mobile (alinhado à direita)
                    Align(
                      alignment: Alignment.centerRight,
                      child:
                          isMobile ? _buildMobileMenu() : _buildContactButton(),
                    ),
                  ],
                ),
              ),

              // Hero Section
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: isMobile ? 24 : 60,
                ),
                child: !isMobile
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Conteúdo da esquerda
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AdVantage: Propel Your Marketing & Sales to New Heights!',
                                  style: GoogleFonts.inter(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF333333),
                                    height: 1.2,
                                  ),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  'Streamline your efforts, generate higher quality leads, close deals efficiently, and ultimately, accelerate your business growth like never before.',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    color: Color(0xFF666666),
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: 40),
                                _buildStartProjectButton(isMobile),
                              ],
                            ),
                          ),
                          SizedBox(width: 40),
                          // Imagem hero
                          Expanded(
                            child: _buildHeroImage(isMobile),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          // Título centralizado
                          Text(
                            'AdVantage: Propel Your Marketing & Sales to New Heights!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 24),
                          // Subtítulo centralizado
                          Text(
                            'Streamline your efforts, generate higher quality leads, close deals efficiently, and ultimately, accelerate your business growth like never before.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Color(0xFF666666),
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 32),
                          // Botão centralizado
                          _buildStartProjectButton(isMobile),
                          SizedBox(height: 40),
                          // Imagem
                          _buildHeroImage(isMobile),
                        ],
                      ),
              ),

              // Carrossel de logos com animação mais rápida
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                height: 30,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 30,
                    autoPlay: true,
                    viewportFraction: isMobile ? 0.4 : 0.15,
                    enlargeCenterPage: false,
                    autoPlayInterval: Duration(milliseconds: 0),
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    autoPlayAnimationDuration:
                        Duration(milliseconds: 800), // Mais rápido
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
                          child: Image.network(
                            url,
                            fit: BoxFit.contain,
                            color: Color(0xFF666666),
                            height: 20,
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

        // Menu mobile overlay
        if (isMobile && _isMenuOpen)
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          'https://framerusercontent.com/images/tUOOSLf6vrSzJqB1hRIAseDuXjk.png?scale-down-to=512',
                          height: 28,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => setState(() => _isMenuOpen = false),
                            child: Icon(Icons.close, size: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  ...[
                    'Home',
                    'About',
                    'Services',
                    'Contact',
                  ].map((text) => InkWell(
                        onTap: () {
                          setState(() => _isMenuOpen = false);
                          // Adicionar navegação aqui
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          child: Text(
                            text,
                            style: GoogleFonts.inter(
                              color: text == 'Home'
                                  ? Color(0xFF333333)
                                  : Color(0xFF666666),
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.1, end: 0),
          ),
      ],
    );
  }

  Widget _buildNavItem(String text, bool isActive) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {},
        hoverColor: Colors.transparent,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: Text(
            text,
            style: GoogleFonts.inter(
              color: isActive ? Color(0xFF333333) : Color(0xFF666666),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        )
            .animate(
              onPlay: (controller) => controller.repeat(),
            )
            .shimmer(
              duration: 1200.ms,
              delay: 200.ms,
            ),
      ),
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _buildContactButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {},
        hoverColor: Colors.transparent,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFF9C4),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              child: Text(
                'Contact',
                style: GoogleFonts.inter(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
            .animate(
              onPlay: (controller) => controller.repeat(),
            )
            .shimmer(
              duration: 1200.ms,
              delay: 200.ms,
            ),
      ),
    );
  }

  Widget _buildMobileMenu() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isMenuOpen = true;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                3,
                (index) => Container(
                      width: 24,
                      height: 2,
                      margin: EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: Color(0xFF333333),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    )),
          ),
        )
            .animate(
              onPlay: (controller) => controller.repeat(),
            )
            .shimmer(
              duration: 1200.ms,
              delay: 200.ms,
            ),
      ),
    );
  }

  Widget _buildStartProjectButton(bool isMobile) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {},
        hoverColor: Colors.transparent,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFF9C4),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 32 : 48,
                vertical: 16,
              ),
              child: Text(
                'Start Project',
                style: GoogleFonts.inter(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w500,
                  fontSize: isMobile ? 16 : 18,
                ),
              ),
            ),
          ),
        )
            .animate(
              onPlay: (controller) => controller.repeat(),
            )
            .shimmer(
              duration: 1200.ms,
              delay: 200.ms,
            ),
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
