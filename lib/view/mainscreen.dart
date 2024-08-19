import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unsad/controller/FetchMeme.dart';
import 'package:unsad/controller/SharedData.dart';
class mainscreen extends StatefulWidget {
  const mainscreen({super.key});
  @override
  State<mainscreen> createState() => _mainscreenState();



}


class _mainscreenState extends State<mainscreen> {
  String url = "";
  int? memeNo =0;

  bool isLoading = true;
  @override
  void initState() {
    UpdateImg();
    super.initState();
    UpdateMemeNum();

  }
  void UpdateMemeNum() async {
    memeNo = await SharedData.fetchData()??0;
    setState(() {

    });
  }
  void UpdateImg() async {
    String link = await Fetchmeme.fetchnewMeme();
    setState(() {
      url = link;
      isLoading = false;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 120,),
            const Text("Welcome to new meme",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.pink),),
            SizedBox(

              height: 20,
            ),
                 isLoading?

                     Container(

                       height: 300,
                       width: MediaQuery.of(context).size.width,
                       child: Center(
                         child: SizedBox(

                           width: 50,
                           height: 50,
                           child: CircularProgressIndicator(color: Colors.blue,),
                         ),
                       ),
                     )
                 :
                 Image.network(
                     height: 300,
                     width: MediaQuery.of(context).size.width,
                     url),
            SizedBox(
              height: 20,
            ),
             Text(
               "MEme #$memeNo",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blue),
            ),
            ElevatedButton(
              onPressed: () async {
                UpdateImg();
                isLoading = true;
                await SharedData.saveData(memeNo!+1);
                UpdateMemeNum();
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue),),
              child: Container(
                height: 50,
                width: 150,
                color: Colors.transparent,
                child: const Center(
                  child: Text(
                    "Next Meme",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text("App created by",
              style: TextStyle(fontSize: 17,color: Colors.black26,fontStyle: FontStyle.italic),),
            Text("Anuj Vishwakarma",style: TextStyle(fontSize: 17,color: Colors.black45,fontStyle: FontStyle.italic))
          ],
        ),
      ),
    );
  }
}
