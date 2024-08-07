
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main(){
  runApp(FlutterApp());
}
class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "R A H",
      theme:ThemeData(
          primarySwatch:Colors.purple,
          textTheme: TextTheme(
            headlineLarge: TextStyle(fontFamily:'playwrite'),
          )
      ),
      home:HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<HomePage> {
  TimeOfDay? texttime;
  DateTime? _textdate;
  void pickdate (){
    showDatePicker(
        context: context,
        firstDate: DateTime(1950),
        lastDate:DateTime(2019)
    ).then((value){
      setState(() {
        _textdate = value!;
      });
    });
  }
  void pickTime(){
    showTimePicker(context: context,
      initialTime: TimeOfDay.now(),
    ).then((value){
      setState(() {
        texttime =value!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade50,
        title: Center(child: Text("H O M E")),
      ),
      body:
      Column(
        children: [
          Text(
            _textdate!=null
                ? DateFormat('yMMMd').format(_textdate!)
                :'No date Selected',
            style: const TextStyle(fontSize: 30),),
          Text(
            texttime!=null
                ? DateFormat.jm().format(DateTime(
                0, 0, 0, texttime!.hour,texttime!.minute))
                :'No Time Selected',
            style: const TextStyle(fontSize: 30),),
          Text("Current time: ${DateFormat('jms').format(time)}", style: TextStyle(fontSize: 25)),
          Text("Current Date: ${DateFormat('yMMMd').format(time)}"),
          Text(" weekday: ${DateFormat('EEEE').format(time)}"),
          Container(height: 20,),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor:WidgetStateProperty.all<Color>(Colors.purple),),
              onPressed: () {
                setState((){
                }
                );
              }, child: Text("Current time",style: TextStyle(color:Colors.white),),
            ),
          ),
          ElevatedButton(
            onPressed: pickdate,
            child: Text("Enter Date of Birth"),
          ),
          Container(height:20,),
          ElevatedButton(
            onPressed:pickTime,
            child: Text("Enter Time"),
          ),
        ],
      ),
    );
  }
}


