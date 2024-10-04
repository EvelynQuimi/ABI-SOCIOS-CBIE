import 'package:app_socios/src/Controller/PostProvider.dart';
import 'package:app_socios/src/view/inside/Home/Carrusel_post.dart';
import 'package:app_socios/src/view/inside/Home/home_screen.dart';
import 'package:app_socios/utils/global.dart';
import 'package:app_socios/utils/sliders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'PostsPage.dart';

class PickerCropResultScreen extends StatelessWidget {
  const PickerCropResultScreen({super.key, required this.cropStream});

  final Stream<InstaAssetsExportDetails> cropStream;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height - kToolbarHeight;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Nueva publicación')),
        body: StreamBuilder<InstaAssetsExportDetails>(
          initialData: null,
          stream: cropStream,
          builder: (context, snapshot) => CropResultView(
            result: snapshot.data,
            heightFiles: height / 2,
            heightAssets: height / 4,
          ),
        ),
      ),
    );
  }
}

class CropResultView extends StatefulWidget {
  const CropResultView({
    super.key,
    required this.result,
    this.heightFiles = 350.0,
    this.heightAssets = 120.0,
  });

  final InstaAssetsExportDetails? result;
  final double heightFiles;
  final double heightAssets;

  @override
  State<CropResultView> createState() => _CropResultViewState();
}

class _CropResultViewState extends State<CropResultView> {
  List<InstaAssetsExportData?> get data => widget.result?.data ?? [];

  List<AssetEntity> get selectedAssets => widget.result?.selectedAssets ?? [];

  Widget _buildTitle(String title, int length) {
    return SizedBox(
      height: 20.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(title),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.all(4.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 243, 121, 45),
            ),
            child: Text(
              length.toString(),
              style: const TextStyle(color: Colors.white, height: .7),
            ),
          ),
        ],
      ),
    );
  }

  int _current = 0;
  List<Slide> listCropped = [];

  void inicializarListaSlide() async {
    setState(() {
      listCropped.clear();
    });

    if (widget.result != null && widget.result!.data.isNotEmpty) {
      for (var i = 0; data.length > i; i++) {
        listCropped.add(
            Slide(height: 100.0 + i * 50, path: data[i]!.croppedFile!.path));
      }
    }

    sliders = slidesWidget(listCropped);
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildCroppedAssetsListView(BuildContext context) {
    if (widget.result?.progress == null) {
      return const SizedBox.shrink();
    }

    final double progress = widget.result!.progress;

    inicializarListaSlide();

    return Expanded(
      child: Stack(
        //alignment: Alignment.center,
        children: [
          FlutterCarousel(
            items: sliders,
            options: FlutterCarouselOptions(
                floatingIndicator: true,
                autoPlay: false,
                viewportFraction: 1.0,
                initialPage: 0,
                showIndicator: false,

                ///height: 350,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          if (progress < 1.0)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.5),
                ),
              ),
            ),
          if (progress < 1.0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: SizedBox(
                  height: 6,
                  child: LinearProgressIndicator(
                    value: progress,
                    semanticsLabel: '${progress * 100}%',
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSelectedAssetsListView() {
    if (selectedAssets.isEmpty) return const SizedBox.shrink();

    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: selectedAssets.length,
        itemBuilder: (BuildContext _, int index) {
          final AssetEntity asset = selectedAssets[index];

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            // TODO : add delete action
            child: RepaintBoundary(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image(image: AssetEntityImageProvider(asset)),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            duration: kThemeChangeDuration,
            curve: Curves.easeInOut,
            height: data.isNotEmpty ? widget.heightFiles : 40.0,
            child: Column(
              children: <Widget>[
                //_buildTitle('Imágenes a publicar', data.length),
                _buildCroppedAssetsListView(context),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listCropped.asMap().entries.map((entry) {
                return Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? const Color.fromARGB(255, 194, 110, 110)
                            : const Color.fromARGB(252, 247, 129, 38))
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                );
              }).toList(),
            ),
          ),
          AnimatedContainer(
            duration: kThemeChangeDuration,
            curve: Curves.easeInOut,
            height: selectedAssets.isNotEmpty ? widget.heightAssets : 20.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                maxLines: 2,
                decoration:
                    InputDecoration(labelText: 'Escriba su comentario...'),
              ),
            ),
            //_buildSelectedAssetsListView(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 120,
              child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        const Color.fromARGB(255, 11, 128, 224))),
                onPressed: widget.result != null &&
                        widget.result?.progress != null &&
                        widget.result!.progress >= 1 &&
                        selectedAssets.isNotEmpty
                    ? () {
                        context
                            .read<PostProvider>()
                            .uploadNewPost(widget.result!);
                        // go back to main and open post list page
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => PostsPage(),
                          ),
                          (route) => route.isFirst,
                        );
                      }
                    : null,
                //icon: const Icon(Icons.cloud_upload),
                label: const Text('Publicar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PickerResultPreview extends InstaAssetVideoPlayerStatefulWidget {
  PickerResultPreview({
    super.key,
    required this.cropData,
    super.isAutoPlay,
    super.isLoop,
  }) : super(asset: cropData.asset);

  final InstaAssetsCropData cropData;

  @override
  State<PickerResultPreview> createState() => _PickerResultVideoPlayerState();
}

class _PickerResultVideoPlayerState extends State<PickerResultPreview>
    with InstaAssetVideoPlayerMixin {
  @override
  Widget buildLoader() => const Center(child: CircularProgressIndicator());

  @override
  Widget buildInitializationError() =>
      const Center(child: Text('Lo siento, el vídeo no se pudo cargar.'));

  @override
  Widget buildVideoPlayer() {
    return GestureDetector(
      onTap: playButtonCallback,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          InstaAssetCropTransform(
            asset: widget.asset,
            cropParam: widget.cropData.cropParam,
            child: VideoPlayer(videoController!),
          ),
          if (videoController != null)
            AnimatedBuilder(
              animation: videoController!,
              builder: (_, __) => AnimatedOpacity(
                opacity: isControllerPlaying ? 0 : 1,
                duration: kThemeAnimationDuration,
                child: CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black.withOpacity(0.7),
                  radius: 24,
                  child: const Icon(Icons.play_arrow_rounded, size: 40),
                ),
              ),
            ),
        ],
      ),
    );
  }

  /*override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        widget.asset.type == AssetType.image
            ? InstaAssetCropTransform(
                asset: widget.asset,
                cropParam: widget.cropData.cropParam,
                child: Image(image: AssetEntityImageProvider(widget.asset)),
              )
            : buildDefault(),
        const Text('⚠️Atención⚠️', style: TextStyle(color: Colors.redAccent)),
      ],
    );*/
}
