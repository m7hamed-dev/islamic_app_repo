import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/styles/txt_style.dart';
import 'package:quran/tools/constants.dart';
import 'package:quran/tools/screen_util.dart';
import 'package:quran/views/prayer/info_time.dart';
import 'package:quran/widgets/btn.dart';
import 'prayer_controller.dart';

class CardPrayerTime extends StatelessWidget {
  const CardPrayerTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Consumer<PrayerController>(
          builder: (context, PrayerController prayerController, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              prayerController.isError
                  ? Text(
                      prayerController.error,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                      ),
                    )
                  : Container(
                      width: ScreenUtil.getWidth(context),
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 5.0,
                            spreadRadius: 5.0,
                          )
                        ],
                      ),
                      child: DropdownButton<String>(
                        hint: Text(prayerController.seletedCity,
                            style: const TextStyle(color: Colors.black)),
                        underline: const SizedBox(),
                        items: prayerController.cities.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e,
                                style: const TextStyle(color: Colors.black)),
                          );
                        }).toList(),
                        onChanged: prayerController.onSeletedCity,
                      ),
                    ),
              _iconText(
                const Icon(
                  Icons.date_range_outlined,
                  size: 30,
                ),
                prayerController.datebyHijri.hijri.toString().substring(0, 11),
                'الهجري',
              ),
              _iconText(
                const Icon(
                  Icons.directions,
                  size: 30,
                ),
                prayerController.location.timezone,
                // "12 LS - 10 LS & 77 BT - 99 BB",
                prayerController.location.country,
              ),
              _iconText(
                const Icon(
                  Icons.directions,
                  size: 30,
                ),
                prayerController.location.timezone,
                // "12 LS - 10 LS & 77 BT - 99 BB",
                prayerController.location.country,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                crossAxisCount: 3,
                children: <Widget>[
                  InfoTime("Imsak", prayerController.times.imsak),
                  InfoTime("SunRise", prayerController.times.sunrise),
                  InfoTime("Shubuh", prayerController.times.fajr),
                  InfoTime("Dhuhur", prayerController.times.dhuhr),
                  InfoTime("Ashar", prayerController.times.asr),
                  InfoTime("SunSet", prayerController.times.sunset),
                  InfoTime("Maghrib", prayerController.times.maghrib),
                  InfoTime("Isya", prayerController.times.isha),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconText(Icon icon, String title, String subTitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: icon,
      title: Text(
        title,
        style: TxtStyle.customStyle(
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: TxtStyle.customStyle(
          fontSize: 15.0,
          color: const Color.fromARGB(255, 111, 107, 107),
        ),
      ),
    );
    double h = 30;
    double w = 30;
    Container left = Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: Constants.color3,
        borderRadius: BorderRadius.circular(w / 2),
      ),
      child: icon,
    );

    Column right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Txt(title),
        // Txt(subTitle),
        Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        Text(
          subTitle,
          style: const TextStyle(color: Colors.black, fontSize: 10),
        ),
      ],
    );

    return Row(
      children: <Widget>[
        left,
        const SizedBox(
          width: 10,
        ),
        right
      ],
    );
  }
}
