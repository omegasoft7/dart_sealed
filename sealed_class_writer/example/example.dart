import 'package:sealed_class_writer/sealed_class_writer.dart';

void main() {
  final source = Manifest(
    name: 'Weather',
    items: [
      ManifestItem(
        name: 'WeatherSunny',
        shortName: 'sunny',
        equality: ManifestEquality.data,
        fields: [],
      ),
      ManifestItem(
        name: 'WeatherRainy',
        shortName: 'rainy',
        equality: ManifestEquality.data,
        fields: [
          ManifestField(
            name: 'rain',
            type: ManifestType(
              name: 'int',
              isNullable: false,
            ),
          ),
        ],
      ),
    ],
    params: [],
    fields: [],
  );

  print('==============');
  print('FORWARD WRITER');
  print('==============');

  final forward = SourceWriter(source, referToManifest: false);
  print(forward.write());

  print('===============');
  print('BACKWARD WRITER');
  print('===============');

  final backward = BackwardWriter(source);
  print(backward.write());
}
