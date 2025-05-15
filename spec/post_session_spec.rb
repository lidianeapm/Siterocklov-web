require 'httparty'
require 'json'
require 'yaml'

module Helpers
  def get_fixtures(file)
    YAML.load(File.read(Dir.pwd + "/spec/fixtures/#{file}.yml"), symbolize_names: true)
  end

  module_function :get_fixtures
end

describe "Login API" do
  context "login com sucesso" do
    before(:all) do
      signup_payload = {
        name: "Lidiane Serafim",
        email: "lidianeaserafim@gmail.com",
        password: "@Ninguemsabe1"
      }

      # garante que o usuário está criado
      HTTParty.post(
        "http://rocklov-api:3333/signup",
        body: signup_payload.to_json,
        headers: { "Content-Type" => "application/json" }
      )

      login_payload = {
        email: signup_payload[:email],
        password: signup_payload[:password]
      }

      @result = HTTParty.post(
        "http://rocklov-api:3333/sessions",
        body: login_payload.to_json,
        headers: {
          "Content-Type" => "application/json"
        }
      )
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  # Cenários negativos
  examples = Helpers.get_fixtures("login")

  examples.each do |e|
    context "quando #{e[:title]}" do
      before(:all) do
        @result = HTTParty.post(
          "http://rocklov-api:3333/sessions",
          body: e[:payload].to_json,
          headers: {
            "Content-Type" => "application/json"
          }
        )
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

