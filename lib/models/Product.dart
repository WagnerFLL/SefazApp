class Product {
  String codGetin;
  String codNcm;
  String dscProduto;
  num valMinimoVendido;
  num valMaximoVendido;
  String dthEmissaoUltimaVenda;
  num valUnitarioUltimaVenda;
  num valUltimaVenda;
  String numCNPJ;
  String nomRazaoSocial;
  String nomFantasia;
  String numTelefone;
  String nomLogradouro;
  String numImovel;
  String nomBairro;
  String numCep;
  String nomMunicipio;
  double numLatitude;
  double numLongitude;

  Product(this.codGetin, this.codNcm,
      this.dscProduto, this.valMinimoVendido, this.valMaximoVendido,
      this.dthEmissaoUltimaVenda, this.valUnitarioUltimaVenda,
      this.valUltimaVenda, this.numCNPJ, this.nomRazaoSocial, this.nomFantasia,
      this.numTelefone, this.nomLogradouro, this.numImovel, this.nomBairro,
      this.numCep, this.nomMunicipio, this.numLatitude, this.numLongitude);

  Product.fromJson(Map json)
      : codGetin = json['codGetin'],
        codNcm = json['codNcm'],
        dscProduto = json['dscProduto'],
        valMinimoVendido = json['valMinimoVendido'],
        valMaximoVendido = json['valMaximoVendido'],
        dthEmissaoUltimaVenda = json['dthEmissaoUltimaVenda'],
        valUnitarioUltimaVenda = json['valUnitarioUltimaVenda'],
        valUltimaVenda = json['valUltimaVenda'],
        numCNPJ = json['numCNPJ'],
        nomRazaoSocial = json['nomRazaoSocial'],
        nomFantasia = json['nomFantasia'],
        numTelefone = json['numTelefone'],
        nomLogradouro = json['nomLogradouro'],
        numImovel = json['numImovel'],
        nomBairro = json['nomBairro'],
        numCep = json['numCep'],
        nomMunicipio = json['nomMunicipio'],
        numLatitude = json['numLatitude'],
        numLongitude = json['numLongitude'];

  Map toJson() {
    return {'id': 0, 'name': "sn", 'email': "k"};
  }
}
