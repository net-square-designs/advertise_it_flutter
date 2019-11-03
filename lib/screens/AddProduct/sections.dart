import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:advertise_it/widgets/CustomTextField/custom_text_field.dart';
import 'package:flutter/material.dart';

Widget section1(Function nextPage) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
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
      RaisedButton(
        child: CustomText('Next'),
        onPressed: () {
          return nextPage();
        },
      ),
    ],
  );
}

Widget section2(Function nextPage) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
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
              onPressed: () {
                // return nextPage();
              },
            ),
            CustomText(
              'Tap to choose an image',
              styleName: StyleName.subhead,
            ),
            CustomText(
              '(Max 2mb)',
              styleName: StyleName.caption,
            ),
          ],
        ),
      ),
      Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            CustomText(
              'You can add up to four images',
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Add another Image'),
              color: appBlack[300],
            ),
          ],
        ),
      ),
      RaisedButton(
        child: CustomText('Next'),
        onPressed: () {
          return nextPage();
        },
      ),
    ],
  );
}

Widget section3(Function nextPage) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      CustomText(
        'Let\'s give it a short and nice description',
        styleName: StyleName.headline,
      ),
      SizedBox(
        height: 20,
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
      RaisedButton(
        child: CustomText('Next'),
        onPressed: () {
          return nextPage();
        },
      ),
    ],
  );
}

Widget section4(Function nextPage) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      CustomText(
        'Let\'s give this product a price',
        styleName: StyleName.headline,
      ),
      SizedBox(
        height: 20,
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
      RaisedButton(
        child: CustomText('Next'),
        onPressed: () {
          return nextPage();
        },
      ),
    ],
  );
}

Widget section5() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      CustomText(
        'Great, you\'re all done, would you like to publish so everyone can see it right away?',
        styleName: StyleName.headline,
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: CustomText(
                'Publish Now',
                styleName: StyleName.title,
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
              onPressed: () {},
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: CustomText(
                'Save as draft',
                styleName: StyleName.title,
              ),
              padding: EdgeInsets.symmetric(vertical: 10),
              color: appBlack[400],
              onPressed: () {},
              elevation: 4,
            ),
          ),
        ],
      ),
    ],
  );
}
