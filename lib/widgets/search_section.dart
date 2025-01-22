import 'package:flutter/material.dart';
import 'package:gen_code_ai/services/web_socket_service.dart';
import 'package:gen_code_ai/theme/app_color.dart';
import 'package:gen_code_ai/widgets/search_bar_button.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();
  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Where Knowledge begins',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.5,
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Container(
          width: 700,
          decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.searchBarBorder,
              width: 1.5,
            ),
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: queryController,
                decoration: InputDecoration(
                  hintText: 'Search anything...',
                  hintStyle: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  SearchBarButton(
                    icon: Icons.auto_awesome_outlined,
                    text: 'Focus',
                  ),
                  const SizedBox(width: 12),
                  SearchBarButton(
                    icon: Icons.add_circle_outline_outlined,
                    text: 'Attach',
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      ChatWebService().chat(queryController.text.trim());
                    },
                    child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: AppColors.submitButton,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: AppColors.background,
                        size: 16,
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }
}
