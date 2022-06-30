import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> bhkSelected = [false, false, false, false, false, false];
  List<bool> bathSelected = [false, false, false, false, false, false];
  List locations = [];

  var _selectedLocation;
  TextEditingController areaController = TextEditingController();
  int bhk = 0, bath = 0;
  var area;
  var estimatedprice;
  Future<void> getEstimatedPrice() async {
    var url = Uri.parse(
        'https://real-state-price-prediction.herokuapp.com/predict_home_price');
    var response = await http.post(url, body: {
      'total_sqft': '$area',
      'location': '$_selectedLocation',
      'bhk': '$bhk',
      'bath': '$bath'
    });
    Map data = jsonDecode(response.body);
    estimatedprice = data['estimated_price'].toStringAsFixed(2);
  }

  Future<void> getLocations() async {
    var url = Uri.parse(
        'https://real-state-price-prediction.herokuapp.com/get_location_names');
    var response = await http.get(url);
    Map data = jsonDecode(response.body);
    setState(() {
      locations = (data['locations']);
    });
  }

  @override
  void initState() {
    super.initState();
    getLocations();
  }

  @override
  Widget build(BuildContext context) {
    getLocations();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/1.jpg'), fit: BoxFit.fill),
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
                        keyboardType: TextInputType.number,
                        controller: areaController,
                        onChanged: (value) {
                          setState(() {
                            area = value;
                            print(area);
                          });
                        },
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                        height: 50,
                        width: 250,
                        child: Center(
                          child: DropdownButtonFormField(
                            isExpanded: true,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                labelText: 'Select Location',
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            dropdownColor: Colors.lightBlue[900],
                            value: _selectedLocation,
                            items: locations
                                .map((loc) => DropdownMenuItem(
                                    value: loc,
                                    child: Text(
                                      loc,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )))
                                .toList(),
                            onChanged: (loc) => setState(() {
                              _selectedLocation = loc.toString();
                              print(_selectedLocation);
                            }),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      child: const Text(
                        'Predict Price',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        getEstimatedPrice();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[900],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: estimatedprice != null
                        ? Text(
                            'Estimated Price: $estimatedprice lakhs',
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        : null,
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
