// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class Netflix extends StatefulWidget {
  const Netflix({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Netflix> createState() => _NetflixState();
}

class _NetflixState extends State<Netflix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header com imagem de destaque
            Stack(
              children: [
                // Imagem de capa
                Container(
                  height: 500,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://i0.wp.com/cromossomonerd.com.br/wp-content/uploads/2018/01/john-wick-2-guns.jpg?fit=2560%2C1440&ssl=1',
                    fit: BoxFit.cover,
                  ),
                ),
                // Gradiente sobre a imagem
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                        Colors.black,
                      ],
                    ),
                  ),
                ),
                // Botões e informações
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        'JOHN WICK 4',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildButton(
                            icon: Icons.play_arrow,
                            label: 'Play',
                            primary: true,
                          ),
                          SizedBox(width: 10),
                          _buildButton(
                            icon: Icons.info_outline,
                            label: 'Mais informações',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Seção "Trending Now"
            _buildSection(
              'Trending Now',
              [
                'https://play-lh.googleusercontent.com/uIMIR71zaEewGovu-smVeC78xR-V6KkYS666L9HIR3VXO9NIFJrnOhJySipmy_gCs84grT9xy2xzW-Lpahat=w240-h480-rw',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3YMeAA78WnJ0affrbxxa7ly4RUvnSyr_rOQ&s',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpu8EVQeFD7Sh1QjEepTV13w32V85C3iYkjw&s',
              ],
            ),

            // Seção "Continue Watching"
            _buildSection(
              'Continue Watching',
              [
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpu8EVQeFD7Sh1QjEepTV13w32V85C3iYkjw&s',
                'https://play-lh.googleusercontent.com/uIMIR71zaEewGovu-smVeC78xR-V6KkYS666L9HIR3VXO9NIFJrnOhJySipmy_gCs84grT9xy2xzW-Lpahat=w240-h480-rw',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3YMeAA78WnJ0affrbxxa7ly4RUvnSyr_rOQ&s',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    bool primary = false,
  }) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: primary ? Colors.black : Colors.white,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: primary ? Colors.black : Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: primary ? Colors.white : Colors.white24,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }

  Widget _buildSection(String title, List<String> imageUrls) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            title,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Container(
                width: 120,
                margin: EdgeInsets.only(left: index == 0 ? 16 : 8, right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(imageUrls[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
