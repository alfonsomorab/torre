import 'package:flutter/material.dart';
import 'package:torre/src/models/people_models.dart';

import 'card_bio_widget.dart';

class BiosListWidget extends StatelessWidget {

  final List<Bio> bios;

  const BiosListWidget( this.bios );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bios.length,
      itemBuilder: (BuildContext context, int index){
        return CardBio(
            bio : bios[index],  index: index
        );
      },
    );
  }
}
