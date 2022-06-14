import 'package:flutter/material.dart';
import 'package:kamsya/configs/all_configs.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/services.dart';

class FormInputText extends StatelessWidget {
  FormInputText(
    this.title, {
    this.text,
    this.txtController,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? text;
  final TextEditingController? txtController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: myText.copyWith(fontWeight: FontWeight.w300)),
        TextFormField(
          controller: txtController,
          decoration: InputDecoration(
            labelText: text,
            // filled: true,
            // fillColor: Colors.yellow,
            contentPadding: EdgeInsets.only(right: 10, top: 3),
            isDense: true,
          ),
          validator: (text) => text!.trim().isEmpty ? kFieldNullError : null,
        ),
        SizedBox(height: 15)
      ],
    );
  }
}

// class FormInputNumber extends StatelessWidget {
//   const FormInputNumber(
//     this.label, {
//     this.txtController,
//     Key? key,
//   }) : super(key: key);

//   final String label;
//   final TextEditingController? txtController;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: myText.copyWith(fontWeight: FontWeight.w300)),
//         TextFormField(
//           controller: txtController,
//           keyboardType: TextInputType.number,
//           decoration: InputDecoration(
//             // filled: true,
//             // fillColor: Colors.yellow,
//             contentPadding: EdgeInsets.only(right: 10, top: 3),
//             isDense: true,
//           ),
//           validator: (text) => text!.trim().isEmpty ? kFieldNullError : null,
//         ),
//         SizedBox(height: 15)
//       ],
//     );
//   }
// }

class FormInputCurr extends StatelessWidget {
  FormInputCurr(
    this.title, {
    this.text,
    this.txtController,
    Key? key,
  }) : super(key: key);

  final String title;
  final String? text;
  final TextEditingController? txtController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: myText.copyWith(fontWeight: FontWeight.w300)),
        TextFormField(
          controller: txtController,
          inputFormatters: <TextInputFormatter>[
            CurrencyTextInputFormatter(
              locale: 'id',
              symbol: 'Rp ',
              decimalDigits: 0,
            )
          ],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: text,
            // filled: true,
            // fillColor: Colors.yellow,
            contentPadding: EdgeInsets.only(right: 10, top: 3),
            isDense: true,
          ),
          validator: (text) => text!.trim().isEmpty ? kFieldNullError : null,
        ),
        SizedBox(height: 15)
      ],
    );
  }
}

class FormInputHidden extends StatelessWidget {
  FormInputHidden(
    this.txtController,
    this.id, {
    Key? key,
  }) : super(key: key);

  final TextEditingController? txtController;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: TextFormField(
        controller: txtController,
        decoration: InputDecoration(labelText: id),
      ),
    );
  }
}

class FormInputSearch extends StatefulWidget {
  FormInputSearch(
    this.isSearch,
    this.searchFocusNode,
    this.title, {
    this.text,
    this.txtController,
    Key? key,
  }) : super(key: key);

  final FocusNode searchFocusNode;
  final bool isSearch;
  final String title;
  final String? text;
  final TextEditingController? txtController;

  @override
  _FormInputSearchState createState() => _FormInputSearchState();
}

class _FormInputSearchState extends State<FormInputSearch> {
  // FocusNode searchFocusNode = FocusNode();

  @override
  void dispose() {
    widget.searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 2),
      child: TextFormField(
        controller: widget.txtController,
        focusNode: widget.searchFocusNode,
        decoration: InputDecoration(
            labelText: widget.text,
            // filled: true,
            // fillColor: Colors.yellow,
            // contentPadding: EdgeInsets.only(right: 10, top: 3),
            isDense: true,
            suffixIcon: (widget.isSearch)
                ? InkWell(onTap: () {}, child: Icon(Icons.clear))
                : InkWell(onTap: () {}, child: Icon(Icons.check))),
      ),
    );
  }
}
