import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:interviewapp/pages/home/subpages/post/posts_controller.dart';
import 'package:interviewapp/pages/home/subpages/utils/show_message_dialog.dart';
import 'package:interviewapp/pages/login/login_page.dart';
import 'package:interviewapp/shared/utils/colors.dart';
import 'package:interviewapp/shared/utils/strings.dart';
import 'package:interviewapp/widgets/my_card.dart';
import 'package:interviewapp/widgets/profile_picture_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostsPage extends StatefulWidget {
  PostsPage({Key key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  PostsController _postsController;

  TextEditingController _messageController;
  FocusNode inputFieldNode;

  @override
  void initState() {
    _postsController = GetIt.I<PostsController>();
    _postsController.getPosts();
    _messageController = TextEditingController();
    inputFieldNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return CustomScrollView(slivers: [
        _buildSliverBar(context),
        _buildSliverList(),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            height: 80,
          ),
        ),
      ]);
    });
  }

  SliverList _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, i) {
        return Container(
          padding: EdgeInsets.only(
            bottom: 20,
          ),
          child: MyCard(
            shadowColor: AppColors.boticario900.withOpacity(0.4),
            bolderRadius: 10,
            child: buildCardContent(i),
          ),
        );
      }, childCount: _postsController.posts.length),
    );
  }

  SliverAppBar _buildSliverBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.boticario50,
      expandedHeight: 150,
      flexibleSpace: Column(
        children: [
          Flexible(
            flex: 1,
            child: _buildHeaderContent(context),
          ),
          _buildHeaderWhiteCorner(),
        ],
      ),
    );
  }

  Container _buildHeaderWhiteCorner() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [],
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
          bottom: Radius.circular(0),
        ),
      ),
    );
  }

  Container _buildHeaderContent(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfilePictureWidget(),
          SizedBox(
            width: 15,
          ),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: AppColors.backgroundWhite,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: '${AppString.hello} ',
                ),
                TextSpan(
                  text: _postsController.user != null
                      ? '${_postsController.user.name},'
                      : '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '\n${AppString.welcomeBack}',
                ),
                TextSpan(
                  text: '\nSair',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      final logout = await _postsController.logout();
                      if (logout) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      }
                    },
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildCardContent(int i) {
    return Container(
      padding: EdgeInsets.all(
        10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProfilePictureWidget(),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_postsController.posts[i].user.name,
                      style: Theme.of(context).textTheme.caption),
                  Text(
                    timeago.format(
                      _postsController.posts[i].date,
                      locale: 'br',
                    ),
                    style: TextStyle(
                      color: AppColors.boticario900,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              buildCardActions(_postsController.posts[i]),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _postsController.posts[i].message,
          ),
        ],
      ),
    );
  }

  Widget buildCardActions(PostDto post) {
    if (!post.userPost) return Container();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(
            Icons.edit_outlined,
            color: AppColors.boticario900,
          ),
          color: AppColors.boticario900,
          onPressed: () => showMessageDialog(
            context,
            _messageController,
            this.inputFieldNode,
            _postsController,
            (text) async {
              final success = await _postsController.updatePost(post, text);
              if (success) {
                _messageController.text = '';
                Navigator.pop(context);
              } else {
                inputFieldNode.requestFocus();
              }
            },
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.delete_outline,
            color: AppColors.boticario900,
          ),
          color: AppColors.boticario900,
          onPressed: () => _postsController.deletePost(post),
        ),
      ],
    );
  }
}
