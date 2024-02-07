import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Positioned Modal Bottom Sheet'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Stack(
                      children: [
                        Positioned(
                    bottom: 50  ,
                        left: 0,
                        right: 0,
                        //  left: MediaQuery.of(context).size.width * 0.1,

                          child: SimpleDialog(
                            title: Text("Select a language"),
                            children: [
                              SimpleDialogOption(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Hindi"),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("English"),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("German"),
                              )
                            ],
                          ),
                        ),


                        Positioned(

                            bottom: 30,
                            left: 110,right: 110,
                            //left: MediaQuery.of(context).size.width * 0.1,

                            child: ElevatedButton(onPressed: (){}, child: Text("elevated button")))
                      ],
                    );
                  });
            },
            child: Text('Show Top Positioned Modal Bottom Sheet'),
          ),
        ],
      ),
    );
  }
}



// 31 oct class video follow up
// alert box /dialog box / date picker / simple dialog box

//2 nob class video follow up  15:45

// Date Range picker / snack bar

class Overlays extends StatefulWidget {
  const Overlays({super.key});

  @override
  State<Overlays> createState() => _OverlaysState();
}

class _OverlaysState extends State<Overlays> {
  var isLightMode = false; // switch
  var listRadioOpt = ["Male", "Female", "Other"]; // radio list
  var selectedRadio = "Male"; // radio selected value
  bool isChecked = false; // checkbox
  String? valueSelected; // check box
  List<String> listItems = [
    // dropdown menu
    "Hindi",
    "English",
    "Math",
    "Science",
    "Sst",
    "Physical Eduction"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Overlays 31 oct and 2 nov"),
      ),
      backgroundColor: Colors.blueGrey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Alert dialog box
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        // barrierColor: Colors.green.withOpacity(0.2),
                        builder: (context) {
                          return AlertDialog(
                            shadowColor: Colors.green,
                            elevation: 10,
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            title: Text("Delete"),
                            content: Text("Are you sure you want to delete it"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("yes")),
                              SizedBox(
                                width: 120,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("No")),
                            ],
                          );
                        });
                  },
                  child: Text("Alert dialog")),
              SizedBox(
                height: 15,
              ),
              // simple dialog box

              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text("Select a language"),
                            children: [
                              SimpleDialogOption(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Hindi"),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("English"),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("German"),
                              )
                            ],
                          );
                        });
                  },
                  child: const Text("simple dialog")),
              SizedBox(
                height: 15,
              ),
              // about dialog

              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AboutDialog(
                            applicationVersion: "v.1",
                            applicationIcon: Icon(Icons.flag),
                            applicationName: "Plan My trip",
                          );
                        });
                  },
                  child: Text("About dialog")),
              SizedBox(
                height: 15,
              ),

              // coustom dialog box

              ElevatedButton(
                  onPressed: () {
                    showGeneralDialog(
                        barrierLabel: "custom",
                        barrierDismissible: true,
                        context: context,
                        pageBuilder: (_, __, ___) {
                          return Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 21),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              height: 200,
                              child: Material(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Add Note",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      TextField(),
                                      TextField(),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Add")),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("cancle")),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              //width: 300,
                              //width: 200,
                            ),
                          );
                        });
                  },
                  child: Text("cstm dialog")),

              // Date Picker
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990, 1, 1),
                        lastDate: DateTime.now());
                    if (selectedDate != null) {
                      print(
                          "Selected Date : ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}");
                    }
                  },
                  child: Text("Date Picker")),

              //Time Picker
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(DateTime.now()));
                    if (selectedTime != null) {
                      print(
                          "Selected Time is : ${selectedTime.hour}:${selectedTime.minute}");
                    }
                  },
                  child: const Text("Time picker")),
              SizedBox(
                height: 15,
              ),

              // bottom sheet
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.grey,
                      elevation: 3,
                      enableDrag: false,
                      isDismissible: false,
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Container(
                            margin: EdgeInsets.all(12),
                            height: 200,
                            // color: Colors.white,
                            child: Column(
                              children: [
                                Text("This is bottom sheet"),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(),
                                TextField(),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("cancle")),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("add")),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Text("Bottom Sheet"),
              ),
              SizedBox(
                height: 15,
              ),

              // Date Range

              ElevatedButton(
                  onPressed: () async {
                    var selectedDateRange = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030));
                    if (selectedDateRange != null) {
                      print(
                          "Selected Date Range is from : ${selectedDateRange.start.year}/${selectedDateRange.start.month}/${selectedDateRange.start.day} to ${selectedDateRange.end.year}/${selectedDateRange.end.month}/${selectedDateRange.end.day}");
                    }
                  },
                  child: Text("Date Range")),
              SizedBox(
                height: 15,
              ),

              // snack bar
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        elevation: 4,
                        behavior: SnackBarBehavior.floating,
                        showCloseIcon: true,
                        action: SnackBarAction(
                          textColor: Colors.white,
                          onPressed: () {},
                          label: "Click me",
                        ),
                        margin: EdgeInsets.all(12),
                        content: Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            Text("   This is snach bar"),
                          ],
                        )));
                  },
                  child: Text("Snack bar")),
              SizedBox(
                height: 15,
              ),
              // Dropdown menu

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 48,
                    isExpanded: true,
                    hint: Text("Select Subject"),
                    value: valueSelected,
                    items: listItems
                        .map((valueItem) => DropdownMenuItem(
                        value: valueItem, child: Text(valueItem)))
                        .toList(),
                    onChanged: (newvalue) {
                      setState(() {
                        valueSelected = newvalue;
                      });
                    }),
              ),
              SizedBox(
                height: 15,
              ),

              // Check box
              Row(
                children: [
                  Checkbox.adaptive(
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      splashRadius: 25,
                      value: isChecked,
                      onChanged: (value) {
                        isChecked = value!;
                        setState(() {});
                      }),
                  Text("  check box"),
                ],
              ),
              SizedBox(
                height: 15,
              ),

              // check box list tile

              CheckboxListTile(
                value: isChecked,
                onChanged: (value) {
                  isChecked = value!;
                  setState(() {});
                },
                title: Text("Check box list tile"),
                subtitle: Text("this is checkbox list tile subtitle"),
              ),
              SizedBox(
                height: 15,
              ),

              // Radio

              RadioListTile.adaptive(
                  title: Text(listRadioOpt[0]),
                  value: listRadioOpt[0],
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    selectedRadio = value!;
                    setState(() {});
                  }),

              RadioListTile.adaptive(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Text(listRadioOpt[1]),
                  value: listRadioOpt[1],
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    selectedRadio = value!;
                    setState(() {});
                  }),

              RadioListTile.adaptive(
                  title: Text(listRadioOpt[2]),
                  value: listRadioOpt[2],
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    selectedRadio = value!;
                    setState(() {});
                  }),

              // switch

              SwitchListTile(
                  activeColor: Colors.amber,
                  thumbIcon: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Icon(Icons.light_mode);
                    } else {
                      return Icon(Icons.nightlight);
                    }
                  }),
                  inactiveThumbColor: Colors.black,
                  title: Text("Switch light mode."),
                  value: isLightMode,
                  onChanged: (value) {
                    isLightMode = value!;
                    setState(() {});
                  })
            ],
          ),
        ),
      ),
    );
  }
}
