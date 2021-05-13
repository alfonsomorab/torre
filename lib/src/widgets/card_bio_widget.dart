import 'package:flutter/material.dart';
import 'package:torre/src/models/people_models.dart';
import 'package:torre/src/theme/theme.dart';

class CardBio extends StatelessWidget {

  final Bio bio;
  final int index;

  const CardBio( {
    @required this.bio,
    @required this.index
  } );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          TopCardBio(bio: bio),

          SkillsSection(bio: bio),

          OpenToSection( bio: bio ),

        ]
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xFF28292d),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
      ),
      padding: EdgeInsets.all(15.0),
    );
  }
}

class TopCardBio extends StatelessWidget {
  const TopCardBio({
    Key key,
    @required this.bio,
  }) : super(key: key);

  final Bio bio;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(

        title: Text(bio.name,
          style: TextStyle(
            fontSize: 18,
            color: myTheme.accentColor,
          ),
        ),
        subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text( bio.professionalHeadline,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text( bio.locationName,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ]
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.network(
            bio.picture != null ? bio.picture : 'https://t4.ftcdn.net/jpg/02/15/84/43/240_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg',
            height: 80,
            fit: BoxFit.cover,
          ),
        ),

      ),

    );
  }


}

class OpenToSection extends StatelessWidget{
  const OpenToSection({
    Key key,
    @required this.bio,
  }) : super(key: key);

  final Bio bio;

  @override
  Widget build(BuildContext context) {

    if (bio.openTo.length > 0)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text('Open to:'),
            padding: EdgeInsets.only(left: 5, top: 15),
          ),
          SizedBox(
            height: 50,
            child:
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bio.openTo.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                  ),
                  child: Center(child: Text(bio.openTo[index])),
                );
              },
            ),
          ),
        ],
      );
    else
      return Container();
  }
}

class SkillsSection extends StatelessWidget{
  const SkillsSection({
    Key key,
    @required this.bio,
  }) : super(key: key);

  final Bio bio;

  @override
  Widget build(BuildContext context) {

    if (bio.skills.length > 0)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 5, top: 15),
            child: Text('Skills:')
          ),
          SizedBox(
            height: 50,
            child:
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bio.skills.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                  ),
                  child: Center(child: Text(bio.skills[index].name)),
                );
              },
            ),
          ),
        ],
      );
    else
      return Container();
  }
}

