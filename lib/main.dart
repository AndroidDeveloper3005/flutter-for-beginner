import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final String appTitle = "Text Input With Validation.";
    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }

}
// Create a Form widget.
class MyCustomForm extends StatefulWidget{
  @override
  MyCustomFormState  createState() {
    // TODO: implement createState
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm>{
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return "Please enter some text";
              }else{
                return null;
              }
            },

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: (){
                if(_formKey.currentState.validate()){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data'),
                  )
                  );
                }
              },
              child: Text('Submit'),
            ),

          ),
        ],
        
        ),
    );
  }

}

