import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:interviewapp/pages/home/subpages/post/posts_controller.dart';
import 'package:interviewapp/shared/utils/colors.dart';

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
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: Observer(
              builder: (_) {
                return TextField(
                  controller: _messageController,
                  autofocus: true,
                  focusNode: focusNode,
                  onSubmitted: (text) async {
                    await onSubmitted(text);
                  },
                  decoration: InputDecoration(
                    labelText: 'What will be you post of the day',
                    errorText: _postsController.errorMessage.isNotEmpty
                        ? _postsController.errorMessage
                        : null,
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