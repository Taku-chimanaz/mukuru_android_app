import 'package:flutter/material.dart';
import 'package:mukuru_app/projects/colors.dart';
import 'package:mukuru_app/projects/customWidgets/select_time_range_header.dart';

class StatementRangeSelector extends StatefulWidget {
  const StatementRangeSelector({super.key});

  @override
  State<StatementRangeSelector> createState() => _StatementRangeSelectorState();
}

class _StatementRangeSelectorState extends State<StatementRangeSelector> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: MyAppColors.borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectTimeRangeHeader(),
          SizedBox(
            height: 20,
          ),
          Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'From:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            width: 1,
                                            color: MyAppColors.borderColor))),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.date_range,
                                    color: MyAppColors.themeColor,
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                          initialValue: DateTime.now().toString().split(" ")[0],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'To:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            width: 1,
                                            color: MyAppColors.borderColor))),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.date_range,
                                    color: MyAppColors.themeColor,
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                          initialValue: DateTime.now().toString().split(" ")[0],
                        ),
                      )
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () => {},
            child: Text('Generate Statement'),
            style: ElevatedButton.styleFrom(
                backgroundColor: MyAppColors.themeColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
          )
        ],
      ),
    );
  }
}
