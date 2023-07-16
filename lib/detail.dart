import 'package:pasar_ikan/jenis/jenis_ikan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  final Jenisikan ikan;

  const DetailScreen({
    Key? key,
    required this.ikan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.light, //bottom bar icons
    ));
    var subhead = TextStyle(
      color: Colors.black,
      fontFamily: 'Ikan',
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  ikan.images,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 20,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: FavDetailBtn(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ikan.nama,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(ikan.kategori),
                      SizedBox(height: 24),
                      Text(
                        'Deskripsi',
                        style: subhead,
                      ),
                      SizedBox(height: 12),
                      Text(ikan.deskripsi),
                      SizedBox(height: 24),
                      Text(
                        'Keterangan',
                        style: subhead,
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              children: ikan.icon.map((e) {
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 0,
                                  leading: Image.asset(
                                    e,
                                    width: 24,
                                    height: 24,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Flexible(
                            flex: 8,
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              children: ikan.keterangan.map((i) {
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  horizontalTitleGap: 0,
                                  title: Text(i),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(ikan.harga),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: ' / Ekor',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'ikan',
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(top: 8),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Lihat opsi pengiriman',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 24),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size.fromHeight(50),
                    ),
                    child: Text('Beli'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FavDetailBtn extends StatefulWidget {
  const FavDetailBtn({Key? key}) : super(key: key);

  @override
  _FavDetailBtnState createState() => _FavDetailBtnState();
}

class _FavDetailBtnState extends State<FavDetailBtn> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isLike ? Icons.thumb_up : Icons.thumb_up,
        color: isLike ? Colors.red : Colors.grey[400],
        size: 20,
      ),
      onPressed: () {
        setState(() {
          isLike = !isLike;
        });
      },
    );
  }
}
