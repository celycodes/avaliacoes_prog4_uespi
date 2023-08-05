// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../data/models/apod_model.dart';


//import 'package:galaxy_app/src/data/models/apod_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, this.apodModel});

  final ApodModel? apodModel;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.apodModel!.title!,
          style: const TextStyle(fontSize: 16),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 500,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.apodModel!.url!),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 17.0,
                left: 17.0,
                top: 17.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.apodModel!.date!,
                    style: const TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    widget.apodModel!.copyright!,
                    style: const TextStyle(fontSize: 15.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                widget.apodModel!.explanation!,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}