import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proto/constants/colors.dart';
import 'package:proto/screens/widgets/text_widet.dart';

class MyServicesWidget extends StatefulWidget {
  final Size size;
  const MyServicesWidget({super.key, required this.size});

  @override
  State<MyServicesWidget> createState() => _MyServicesWidgetState();
}

class _MyServicesWidgetState extends State<MyServicesWidget> {
  List<bool> _isHovered = [false, false, false];

  final List<Map<String, String>> services = [
    {
      'title': 'UI/UX Design',
      'description':
          'Design intuitive user interfaces that enhance user experience and drive engagement.',
    },
    {
      'title': 'Performance Optimization',
      'description':
          'Optimize applications for speed and efficiency, ensuring fast load times.',
    },
    {
      'title': 'Maintenance and Support',
      'description':
          'Provide ongoing support to keep your applications up-to-date and functional.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: services.length,
      itemBuilder: (context, index) {
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered[index] = true),
          onExit: (_) => setState(() => _isHovered[index] = false),
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            duration: Duration(microseconds: 300),
            curve: Curves.easeInOut,
            margin: EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
            width: widget.size.width,
            decoration: BoxDecoration(
              color: _isHovered[index] ? null : Colors.transparent,
              border: Border.all(
                color: _isHovered[index]
                    ? AppColors.studio.withOpacity(0.5)
                    : Colors.transparent,
              ),
              gradient: _isHovered[index]
                  ? LinearGradient(colors: [
                      AppColors.studio,
                      AppColors.ebony,
                    ])
                  : null,
            ),
            child: widget.size.width > 600
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextWidget(
                        sSize: widget.size,
                        text: "${index + 1}",
                        size: 28,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: widget.size.height * 0.04,
                      ),
                      TextWidget(
                        sSize: widget.size,
                        text: services[index]['title']!,
                        size: 22,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: widget.size.height * 0.08,
                      ),
                      Flexible(
                        child: TextWidget(
                          sSize: widget.size,
                          text: services[index]['description']!,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      FaIcon(
                        _isHovered[index]
                            ? FontAwesomeIcons.arrowTrendUp
                            : FontAwesomeIcons.arrowTrendDown,
                        color:
                            _isHovered[index] ? Colors.white : AppColors.studio,
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextWidget(
                        sSize: widget.size,
                        text: "${index + 1}",
                        size: 22,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: widget.size.height * 0.04,
                      ),
                      TextWidget(
                        sSize: widget.size,
                        text: services[index]['title']!,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: widget.size.height * 0.08,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          TextWidget(
                            alignment: TextAlign.center,
                            sSize: widget.size,
                            text: services[index]['description']!,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
