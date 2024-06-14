import 'package:flutter/material.dart';

class CardModul extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double width;
  final double? height;
  final bool isLoading = false;

  const CardModul({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.width = 241,
    this.height,

  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: width,
      height:height,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0xFFECF3F6),
            blurRadius: 15,
            offset: Offset(0, 15),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image.isEmpty
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(
                    right: 18.5,
                    left: 18.5,
                    top: 18,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image,
                      width: double.infinity,
                    ),
                  ),
                ),
          const SizedBox(
            height: 8.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Gilroy-Bold',
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subtitle.isEmpty ? "Tidak ada desekripsi" : subtitle ,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Gilroy',
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
