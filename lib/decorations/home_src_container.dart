import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.title,
    required this.image,
    this.navigate,
  }) : super(key: key);

  final String title;
  final String image;
  // ignore: prefer_typing_uninitialized_variables
  final  navigate;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // color: Colors.deepPurple[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              image, // image
              height: 50,
              width: 50,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.indigo[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => navigate,
                  ),
                );
              },
                
              child: Text(
                title, // title
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          // Text(title),
        ],
      ),
    );
  }
}
