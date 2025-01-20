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

    // Melhorando os breakpoints
    final isMobile = screenWidth < 640;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024;

    // Ajustando paddings responsivos
    final horizontalPadding = isDesktop
        ? 120.0
        : isTablet
            ? 60.0
            : 24.0;

    // Ajustando tamanhos de fonte responsivos
    final titleSize = isDesktop
        ? 48.0
        : isTablet
            ? 40.0
            : 32.0;

    final subtitleSize = isDesktop
        ? 18.0
        : isTablet
            ? 16.0
            : 14.0;

    final buttonTextSize = isDesktop ? 18.0 : 16.0;

    // Ajustando espaçamentos
    final verticalSpacing = isDesktop
        ? 60.0
        : isTablet
            ? 40.0
            : 24.0;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 1440, // Máxima largura para telas muito grandes
          ),
          padding: EdgeInsets.only(
              top: isMobile ? 48.0 : 32.0), // Padding superior adicional
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
                  vertical: verticalSpacing * 0.4,
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
                  vertical: verticalSpacing,
                ),
                child: !isMobile
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: isDesktop ? 1 : 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AdVantage: Propel Your Marketing & Sales to New Heights!',
                                  style: GoogleFonts.inter(
                                    fontSize: titleSize,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF333333),
                                    height: 1.2,
                                  ),
                                ),
                                SizedBox(height: verticalSpacing * 0.5),
                                Text(
                                  'Streamline your efforts, generate higher quality leads, close deals efficiently, and ultimately, accelerate your business growth like never before.',
                                  style: GoogleFonts.inter(
                                    fontSize: subtitleSize,
                                    color: Color(0xFF666666),
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: verticalSpacing),
                                _buildStartProjectButton(
                                    isMobile, buttonTextSize),
                              ],
                            ),
                          ),
                          SizedBox(width: horizontalPadding),
                          // Imagem hero
                          Expanded(
                            flex: isDesktop ? 1 : 1,
                            child: _buildHeroImage(isMobile, isTablet),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          // Versão mobile com textos centralizados
                          Text(
                            'AdVantage: Propel Your Marketing & Sales to New Heights!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: titleSize,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: verticalSpacing * 0.5),
                          Text(
                            'Streamline your efforts, generate higher quality leads, close deals efficiently, and ultimately, accelerate your business growth like never before.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: subtitleSize,
                              color: Color(0xFF666666),
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: verticalSpacing),
                          _buildStartProjectButton(isMobile, buttonTextSize),
                          SizedBox(height: verticalSpacing),
                          _buildHeroImage(isMobile, isTablet),
                        ],
                      ),
              ),

              // Carrossel de logos com animação mais rápida
              Container(
                margin: EdgeInsets.symmetric(vertical: verticalSpacing),
                height: 30,
                child: Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 30,
                        autoPlay: true,
                        viewportFraction: isMobile
                            ? 0.4
                            : isTablet
                                ? 0.25
                                : 0.15,
                        enlargeCenterPage: false,
                        autoPlayInterval: Duration(milliseconds: 0),
                        scrollPhysics: NeverScrollableScrollPhysics(),
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
                        autoPlayCurve: Curves.linear,
                        pauseAutoPlayInFiniteScroll: false,
                        initialPage: 0,
                        reverse: false,
                      ),
                      items: [
                        ...logoImages,
                        ...logoImages,
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
                  ],
                ),
              ),
            ],
          ),
        ),

        // Menu mobile overlay
        if (isMobile && _isMenuOpen)
          Positioned.fill(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _isMenuOpen ? 1.0 : 0.0,
              child: Container(
                color: Colors.white,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 16,
                          bottom: 24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              'https://framerusercontent.com/images/tUOOSLf6vrSzJqB1hRIAseDuXjk.png?scale-down-to=512',
                              height: 28,
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => setState(() => _isMenuOpen = false),
                              child: StatefulBuilder(
                                builder: (context, setState) {
                                  bool isHovered = false;
                                  return MouseRegion(
                                    onEnter: (_) =>
                                        setState(() => isHovered = true),
                                    onExit: (_) =>
                                        setState(() => isHovered = false),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Icon(
                                        Icons.close,
                                        size: 24,
                                        color: isHovered
                                            ? Color(0xFF666666)
                                            : Color(0xFF333333),
                                      ),
                                    ),
                                  );
                                },
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
                      ]
                          .map((text) => StatefulBuilder(
                                builder: (context, setState) {
                                  bool isHovered = false;
                                  return MouseRegion(
                                    onEnter: (_) =>
                                        setState(() => isHovered = true),
                                    onExit: (_) =>
                                        setState(() => isHovered = false),
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        setState(() {
                                          _isMenuOpen = false;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: isHovered ? 28 : 24,
                                          vertical: 16,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isHovered
                                              ? Color(0xFFF5F5F5)
                                              : Colors.transparent,
                                        ),
                                        child: Text(
                                          text,
                                          style: GoogleFonts.inter(
                                            color: isHovered || text == 'Home'
                                                ? Color(0xFF333333)
                                                : Color(0xFF666666),
                                            fontWeight:
                                                isHovered || text == 'Home'
                                                    ? FontWeight.w600
                                                    : FontWeight.w500,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ))
                          .toList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildNavItem(String text, bool isActive) {
    return Material(
      color: Colors.transparent,
      child: StatefulBuilder(
        builder: (context, setState) {
          bool isHovered = false;
          return MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: isHovered ? 14 : 12,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isHovered || isActive
                        ? Color(0xFF333333)
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                text,
                style: GoogleFonts.inter(
                  color: isHovered || isActive
                      ? Color(0xFF333333)
                      : Color(0xFF666666),
                  fontWeight:
                      isHovered || isActive ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContactButton() {
    return Material(
      color: Colors.transparent,
      child: StatefulBuilder(
        builder: (context, setState) {
          bool isHovered = false;
          return MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: isHovered ? Color(0xFF333333) : Color(0xFFFFF9C4),
                borderRadius: BorderRadius.circular(50),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ]
                    : [],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isHovered ? 34 : 32,
                vertical: isHovered ? 14 : 12,
              ),
              child: Text(
                'Contact',
                style: GoogleFonts.inter(
                  color: isHovered ? Colors.white : Color(0xFF333333),
                  fontWeight: isHovered ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMobileMenu() {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovered = false;
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _isMenuOpen = true;
              });
            },
            child: Padding(
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
                            color: isHovered
                                ? Color(0xFF666666)
                                : Color(0xFF333333),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        )),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStartProjectButton(bool isMobile, double fontSize) {
    return Material(
      color: Colors.transparent,
      child: StatefulBuilder(
        builder: (context, setState) {
          bool isHovered = false;
          return MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: isHovered ? Color(0xFF333333) : Color(0xFFFFF9C4),
                borderRadius: BorderRadius.circular(50),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ]
                    : [],
              ),
              padding: EdgeInsets.symmetric(
                horizontal:
                    isMobile ? (isHovered ? 34 : 32) : (isHovered ? 50 : 48),
                vertical: isHovered ? 18 : 16,
              ),
              child: Text(
                'Start Project',
                style: GoogleFonts.inter(
                  color: isHovered ? Colors.white : Color(0xFF333333),
                  fontWeight: isHovered ? FontWeight.w600 : FontWeight.w500,
                  fontSize: fontSize,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeroImage(bool isMobile, bool isTablet) {
    return Container(
      width: double.infinity,
      height: isMobile
          ? 300
          : isTablet
              ? 350
              : 400,
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
