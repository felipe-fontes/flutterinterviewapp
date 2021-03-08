import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:interviewapp/pages/home/subpages/post/posts_controller.dart';
import 'package:interviewapp/shared/utils/colors.dart';
import 'package:interviewapp/shared/utils/strings.dart';

void showMessageDialog(
  BuildContext context,
  TextEditingController _messageController,
  FocusNode focusNode,
  PostsController _postsController,
  Future Function(String text) onSubmitted,
) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10),
      ),
    ),
    backgroundColor: AppColors.backgroundWhite,
    context: context,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            child: Observer(
              builder: (_) {
                return Container(
                  height: 60,
                  child: TextField(
                    controller: _messageController,
                    autofocus: true,
                    focusNode: focusNode,
                    onSubmitted: (text) async {
                      await onSubmitted(text);
                    },
                    decoration: InputDecoration(
                      labelText: AppString.newPost,
                      errorText: _postsController.errorMessage.isNotEmpty
                          ? _postsController.errorMessage
                          : null,
                      labelStyle: TextStyle(
                        color: focusNode.hasFocus
                            ? Theme.of(context).accentColor
                            : AppColors.disabled,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
