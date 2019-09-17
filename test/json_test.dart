import 'package:flutter_test/flutter_test.dart';
import 'package:list_app/src/article.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

main() {
  test("Parses topstories.json", () {
    const jsonString =
        "[20658739,20657398,20660040,20655710,20652432,20659945,20656680,20657308,20660115,20652399,20658816,20653485,20653394,20653453,20658214,20646249,20659684,20645799,20658765,20658529,20656241,20652572,20657224,20655766,20658090,20660005,20647744,20649600,20649504,20656929,20657366,20660041,20646540,20659191,20658291,20659390,20658901,20660401,20658069,20656104,20658126,20655017,20658158,20653637,20643052,20652890,20649470,20659607,20656223,20659541,20655821,20654706,20660354,20656155,20653316,20655791,20658912,20653942,20653936,20656992,20659308,20643604,20647592,20649990,20654981,20659260,20654885,20650070,20657860,20657466,20654625,20646097,20652986,20653813,20651233,20651651,20642885,20652211,20657538,20657531,20647646,20653278,20655681,20650748,20652390,20659555,20656713,20652145,20643777,20657054,20659315,20652695,20658125,20659780,20647289,20650069,20649031,20659100,20656156,20643603,20643702,20657319,20641410,20647197,20651510,20649247,20659901,20653451,20658599,20645085,20657785,20650215,20641424,20658335,20656334,20646841,20643573,20659557,20655726,20640148,20646350,20646017,20644038,20655381,20659401,20642156,20650647,20650719,20648974,20656369,20650341,20643928,20651266,20650212,20643535,20643737,20642423,20648329,20653630,20645776,20650723,20639999,20647313,20657187,20642777,20650651,20642824,20646743,20659097,20646918,20644677,20654023,20646123,20647203,20657262,20639843,20651499,20659285,20657021,20645390,20649495,20645319,20656411,20640114,20656073,20656433,20634409,20652945,20635640,20651756,20642005,20644984,20636152,20643417,20650564,20644165,20647651,20655477,20658926,20636422,20650519,20641551,20648240,20637849,20656607,20634522,20659353,20648233,20655816,20644919,20642141,20645843,20636432,20657333,20644393,20640798,20653015,20632771,20656524,20650234,20654356,20641045,20643706,20659149,20649241,20648843,20647760,20647061,20643336,20634100,20644363,20641500,20639325,20649580,20643592,20655346,20654805,20646674,20634715,20654624,20658952,20641893,20650831,20636443,20636331,20648525,20632846,20633780,20658859,20632947,20652561,20658113,20638315,20633081,20638158,20645938,20640153,20639123,20643645,20642721,20643884,20638662,20649627,20652637,20650626,20658490,20636376,20652339,20658318,20657376,20653728,20657236,20636476,20640775,20641593,20635077,20635659,20654503,20633077,20648740,20638834,20657896,20643234,20639862,20651658,20636769,20648139,20640941,20634825,20647825,20636805,20655344,20657696,20656299,20654989,20645243,20632942,20638838,20651984,20643883,20657551,20657529,20643231,20654713,20638299,20640974,20657404,20647795,20632993,20634546,20633638,20637879,20640191,20636757,20640776,20650939,20650906,20655280,20650981,20641787,20648366,20655392,20649563,20636546,20634092,20634753,20643789,20650960,20641119,20642376,20633548,20634506,20638736,20635100,20649256,20649115,20655688,20633883,20648814,20636254,20634276,20640083,20653751,20648495,20638562,20633510,20640140,20647680,20638645,20642920,20645898,20640378,20651202,20654897,20647337,20642332,20647844,20650423,20648644,20654323,20645914,20639359,20637357,20633055,20640788,20634023,20651783,20637051,20646731,20635846,20643257,20636305,20645344,20652246,20647298,20656342,20644126,20647674,20654690,20643097,20651777,20650014,20642752,20637483,20636606,20641331,20635439,20644553,20652607,20642321,20651387,20655099,20638115,20656952,20639130,20650264,20637970,20646643,20632468,20644819,20649989,20641740,20635768,20654862,20635407,20641530,20639111,20641451,20638566,20651975,20643311,20634607,20650538,20643378,20637432,20640373,20633687,20633599,20641042,20638926,20639331,20632724,20649663,20638114,20648003,20643925,20633607,20637793,20639785,20633458,20655294,20644215,20649179,20653591,20637798,20640372,20651057,20643635,20641905,20648575,20638015,20634654,20635965,20639292,20635228,20644803,20636034,20644096,20633482,20642458,20649938,20639963,20643459,20645265,20649069,20632471,20635850,20633850,20635271,20642675,20648583,20639828,20640733,20648179,20655003,20647987,20633035,20647957,20634006,20635699,20641831,20646983,20641762,20641761,20643160,20642923,20635793,20638071,20637817,20633021,20645394,20645267,20635342,20644697,20642042,20639625,20639546,20641898,20639240,20639052,20644044,20638068,20637896,20637475,20639863,20639840,20639799,20632562,20642479,20642373,20638791,20642247,20638375,20634674,20637479,20633220,20637047,20636980,20636910,20633923,20635992,20635775,20635463,20635264,20640960,20640879,20644824,20640205,20640178,20642998]";

    expect(parseTopStories(jsonString).first, 20658739);
  });

  test("Parses item.json", () {
    const jsonString =
        """{"by":"dhouston","descendants":71,"id":8863,"kids":[9224,8917,8952,8884,8887,8869,8958,8940,8908,9005,8873,9671,9067,9055,8865,8881,8872,8955,10403,8903,8928,9125,8998,8901,8902,8907,8894,8870,8878,8980,8934,8943,8876],"score":104,"time":1175714200,"title":"My YC app: Dropbox - Throw away your USB drive","type":"story","url":"http://www.getdropbox.com/u/2/screencast.html"}""";
    expect(parseArticle(jsonString).by, "dhouston");
  });

  test("Parses item.json over a network", () async {
    final url = "https://hacker-news.firebaseio.com/v0/beststories.json";
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final idList = parseTopStories(res.body);
      if (idList.isNotEmpty) {
        final storyUrl = "https://hacker-news.firebaseio.com/v0/item/${idList.first}.json";
        final storyRes = await http.get(storyUrl);
        expect(parseArticle(storyRes.body), isNotNull);
      }
    }
  }, skip: true);
}