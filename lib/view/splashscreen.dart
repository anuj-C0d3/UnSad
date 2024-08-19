import 'package:flutter/material.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Image.network("https://play-lh.googleusercontent.com/YNBUh-8PzcAXryawZ559rEUDowEOgXsPDfTDBOi4AQQR6NTsWGvYTU1tMRctN3uoRqw8=w480-h960-rw",width: 300,height: 300,),
          SizedBox(height: 10,),
           Text("UnsAd App"
          , style: TextStyle(fontSize: 35,fontWeight: FontWeight.w700)
            ),
        ],
      )),
    );
  }
}
