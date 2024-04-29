import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralNews extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String dateTime;
  final String source;
  const GeneralNews(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.dateTime,
      required this.source});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              height: height * .18,
              width: width * .3,
              placeholder: (context, url) => Container(
                child: const Center(
                  child: SpinKitFadingCircle(
                    color: Colors.amber,
                    size: 50,
                  ),
                ),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: Colors.red),
            ),
          ),
          Expanded(
            child: Container(
              height: height * .18,
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Text(
                    title,
                    maxLines: 3,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          source,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        dateTime,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
