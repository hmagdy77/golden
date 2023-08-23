import '../../../libraries.dart';

class ActivtyItem extends StatelessWidget {
  const ActivtyItem({
    super.key,
    required this.post,
  });
  final Post post;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: () {
        Get.toNamed(AppRoutes.activtiyDetailsScreen, arguments: [post]);
      },
      hoverColor: AppColorManger.grey,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColorManger.backdark,
        ),
        height: AppSizes.h15,
        // width: AppSizes.w14,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyImage(
              url: '${Api.viewPostsImages}/${post.image}',
              width: AppSizes.w13,
              height: AppSizes.h1,
            ),
            Text(
              post.title.maxLength(10),
              style: context.textTheme.displaySmall!
                  .copyWith(color: AppColorManger.lightScaffold),
            )
          ],
        ),
      ),
      // onTap: () {
      //   Get.toNamed(AppRoutes.activtiyDetailsScreen, arguments: [post]);
      // },
    );
  }
}

/*

showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Golden Sports',
              ),
              content: Text(
                textAlign: TextAlign.right,
                '${content}',
                style: TextStyle(fontSize: 18),
              ),
            );
          },
        );

 */

/*

ActivtyItem_dialog(
                  color: color,
                  title: '${title}',
                  icon: icon,
                  content: '${content}',
                ),


 */

/*

children: [
            item(
                color: Colors.blue[900],
                title: 'جولدن سويمنج',
                icon: IconData(0xee52, fontFamily: 'MaterialIcons'),
                ontap: () {},
                content: '${swiming}'),
            SizedBox(
              height: 30,
            ),
            item(
                color: Colors.red[900],
                title: 'جولدن ملاكمة',
                icon: IconData(0xeedd, fontFamily: 'MaterialIcons'),
                ontap: () {},
                content: '${box}'),
            SizedBox(
              height: 30,
            ),
            item(
                color: Colors.blue[700],
                title: 'جولدن كارتية',
                icon: IconData(0xe491, fontFamily: 'MaterialIcons'),
                ontap: () {},
                content: '${kratee}'),
            SizedBox(
              height: 30,
            ),
            item(
                color: Color(0xFFFf78da7),
                title: 'جولدن جمباز',
                icon: IconData(0xeeb1, fontFamily: 'MaterialIcons'),
                ontap: () {},
                content: '${jmbaz}'),
            SizedBox(
              height: 30,
            ),
            item(
                color: Colors.red,
                title: 'جولدن فتنس',
                icon: IconData(0xe5f9, fontFamily: 'MaterialIcons'),
                ontap: () {},
                content: '${fitness}'),
            SizedBox(
              height: 30,
            ),
            item(
                color: Colors.orange,
                title: 'جولدن لكرة القدم',
                icon: IconData(0xeed9, fontFamily: 'MaterialIcons'),
                ontap: () {},
                content: '${football}'),
            SizedBox(
              height: 30,
            ),
            item(
                color: Color.fromRGBO(238, 44, 130, 2),
                title: 'جولدين تايكوندو',
                icon: IconData(0xe5e3, fontFamily: 'MaterialIcons'),
                ontap: () {},
                content: '${taykondo}'),
            SizedBox(
              height: 30,
            ),
            item(
                color: Colors.green,
                title: 'جولدن كونغ فو',
                icon: IconData(0xe491, fontFamily: 'MaterialIcons'),
                ontap: () {},
                content: '${kongfo}'),
            SizedBox(
              height: 30,
            ),
          ],

 */
