import 'dart:io';
import 'package:advertise_it/providers/products_provider.dart';
import 'package:advertise_it/widgets/Loaders/loaders.dart';
import 'package:advertise_it/widgets/Toaster/toaster.dart';
import 'package:flutter/material.dart';
import 'package:advertise_it/themes/colors.dart';
import 'package:advertise_it/widgets/CustomText/custom_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProductBody extends StatefulWidget {
  @override
  _AddProductBodyState createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  final PageController _pageController = PageController();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String titleError = '';
  String descriptionError = '';
  String priceError = '';

  List<File> imageFiles;

  Map<String, File> images = {
    '0': null,
    '1': null,
    '2': null,
    '3': null,
  };

  Future<void> _pickImage({@required ImageSource source, String key}) async {
    File selected = await ImagePicker.pickImage(source: source);
    const kb = 1000;
    const mb = 1000 * kb;
    const max = 3;
    const maxImageSize = max * mb;

    if (selected != null) {
      if (selected.lengthSync() > maxImageSize) {
        return errorToaster(
          context,
          'The image you selected is larger than $max mb, choose another image',
        );
      }

      images[key] = selected;

      setState(() {
        imageFiles = images.values.toList();
      });
    }
  }

  Future<void> _removeImage({@required int index}) async {
    images[index.toString()] = null;

    setState(() {
      imageFiles = images.values.toList();
    });
  }

  scrollToNext() {
    return _pageController.nextPage(
        duration: Duration(seconds: 1), curve: Curves.ease);
  }

  handleSubmit(context) {
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context);
    List<File> files = images.values.where((item) => item != null).toList();

    String checkFormFields() {
      String checkTitle = validateTitle(_titleController.text);
      String checkDescription = validateDescription(
        _descriptionController.text,
      );
      String checkPrice = validatePrice(_priceController.text);

      if (checkTitle != null) {
        errorToaster(context, checkTitle);
        _pageController.animateToPage(
          0,
          duration: Duration(seconds: 1),
          curve: Curves.ease,
        );
        return checkTitle;
      }

      if (files.length < 1) {
        _pageController.animateToPage(
          1,
          duration: Duration(seconds: 1),
          curve: Curves.ease,
        );

        errorToaster(context, 'Please choose at least one image');
        return 'Please choose at least one image';
      }

      if (checkDescription != null) {
        errorToaster(context, checkDescription);
        _pageController.animateToPage(
          2,
          duration: Duration(seconds: 1),
          curve: Curves.ease,
        );
        return checkDescription;
      }

      if (checkPrice != null) {
        errorToaster(
          context,
          checkPrice,
        );
        _pageController.animateToPage(
          3,
          duration: Duration(seconds: 1),
          curve: Curves.ease,
        );
        return checkPrice;
      }

      return null;
    }

    if (checkFormFields() == null) {
      return productsProvider.createProduct(
          title: _titleController.text,
          description: _descriptionController.text,
          price: _priceController.text,
          images: files,
          context: context);
    }

    return errorToaster(
      context,
      'Please fill out all the necessary fields and try again!',
    );
  }

  String validateTitle(String value) {
    if (value.isEmpty) {
      return 'Please enter a title';
    }
    return null;
  }

  String validateDescription(String value) {
    if (value.isEmpty) {
      return 'Please enter description';
    }
    return null;
  }

  String validatePrice(String value) {
    if (value.isEmpty) {
      return 'Please enter price';
    }
    if (int.parse(value) <= 0) {
      return 'Price must be greater than zero';
    }
    if (int.parse(value) is! int) {
      return 'Price must be a valid integer';
    }

    return null;
  }

  Widget textField({
    String hintText,
    String helperText,
    String prefixText,
    TextEditingController controller,
    Function(String) validator,
    BorderSide borderSide,
    OutlineInputBorder focusedBorder,
    TextStyle style,
    int maxLines,
    TextInputType keyboardType,
  }) {
    return TextFormField(
      style: style,
      autofocus: false,
      autocorrect: true,
      maxLines: maxLines,
      validator: validator,
      cursorColor: appWhite[200],
      textAlign: TextAlign.center,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixText: prefixText,
        labelStyle: TextStyle(fontSize: 18),
        hintStyle: TextStyle(fontSize: 18),
        errorStyle: TextStyle(color: appPink),
        hintText: hintText,
        focusedBorder: focusedBorder,
        helperText: helperText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: borderSide ?? BorderSide.none,
        ),
      ),
    );
  }

  Widget handleShowImage(int index) {
    if (images[index.toString()] != null) {
      return Center(
        child: Image.file(
          images[index.toString()],
          fit: BoxFit.cover,
        ),
      );
    }
    return Center(
      child: Icon(
        Icons.cloud_upload,
        color: appPink,
        size: 100,
      ),
    );
  }

  List<Widget> buildImageButtons(int index) {
    if (images[index.toString()] == null) {
      return <Widget>[
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () => _pickImage(
            source: ImageSource.camera,
          ),
        ),
        IconButton(
          icon: Icon(Icons.photo_library),
          onPressed: () =>
              _pickImage(source: ImageSource.gallery, key: index.toString()),
        ),
      ];
    }
    return <Widget>[
      IconButton(
        icon: Icon(Icons.cancel),
        onPressed: () => _removeImage(index: index),
      ),
    ];
  }

  Widget addImageContainer(int index) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: 300,
            color: appBlack[400],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(flex: 2, child: handleShowImage(index)),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[...buildImageButtons(index)],
                      ),
                      CustomText(
                        'Tap to choose an image',
                        styleName: StyleName.caption,
                      ),
                      CustomText(
                        '(Max 2mb)',
                        styleName: StyleName.caption,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomText(
                  'You can add up to four images',
                ),
                CustomText(
                  'Scroll right to add more images',
                  styleName: StyleName.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildImageContainers() {
    List<Widget> containerList = [];

    Iterable<int>.generate(images.length).forEach((index) {
      return containerList.add(addImageContainer(index));
    });

    return (containerList);
  }

  @override
  Widget build(BuildContext context) {
    List<File> files = images.values.where((item) => item != null).toList();

    if (files.length > 0) {
      print(files);
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              section1(scrollToNext),
              section2(scrollToNext),
              section3(scrollToNext),
              section4(scrollToNext),
              section5(),
            ],
          ),
        ),
      ),
    );
  }

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
        textField(
          controller: _titleController,
          hintText: 'Choose A Nice Title',
          validator: validateTitle,
        ),
        CustomText(titleError != null ? titleError : ''),
        RaisedButton(
          child: CustomText('Next'),
          onPressed: () {
            final result = validateTitle(_titleController.text);
            if (result == null) {
              setState(() {
                titleError = '';
              });
              return nextPage();
            }
            setState(() {
              titleError = result;
            });
          },
        ),
      ],
    );
  }

  Widget section2(Function nextPage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
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
              height: 350,
              child: ListView(
                // padding: EdgeInsets.only(right: 40),
                scrollDirection: Axis.horizontal,
                children: <Widget>[...buildImageContainers()],
              ),
            ),
            RaisedButton(
              child: CustomText('Next'),
              onPressed: () {
                return nextPage();
              },
            ),
          ],
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
        textField(
          validator: validateDescription,
          controller: _descriptionController,
          hintText: 'Add a short description',
          helperText: "Maximum of 200 words",
          borderSide: BorderSide(color: appBlack[200]),
          maxLines: 3,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appBlack[200]),
          ),
        ),
        CustomText(descriptionError != null ? descriptionError : ''),
        RaisedButton(
          child: CustomText('Next'),
          onPressed: () {
            final result = validateDescription(_descriptionController.text);
            if (result == null) {
              setState(() {
                descriptionError = '';
              });
              return nextPage();
            }
            setState(() {
              descriptionError = result;
            });
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
        textField(
          validator: validatePrice,
          controller: _priceController,
          hintText: 'Price in naira eg 40000',
          helperText: "Currency must be in Naira",
          borderSide: BorderSide(color: appBlack[200]),
          keyboardType: TextInputType.number,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appBlack[200]),
          ),
          prefixText: 'N',
        ),
        CustomText(priceError != null ? priceError : ''),
        RaisedButton(
          child: CustomText('Next'),
          onPressed: () {
            final result = validatePrice(_priceController.text);
            if (result == null) {
              setState(() {
                priceError = '';
              });
              return nextPage();
            }
            setState(() {
              priceError = result;
            });
          },
        ),
      ],
    );
  }

  Widget section5() {
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context);
    final bool isSubmitting = productsProvider.isSubmiting;

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomText(
                      'Publish Now',
                      styleName: StyleName.title,
                    ),
                    SizedBox(width: 10),
                    if(isSubmitting) circleLoader(),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                onPressed: isSubmitting ? null : () => handleSubmit(context),
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
}
