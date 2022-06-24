import 'package:flutter/material.dart';

class DataModel {
  String location;

  DataModel({required this.location});
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> bhkSelected = [false, false, false, false, false, false];
  List<bool> bathSelected = [false, false, false, false, false, false];
  List<DataModel> vehicleData = [
    DataModel(location: 'Sarojni nagar'),
    DataModel(location: 'kamlapati'),
    DataModel(location: 'nehru nagar'),
  ];
  //List<String> locations = ['sarojni nagar', 'palam', 'nehru nagar'];
  List<String> locations = ['A', 'B', 'C', 'D'];
  String _selectedLocation = '';
  final area = TextEditingController();
  int bhk = 0, bath = 0;
  double estimatedprice = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1557683316-973673baf926?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHw%3D&w=1000&q=80'),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 25, bottom: 60),
                child: Column(
                  children: const [
                    Text(
                      'Real State Price Prediction',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Enter Area (Square feet)',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                      height: 80,
                      padding:
                          const EdgeInsets.only(top: 10, left: 25, right: 24),
                      child: TextField(
                        controller: area,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            labelText: 'Area',
                            hintText: 'enter area'),
                      )),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Select BHK',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  ToggleButtons(
                    children: const [
                      Text(
                        '1',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '2',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '3',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '4',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '5',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '6',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                    selectedColor: Colors.cyan,
                    selectedBorderColor: Colors.cyan,
                    borderWidth: 2,
                    isSelected: bhkSelected,
                    borderColor: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    onPressed: (int index) {
                      setState(() {
                        for (int i = 0; i < bhkSelected.length; i++) {
                          bhkSelected[i] = i == index;
                        }
                        bhk = index + 1;
                        print('bhk = $bhk');
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Select BATH',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  ToggleButtons(
                    children: const [
                      Text(
                        '1',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '2',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '3',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '4',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '5',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '6',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                    selectedColor: Colors.cyan,
                    selectedBorderColor: Colors.cyan,
                    borderWidth: 2,
                    isSelected: bathSelected,
                    borderColor: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    onPressed: (int index) {
                      setState(() {
                        for (int i = 0; i < bathSelected.length; i++) {
                          bathSelected[i] = i == index;
                        }
                        bath = index + 1;
                        print('Bath = $bath');
                      });
                    },
                  ),
                  SizedBox(
                      height: 50,
                      width: 175,
                      child: DropdownButton<String>(
                        items: <String>['sarojni nagar', 'nehru nagar phase a', 'ashoka garden', ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      )),
                  ElevatedButton(
                    child: const Text(
                      'Predict Price',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[900],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        textStyle: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'Estimated Price: $estimatedprice lakhs',
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
