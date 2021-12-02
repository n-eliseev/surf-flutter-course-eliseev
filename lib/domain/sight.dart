class Sight {
  
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final int type;

  const Sight({
    required this.name,
    required this.type,
    required this.details,
    required this.lat,
    required this.lon,
    required this.url
  });
}
