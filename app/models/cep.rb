require 'net/http'

class CEP
    attr_reader :logradouro, :localidade, :bairro, :uf

    def initialize(cep)
        cep_encontrado = encontrar(cep)
        preencher_dados(cep_encontrado)
    end

    def endereco
        "Rua #{@logradouro}, #{@bairro}."
      end

    private

    def preencher_dados(cep_encontrado)
        @logradouro = cep_encontrado["logradouro"]
        @bairro     = cep_encontrado["bairro"]
        @uf         = cep_encontrado["uf"]
        @localidade = cep_encontrado["localidade"]
    end


    def encontrar(cep)
        ActiveSupport::JSON.decode(
            Net::HTTP.get(
            URI("https://viacep.com.br/ws/#{cep}/json/")
            )
        )
    end
end