import 'package:flutter/material.dart';

class EditBarDefi extends StatelessWidget {
  const EditBarDefi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline)),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
            IconButton(onPressed: (){}, icon: Icon(Icons.upload_file)),
            IconButton(onPressed: (){}, icon: Icon(Icons.download)),
            IconButton(onPressed: (){}, icon: Icon(Icons.send)),
          ],
        )
    );
  }
}
