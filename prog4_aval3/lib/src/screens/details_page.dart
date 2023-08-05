// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/movie_model.dart';


//import 'package:galaxy_app/src/data/models/apod_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, this.movieModel});

  final MovieModel? movieModel;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF000B49),
        title: Text(
          widget.movieModel!.titleText,
          style: const TextStyle(fontSize: 20),
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
                  image: NetworkImage(widget.movieModel!.imageUrl),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${widget.movieModel!.genres.first.toString()} |',
                    style: const TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${widget.movieModel!.releaseYear.toString()} |',
                    style: const TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.movieModel!.ratingsSummary.toString(),
                    style: const TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                widget.movieModel!.plot,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}