import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/views/favourit/db_helper.dart';
import 'package:quran/views/favourit/favourit_model.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/widgets/txt.dart';

class FavouritView extends StatefulWidget {
  const FavouritView({Key? key}) : super(key: key);
  static const pageName = '/FavouritView';

  @override
  State<FavouritView> createState() => _FavouritViewState();
}

class _FavouritViewState extends State<FavouritView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Txt(
          'favourites page',
          isUseFontSizePrefs: false,
          color: Colors.white,
        ),
      ),
      body: FutureBuilder<List<FavouritModel>>(
        future: DbHelper.fetchFavourites(),
        builder: (BuildContext context,
            AsyncSnapshot<List<FavouritModel>> snapshot) {
          if (snapshot.hasData) {
            List<FavouritModel> favourites = snapshot.data ?? [];
            if (favourites.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.favorite,
                      size: 90.0,
                      color: Colors.red,
                    ),
                    SizedBox(height: 20.0),
                    Txt(
                      'no favouriets !!',
                      isUseFontSizePrefs: false,
                      fontSize: 20.0,
                    )
                  ],
                ),
              );
            }
            return ListView.separated(
              // reverse: favourites.isEmpty ? false : true,
              itemCount: favourites.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomCard(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(6.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      favourites[index].title,
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: TxtStyle.customStyle(),
                    ),
                    subtitle: Text(
                      favourites[index].hsna,
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: TxtStyle.customStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    leading: IconButton(
                      color: Colors.red.shade100,
                      padding: EdgeInsets.zero,
                      // shape: const CircleBorder(),
                      onPressed: () {
                        DbHelper.deleteSingleFavourite(
                          favourites[index].title,
                        ).then((value) {
                          DbHelper.fetchFavourites();
                          setState(() {});
                        });
                      },
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

int _createAlgorithmID(String value) {
  return Random().nextInt(value.length) * 10;
}
