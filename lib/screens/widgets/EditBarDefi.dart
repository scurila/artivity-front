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

            IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.upload_file)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.download)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.send)),
          ],
        )
    );
  }
}
