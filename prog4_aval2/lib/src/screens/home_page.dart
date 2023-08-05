import 'package:flutter/material.dart';


import '../componets/card_widget.dart';
import '../componets/erro_widget.dart';
import '../data/models/apod_model.dart';
import '../data/services/apod_api.dart';
import '../routes/app_routes.dart';
import 'details_page.dart';

enum PopupMenuPages {
  members,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ApodModel apodModel = ApodModel();
  Future<List<ApodModel>>? apodListModel;
  ScrollController scrollController = ScrollController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    final apodApi = ApodApi();

    apodListModel = apodApi.fetchApod();
  }

  Future<void> _refreshApodData() async {
    final apodApi = ApodApi();
    setState(() {
      apodListModel = apodApi.fetchApod();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Scrollable.ensureVisible(
        context,
        alignment: 0,
        duration: const Duration(milliseconds: 500),
      );
    });
  }

  Future<void> _refresh() async {
    await _refreshApodData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 16,
        actions: [
          PopupMenuButton<PopupMenuPages>(
            onSelected: (PopupMenuPages valueSelect) {
              switch (valueSelect) {
                case PopupMenuPages.members:
                  Navigator.of(context).pushNamed(
                    AppRoutes.membersPage,
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<PopupMenuPages>>[
                const PopupMenuItem<PopupMenuPages>(
                  value: PopupMenuPages.members,
                  child: Text('Members Page'),
                ),
              ];
            },
          ),
        ],
        title: const Text(
          'Galaxy App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshApodData,
        child: const Icon(Icons.autorenew),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: FutureBuilder<List<ApodModel>>(
          future: apodListModel,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: ErroWidget(
                error: snapshot.error,
                onPressed: _refreshApodData,
              ));
            } else if (snapshot.hasData) {
              final apodList = snapshot.data!;
              return ListView.builder(
                itemCount: apodList.length,
                controller: scrollController,
                itemBuilder: (context, index) {
                  final apodData = apodList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsPage(
                            apodModel: apodList[index],
                          ),
                        ),
                      );
                    },
                    child: CardWidget(
                      title: apodData.title!,
                      date: apodData.date!,
                      imageThumbnail: apodData.url!,
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}