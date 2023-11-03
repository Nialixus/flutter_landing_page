part of '../env.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
            child: DImage(
                source:
                    'https://th.bing.com/th/id/R.b01da8d9ea4f47384795c36879f6b1ca?rik=7hviKW3Hl58t3w&riu=http%3a%2f%2fwallsdesk.com%2fwp-content%2fuploads%2f2016%2f11%2fAbstract-Lines-HD-Wallpaper.jpg&ehk=liK0sx2RBFedaGldXSI3SMSIbpb2Eu80e%2fccqZyTw8o%3d&risl=&pid=ImgRaw&r=0')),
        child
      ],
    );
  }
}
