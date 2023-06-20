import 'package:flutter/material.dart';

class Genres {
  final String id;
  final String name;
  final String image1;
  final String image2;
  final String image3;
  final Color color;
  Genres({
    required this.color,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.id,
    required this.name,
  });
  factory Genres.fromJson(json) {
    return Genres(
      id: json['id'].toString(),
      name: json['name'],
      image1: json['image1'].toString(),
      image2: json['image2'].toString(),
      image3: json['image3'].toString(),
      color: json['color'],
    );
  }
}

class GenresList {
  final List<Genres> list;
  GenresList({
    required this.list,
  });
  factory GenresList.fromJson(json) {
    return GenresList(
        list: (json as List).map((genre) => Genres.fromJson(genre)).toList());
  }
}

final genreslist = [
  {
    "id": 28,
    "name": "Action",
    "image1":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDe2PsZOcxJ5bu402ZL8-oNu9FAxK1y2id3Og7UheQi3Vhr69L",
    "image2":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE3LTjQc8KGftTNNeJAhgJbMAMPglVFHJrWwWlOPV7N2QRBvAa",
    "image3":
        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcS5J6Ay6y1UT7WAI4U7Zm2KDYITrvfOI3vmaCNdGhx_0jmWiI1d",
    "color": const Color(0xFF29b6f6),
  },
  {
    "id": 12,
    "name": "Adventure",
    "image1":
        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQNa-5yiTMRWpkVWBqLKy0IoCism08FrrG7N5XIHUhCylOtrSXN",
    "image2":
        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcScKmbrbsydfII7jY2nhc9Qo8YYFRk0TFaydwrArnP1pf1A6l76",
    "image3":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvJznVehDbSUPihJbSTNwH8Tgnvh4ZDxs0J4hV06wOvHHidHul",
    "color": const Color(0xff66bb6a)
  },
  {
    "id": 16,
    "name": "Animation",
    "image1":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSTtmLfwxfgjuexYD4IBRvrF6Lzgs-jAeTLU8GKTFzES6Jm8S1s",
    "image2":
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJqth8C4SvjrtYYPsIITTA4SlzudE7xAVeViCFL3-tTlbAKJnZ",
    "image3":
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0kylEqLF9BAOq_sT_250hBUBbA0X-OEMuBcy4mPfK1Rn6sDSq",
    "color": const Color(0xFF26c6da)
  },
  {
    "id": 35,
    "name": "Comedy",
    "image1":
    "https://resizing.flixster.com/gdWYqzMV4Jtgl-luly6pjH_D9Yo=/206x305/v2/https://flxt.tmsimg.com/assets/p15854_p_v8_ag.jpg",
    "image2":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQJOtRbRHCBV3k4LW7rIA41O3h5J4BHNlCNSNPZlg6xcw9wrzks",
    "image3":
    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSfsrQ9QJ1VITsE-55Sg7NpLQoMisef6i85N-EgymYtVo0rxh7F",
    "color": const Color(0xff26a96a)
  },
  {
    "id": 80,
    "name": "Crime",
    "image1":
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdSihMONgITeMLq585q_sOWW45YFDf9S-hm-NfgCybECNaRrHT",
    "image2":
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQHYRfxqfB3zWHF7RJi83HU8L9Eo92QYHrAEtC8RS3LcM67XH3D",
    "image3":
    "https://www.movienewsletters.net/photos/109292R1.jpg",
    "color": const Color(0xff78909c)
  },
  {
    "id": 99,
    "name": "Documentary",
    "image1":
    "https://upload.wikimedia.org/wikipedia/en/thumb/1/19/Return_to_Space.jpg/220px-Return_to_Space.jpg",
    "image2":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQywlg6GqVovYvZzHXFDeNi3On9FNsFvZ7hU_UJUKp7RMzMX_2n",
    "image3":
    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQZf9CCh01-VGZygD00ICzrndqRxo8SodvZaVlEFdyihOlBzPNs",
    "color": const Color(0xFFbdbdbd)
  },
  {
    "id": 18,
    "name": "Drama",
    "image1":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTzNlIZKiJAX5AvuyWZVZ9L29TvSrOjGnG7ZIS3U3j23KGoV7qH",
    "image2":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTlDDFvxbV-uLg6WtUDnL4c5wa8_jWEyy-h8eL07zI1iEoqa84B",
    "image3":
    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSffEvo8P0-OEkNWPKrZY3DYeBroLlsgD0FZ1C_KFQPM26Rr0eR",
    "color": const Color(0xff8d6e63)
  },
  {
    "id": 10751,
    "name": "Family",
    "image1":
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDGfPgUDGLcIAyA7Zs9zQUAg6kXbP5xJ9ykn4PTuiPjxTgy-_w",
    "image2":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQnBnbKTjU5mzZNb0bzhtFSdr6KRpGWRagQWWfk8S2k6QQ_b2n2",
    "image3":
    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSO14HFdtQ37FlMOpTSOpckqpXMF877JygfYvz5xO9ZcHi1tvH4",
    "color": const Color(0xFFbfb699)
  },
  {
    "id": 14,
    "name": "Fantasy",
    "image1":
    "https://irs.www.warnerbros.com/keyart-jpeg/movies/media/browser/ReadyPlayerOne_Onesheet.jpeg",
    "image2":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSzxaIK2qzAnjBsSP2wixHgOGU6dujLmwE0rqKb5MljPqZVrEWy",
    "image3":
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ6gjGmgXTyL9-TLX1taeXbep0CT89o2bjT060e6rOkuOIzn0kv",
    "color": const Color(0xff7e57c2)
  },
  {
    "id": 36,
    "name": "History",
    "image1":
    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQnaYe2_t8-s9n0d-e0kgDLMgGo6hQiG0AZlbt0eCTNexg2vLmM",
    "image2":
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQwbnsi_35ZIg-3VVZIeIXTQPPelTlwFdziXik2liI4FvjjVXjL",
    "image3":
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ4Fw9NaE_mZRabAedBLaCTt-gCvgschQFy73BWH_oKg7iJCqZp",
    "color": const Color(0xffbda128)
  },
  {
    "id": 27,
    "name": "Horror",
    "image1":
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTzC_dh7C85oQWlvdww6eFuVUlFk2psFGo5OD9ZvaCsYxmDP9If",
    "image2":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRyJBmp4lWyj1dyfOxQGqztVd2x4aZsKcSVb16WL-vcwIDsVM-J",
    "image3":
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA_g7o3MK19xx1sF3whIvhjCobvmUlo5BKKFCJr4YHr2q8Tp6r",
    "color": const Color(0xFF616161)
  },
  {
    "id": 10402,
    "name": "Music",
    "image1":
    "https://m.media-amazon.com/images/I/91xsWtJHOXL._RI_.jpg",
    "image2":
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIMfMyK1bYhkoecgtI7_o_aCA4FPXZbgGGVWG0CiINIiiXmz-6",
    "image3":
    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSNjaAsb844kcxpHCqyQX5lVUgc6EMVO6nNLg13ivPcCXiMYaH0",
    "color": const Color(0xffffa726)
  },
  {
    "id": 9648,
    "name": "Mystery",
    "image1":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTYrB7ZFkwFPK3lmq_Odq-IbkwuA7KC8YV3KVBWfFsFbmKvTUIb",
    "image2":
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSXKl1ZsLhWF-M_-mQm0HXG7VvrJLOWjH-MQ_PEpbm-5PsnnED",
    "image3":
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcR-LUjvZXv8KUDFWsnZmWPPGNTGeCELOtRynDuwjuq0m3BmsnSD",
    "color": const Color(0xff504907)
  },
  {
    "id": 10749,
    "name": "Romance",
    "image1":
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRmTjFSeom8h-5-rDq_dB4AEQFSLLDuX0A-F1Shuxdck9fmqdEl",
    "image2":
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0NeWRCO5Fby7CiTcO979Vs2PppVKwZpZlQ5FhnSD1&usqp=CAE&s",
    "image3":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcT9iKMpedwgBIdUBaW-9GppzoQsFmQhLlsnW-34AM1tCl8PPqqa",
    "color": const Color(0xffff7043)
  },
  {
    "id": 878,
    "name": "Science   Fiction",
    "image1":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSJ5-psw6GEKj8Lf4YWHgSLsXB8V7TQ89RkH7DCU5k16myQkQT9",
    "image2":
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUu-oa2MJaZx5O1g0UKapspXTveafzdvCHvqZ5T_WVLoIu7Zz9",
    "image3":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQL3QtR15IRo5S6Op_HNxRutR8eWJ_mfwCDrl6MtWCsnY-RLLZz",
    "color": const Color(0xffab47bc)
  },
  {
    "id": 53,
    "name": "Thriller",
    "image1":
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSGVo-yucgWCsGuHBF7MYkXqvf1WLgYHgzWL6yJHSJ_-sQ3ZtFF",
    "image2":
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTvIYau3w2QDskwZnm5iyq6KfnRBukiJZ8CQ6T5ncJj4Bd1-LqA",
    "image3":
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4o4eBZdZWCR0iNFjiu1p4BKAIwIOkm_tZr3A-WUu4IAAcrq57",
    "color": const Color(0xff3f51b5)
  },
  {
    "id": 10752,
    "name": "War",
    "image1":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQf9CM5qT6EXTQY5YF87IKI_GBu0FVCe3IucLJvJJmGhsu7Ux33",
    "image2":
    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRfoRoLK3BMH0SMKyQwVxIe6kdiPTnkpZiRmHJo1f-e66WcriOs",
    "image3":
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTbFaPnj3jVO8Sdydx4C0k3sSAkDbw_J6dMWWQp1pydGs8gN9jL",
    "color": const Color(0xff5d4037)
  },
  {
    "id": 37,
    "name": "Western",
    "image1":
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSKd6TRCaTrxlRYEiFYYjDSizSCNNQIvt2Dt_6Hbe54YxvQp-kh",
    "image2":
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqnBGT5cH3XN4cd7K3SGrEHDrPqrQklUvLdvVtNDJNx7I5m7Ct",
    "image3":
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTXRBTx6VZb0ISeumcIoq0OSEHCNTTKukQqtrXhxm9HhOAzBvBR",
    "color": const Color(0xfff57c00)
  },
];
