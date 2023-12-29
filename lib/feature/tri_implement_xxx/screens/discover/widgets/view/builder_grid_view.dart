import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/sounds.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/widgets/view/grid_view_song.dart';
import 'package:provider/provider.dart';

class BuilderGridView extends StatelessWidget {
  const BuilderGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final soundsProvider = Provider.of<SoundsProvider>(context);
    return FutureBuilder<List>(
      future: soundsProvider.fetchAlbumData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const GridViewSongs();
        } else if (snapshot.hasError) {
          throw Exception('${snapshot.stackTrace}');
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.textPrimary,
            ),
          );
        }
      },
    );
  }
}
