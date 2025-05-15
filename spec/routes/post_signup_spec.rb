require_relative "../services/signup"
require_relative "../helpers"
require "yaml"

describe "POST /signup" do
  context "quando cadastro é bem-sucedido" do
    before(:all) do
      payload = {
        name: "Lucas Serafim",
        email: "lucas_#{Time.now.to_i}@gmail.com", # email dinâmico para não dar conflito
        password: "pwd123"
      }

      @result = Signup.new.create(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  Helpers.get_fixtures("signup").each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Signup.new.create(e[:payload])
      end

      it "valida status code" do
        expect(@result.code).to eql e[:code]
      end

      it "valida mensagem de erro" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
