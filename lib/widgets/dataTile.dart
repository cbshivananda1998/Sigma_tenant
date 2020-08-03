
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {

  final String name;
  final String description;
  final String meta;


  Tile(
      {this.name,
      this.description,
      this.meta,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0,5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),

      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(5, 5)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name.toUpperCase(),
                  style: TextStyle(
                      color: Colors.pink,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              description,
              style: TextStyle(

                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              meta=="null"?"":meta,
            ),
          ],
        ),
      ),
    );
  }
}
