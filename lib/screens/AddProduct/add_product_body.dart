import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/CustomTextField/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddProductBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Center(
        child: ListView(
          children: <Widget>[
            CustomText(
              'What do you want to sell?',
              styleName: StyleName.headline,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Choose A Nice Title',
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              'Let\'s add a few images',
              styleName: StyleName.headline,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: 300,
              color: appBlack[400],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.cloud_upload),
                    color: appPink,
                    iconSize: 100,
                    onPressed: () {},
                  ),
                  CustomText(
                    'Tap to choose an image',
                    styleName: StyleName.subhead,
                  ),
                  CustomText(
                    '(Max 2mb)',
                    styleName: StyleName.caption,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     IconButton(icon: Icon(Icons.add_a_photo), iconSize: 40, onPressed: (){},),
                  //     IconButton(icon: Icon(Icons.add_photo_alternate), iconSize: 40, onPressed: (){}, color: appPink,)
                  //   ],
                  // )
                ],
              ),
            ),
            Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    child: Text('Add another Image'),
                    color: appBlack[300],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              'Let\'s give it a short and nice description',
              styleName: StyleName.headline,
            ),
            TextField(
              cursorColor: appWhite[200],
              textCapitalization: TextCapitalization.words,
              textAlign: TextAlign.center,
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: 'Add a short description',
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                  labelStyle: TextStyle(fontSize: 18, color: appPink),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: appBlack[200])),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: appBlack[200])),
                  helperText: "Maximum of 200 words"),
              style: TextStyle(fontSize: 18, color: appWhite[100]),
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              'Let\'s give this product a price',
              styleName: StyleName.headline,
            ),
            TextField(
              cursorColor: appWhite[200],
              textCapitalization: TextCapitalization.words,
              textAlign: TextAlign.center,
              maxLength: 11,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.continueAction,
              decoration: InputDecoration(
                  prefixText: 'N',
                  suffixStyle: const TextStyle(color: Colors.green),
                  hintText: 'Price in naira eg 40000',
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                  labelStyle: TextStyle(fontSize: 18, color: appPink),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: appBlack[200])),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: appBlack[200])),
                  helperText: "Currency must be in Naira"),
              style: TextStyle(fontSize: 18, color: appWhite[100]),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Next'),
            ),
            RaisedButton(
              onPressed: () {},
              child: CustomText('Publish Product', styleName: StyleName.title,),
              padding: EdgeInsets.all(15),
            ),
          ],
        ),
      ),
    );
  }
}
