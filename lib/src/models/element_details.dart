class ChemicalElementDetails {
  final String name;
  final String appearance;
  final double atomicMass;
  final double boil;
  final String category;
  final double density;
  final String discoveredBy;
  final double melt;
  final double molarHeat;
  final String namedBy;
  final int number;
  final int period;
  final int group;
  final String phase;
  final String source;
  final String bohrModelImage;
  final String bohrModel3d;
  final String spectralImg;
  final String summary;
  final String symbol;
  final int xpos;
  final int ypos;
  final int wxpos;
  final int wypos;
  final List<int> shells;
  final String electronConfiguration;
  final String electronConfigurationSemantic;
  final double electronAffinity;
  final double electronegativityPauling;
  final List<double> ionizationEnergies;
  final String cpkHex;
  final ImageDetails image;
  final String block;

  ChemicalElementDetails({
    required this.name,
    required this.appearance,
    required this.atomicMass,
    required this.boil,
    required this.category,
    required this.density,
    required this.discoveredBy,
    required this.melt,
    required this.molarHeat,
    required this.namedBy,
    required this.number,
    required this.period,
    required this.group,
    required this.phase,
    required this.source,
    required this.bohrModelImage,
    required this.bohrModel3d,
    required this.spectralImg,
    required this.summary,
    required this.symbol,
    required this.xpos,
    required this.ypos,
    required this.wxpos,
    required this.wypos,
    required this.shells,
    required this.electronConfiguration,
    required this.electronConfigurationSemantic,
    required this.electronAffinity,
    required this.electronegativityPauling,
    required this.ionizationEnergies,
    required this.cpkHex,
    required this.image,
    required this.block,
  });

  factory ChemicalElementDetails.fromJson(Map<String, dynamic> json) {
    return ChemicalElementDetails(
      name: json['name'],
      appearance: json['appearance'],
      atomicMass: json['atomic_mass'].toDouble(),
      boil: json['boil']?.toDouble(),
      category: json['category'],
      density: json['density']?.toDouble(),
      discoveredBy: json['discovered_by'],
      melt: json['melt']?.toDouble(),
      molarHeat: json['molar_heat']?.toDouble(),
      namedBy: json['named_by'],
      number: json['number'],
      period: json['period'],
      group: json['group'],
      phase: json['phase'],
      source: json['source'],
      bohrModelImage: json['bohr_model_image'],
      bohrModel3d: json['bohr_model_3d'],
      spectralImg: json['spectral_img'],
      summary: json['summary'],
      symbol: json['symbol'],
      xpos: json['xpos'],
      ypos: json['ypos'],
      wxpos: json['wxpos'],
      wypos: json['wypos'],
      shells: List<int>.from(json['shells']),
      electronConfiguration: json['electron_configuration'],
      electronConfigurationSemantic: json['electron_configuration_semantic'],
      electronAffinity: json['electron_affinity']?.toDouble(),
      electronegativityPauling: json['electronegativity_pauling']?.toDouble(),
      ionizationEnergies: json['ionization_energies'] != null
          ? List<double>.from(
              json['ionization_energies'].map((e) => e.toDouble()))
          : [],
      cpkHex: json['cpk-hex'],
      image: ImageDetails.fromJson(json['image']),
      block: json['block'],
    );
  }
}

class ImageDetails {
  final String title;
  final String url;
  final String attribution;

  ImageDetails({
    required this.title,
    required this.url,
    required this.attribution,
  });

  factory ImageDetails.fromJson(Map<String, dynamic> json) {
    return ImageDetails(
      title: json['title'],
      url: json['url'],
      attribution: json['attribution'],
    );
  }
}
