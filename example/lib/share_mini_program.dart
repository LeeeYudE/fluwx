import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';

class ShareMiniProgramPage extends StatefulWidget {
  @override
  _ShareMiniProgramPageState createState() => _ShareMiniProgramPageState();
}

class _ShareMiniProgramPageState extends State<ShareMiniProgramPage> {

  Fluwx fluwx;
  WeChatScene scene = WeChatScene.SESSION;
  String  _webPageUr = "http://www.qq.com";
  String _thumbnail =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1534614311230&di=b17a892b366b5d002f52abcce7c4eea0&imgtype=0&src=http%3A%2F%2Fimg.mp.sohu.com%2Fupload%2F20170516%2F51296b2673704ae2992d0a28c244274c_th.png";
 String _title = "Fluwx";
 String _userName = "gh_d43f693ca31f";
 String _path =  "/pages/media";
 String _description = "Fluwx";

  @override
  void initState() {
    super.initState();
    fluwx = new Fluwx();
  }


  @override
  Widget build(BuildContext context) {
    new Scaffold(
      appBar: AppBar(
        title: const Text("ShareMiniProgram"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share,color: Colors.white,), onPressed: _share)
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              controller: TextEditingController(text: "http://www.qq.com"),
              onChanged: (str){
                _webPageUr = str;
              },
              decoration: InputDecoration(
                  labelText: "web page url"
              ),
            ),
            new TextField(
              controller: TextEditingController(text: "gh_d43f693ca31f"),
              onChanged: (str){
                _userName = str;
              },
              decoration: InputDecoration(
                  labelText: "user name"
              ),
            ),
            new TextField(
              controller: TextEditingController(text: "/pages/media"),
              onChanged: (str){
                _path = str;
              },
              decoration: InputDecoration(
                  labelText: "user name"
              ),
            ),
            new TextField(
              controller: TextEditingController(text: "Fluwx"),
              onChanged: (str){
                _title = str;
              },
              decoration: InputDecoration(
                  labelText: "title"
              ),
            ),
            new TextField(
              controller: TextEditingController(text: "Fluwx"),
              onChanged: (str){
                _description = str;
              },
              decoration: InputDecoration(
                  labelText: "description"
              ),
            ),
            new TextField(
              controller: TextEditingController(text: "assets://images/logo.png"),
              onChanged: (str){
                _thumbnail = str;
              },
              decoration: InputDecoration(
                  labelText: "thumbnail"
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _share() {
    var model =new WeChatShareMiniProgramModel(
      webPageUrl: _webPageUr,
      miniProgramType: WeChatShareMiniProgramModel.MINI_PROGRAM_TYPE_RELEASE,
      userName: _userName,
      title: _title,
      description: _description,
      thumbnail: _thumbnail
    );
    fluwx.share(model);
  }


}
