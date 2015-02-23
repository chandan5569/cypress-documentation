expect = require("chai").expect
konfig = require("konfig")

describe "Konfig", ->
  beforeEach ->
    @setup = (env) =>
      process.env["NODE_ENV"] = env

      @config = konfig()

      @eq = (key, val) =>
        expect(@config.app[key]).to.eq(val)

  context "development", ->
    beforeEach ->
      @setup("development")

    it "cache_path", ->
      @eq("cache_path", ".cy/cache")

    it "api_url", ->
      @eq("api_url", "http://localhost:1234")

    it "log_path", ->
      @eq("log_path", ".cy/logs")

  context "test", ->
    beforeEach ->
      @setup("test")

    it "cache_path", ->
      @eq("cache_path", ".cy_test/cache")

    it "api_url", ->
      @eq("api_url", "http://localhost:1234")

    it "log_path", ->
      @eq("log_path", ".cy_test/logs")

  context "production", ->
    beforeEach ->
      @setup("production")

    it "cache_path", ->
      @eq("cache_path", ".cy/cache")

    it "api_url", ->
      @eq("api_url", "http://api.cypress.io")