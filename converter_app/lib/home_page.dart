import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double exchangeRate = 280.34;
  double result = 0;

  var inputController = TextEditingController();

  bool isUsdToPkrMode = true;

  void convert(){
    String input = inputController.text.trim();
    if(input.isEmpty){
      setState(() {
        result = 0;
      });
    } else {
      double numericInput = double.parse(input);
      setState(() {
        if(isUsdToPkrMode){
          result = numericInput * exchangeRate;
        } else {
          result = numericInput / exchangeRate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.70,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FittedBox(child: Text("${isUsdToPkrMode ? "PKR" : "USD"} ${result.toStringAsFixed(2)}", style: TextStyle(fontSize: 36))),
                  SizedBox(height: 46,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("USD"),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isUsdToPkrMode = !isUsdToPkrMode;
                              double temp = result;
                              String inputValue =inputController.text.trim();
                              if(inputValue.isEmpty){
                                result = 0;
                              } else{
                                result = double.parse(inputValue);
                              }
                              inputController.text = temp.toStringAsFixed(2);
                            });
                          },
                          icon: Icon(isUsdToPkrMode ? Icons.keyboard_double_arrow_right : Icons.keyboard_double_arrow_left),
                        ),
                      ),
                      Text("PKR"),
                    ],
                  ),
                  SizedBox(height: 46,),
                  TextField(
                    controller: inputController,
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      convert();
                    },
                    // onSubmitted: (value){
                    //   convert();
                    // },
                    // when done or submit button on keybord is pressed
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: "Value in ${isUsdToPkrMode ? "USD" : "PKR"}",
                      // helperText: "Some description",
                      suffixIcon: IconButton(
                        onPressed: () {
                          inputController.clear();
                          convert();
                        },
                        icon: Icon(Icons.close),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
