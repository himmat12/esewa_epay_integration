class EsewaConfiguration {
  String? clientId;
  String? clientSecret;
  String? enviroment;

  EsewaConfiguration({
    this.clientId,
    this.clientSecret,
    this.enviroment,
  });

  factory EsewaConfiguration.fromJson(Map<String, dynamic> data) =>
      EsewaConfiguration(
        clientId: data["client_id"],
        clientSecret: data["client_secret"],
        enviroment: data["enviroment"],
      );

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "client_secret": clientSecret,
        "enviroment": enviroment,
      };
}
