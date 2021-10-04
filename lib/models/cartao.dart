class Cartao {
  int codigo = 0;
  String nome = '';
  int ativo = 0;
  int numero = 0;
  String bandeira = '';
  int codigoSeguranca = 0;
  String dataVencimento = '';

  Cartao(
      { this.codigo = 0,
         this.nome = '',
         this.ativo = 0,
         this.numero = 0,
         this.bandeira = '',
         this.codigoSeguranca = 0,
         this.dataVencimento = ''});

  Cartao.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    nome = json['nome'];
    ativo = json['ativo'];
    numero = json['numero'];
    bandeira = json['bandeira'];
    codigoSeguranca = json['codigoSeguranca'];
    dataVencimento = json['dataVencimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['codigo'] = codigo;
    data['nome'] = nome;
    data['ativo'] = ativo;
    data['numero'] = numero;
    data['bandeira'] = bandeira;
    data['codigoSeguranca'] = codigoSeguranca;
    data['dataVencimento'] = dataVencimento;
    return data;
  }

  Map<String, dynamic> toSqlite() {
    final Map<String, dynamic> data = {};
    data['nome'] = nome;
    data['ativo'] = ativo;
    data['numero'] = numero;
    data['bandeira'] = bandeira;
    data['codigoSeguranca'] = codigoSeguranca;
    data['dataVencimento'] = dataVencimento;
    return data;
  }

  @override
  String toString() {
    return "codigo = $codigo, nome = $nome, ativo = $ativo, numero = $numero, bandeira = $bandeira, codigoSeguranca = $codigoSeguranca, dataVencimento = $dataVencimento";
  }
}