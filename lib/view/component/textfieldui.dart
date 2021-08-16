import 'package:cov_app_flutter/model/static/size.dart';
import 'package:flutter/material.dart';

class TextFieldUi extends StatelessWidget {
  final String label;
  final String text;
  final Function press;
  const TextFieldUi({Key key, this.label, this.text, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, bottom: 8),
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Product Sans',
                fontSize: 15,
                color: Color(0xff8f9db5),
              ),
            ),
          ),
        ),
        //
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
          child: TextFormField(
            obscureText: label == 'Password' ? true : false,
            // this can be changed based on usage -
            // such as - onChanged or onFieldSubmitted
            onChanged: press,
            style: TextStyle(
                fontSize: 19,
                color: Color(0xff0962ff),
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: text,
              hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[350],
                  fontWeight: FontWeight.w600),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              focusColor: Color(0xff0962ff),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Color(0xff0962ff)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.grey[350],
                ),
              ),
              // will turn the visibility of the 'checkbox' icon
              // ON or OFF based on the condition we set before
            ),
          ),
        ),
        //
      ],
    );
  }
}

// class TextFieldUi extends StatelessWidget {
//   final String text;
//   final String label;
//   final Function press;
//   const TextFieldUi({Key key, this.label, this.text, this.press})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(
//           horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding * 0.5),
//       padding: EdgeInsets.only(left: kDefaultPadding),
//       decoration: BoxDecoration(
//           color: Color(0XFFEFF3F6),
//           borderRadius: BorderRadius.circular(100.0),
//           boxShadow: [
//             BoxShadow(
//                 color: Color.fromRGBO(0, 0, 0, 0.1),
//                 offset: Offset(6, 2),
//                 blurRadius: 6.0,
//                 spreadRadius: 3.0),
//             BoxShadow(
//                 color: Color.fromRGBO(0, 0, 0, 0.1),
//                 offset: Offset(-6, -2),
//                 blurRadius: 6.0,
//                 spreadRadius: 3.0)
//           ]),
//       child: TextField(
//         onChanged: press,
//         style: TextStyle(fontSize: 16, color: Colors.grey),
//         decoration: InputDecoration(
//             border: InputBorder.none,
//             labelText: '$label',
//             hintText: text,
//             contentPadding: EdgeInsets.symmetric(vertical: 15)),
//       ),
//     );
//   }
// }

class MyCustomInputBox extends StatefulWidget {
  final String label;
  final String inputHint;

  MyCustomInputBox({this.label, this.inputHint});
  @override
  _MyCustomInputBoxState createState() => _MyCustomInputBoxState();
}

class _MyCustomInputBoxState extends State<MyCustomInputBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, bottom: 8),
            child: Text(
              widget.label,
              style: TextStyle(
                fontFamily: 'Product Sans',
                fontSize: 15,
                color: Color(0xff8f9db5),
              ),
            ),
          ),
        ),
        //
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
          child: TextFormField(
            obscureText: widget.label == 'Password' ? true : false,
            // this can be changed based on usage -
            // such as - onChanged or onFieldSubmitted
            onChanged: (value) {
              setState(() {});
            },
            style: TextStyle(
                fontSize: 19,
                color: Color(0xff0962ff),
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              hintText: widget.inputHint,
              hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[350],
                  fontWeight: FontWeight.w600),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              focusColor: Color(0xff0962ff),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Color(0xff0962ff)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.grey[350],
                ),
              ),
              // will turn the visibility of the 'checkbox' icon
              // ON or OFF based on the condition we set before
            ),
          ),
        ),
        //
      ],
    );
  }
}
