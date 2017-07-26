module AmazonSellerCentral
  class Client
    attr_reader(
      :aws_access_key_id,
      :mws_auth_token,
      :marketplaces,
      :seller_id,
      :mws_endpoint)

    def initialize(
      aws_access_key_id,
      mws_auth_token,
      marketplaces,
      seller_id,
      region)

      @aws_access_key_id = aws_access_key_id
      @mws_auth_token = mws_auth_token
      @seller_id = seller_id

      raise "AWS Access Key ID, MWS Auth Token & Selled ID must be provided" if [@aws_access_key_id, @mws_auth_token, @seller_id].any? { |val| val.blank? }

      @mws_endpoint = REGION_HASH[region.to_s.downcase] ? REGION_HASH[region.to_s.downcase] : raise("Region is invalid")

      @marketplaces = marketplaces.split(/[\s]*,[\s]*/)
      raise("Marketplace is invalid") if @marketplaces.any? { |marketplace| MARKETPLACE_HASH[marketplace.to_s.downcase].blank? }
    end

    private

    MARKETPLACE_HASH = {
      "ca" => "A2EUQ1WTGCTBG2",
      "mx" => "A1AM78C64UM0Y8",
      "us" => "ATVPDKIKX0DER",
      "br" => "A2Q3Y263D00KWC",
      "de" => "A1PA6795UKMFR9",
      "es" => "A1RKKUPIHCS9HS",
      "fr" => "A13V1IB3VIYZZH",
      "it" => "APJ6JRA9NG5V4",
      "uk" => "A1F83G8C2ARO7P",
      "in" => "A21TJRUUN4KGV",
      "jp" => "A1VC38T7YXB528",
      "cn" => "AAHKV2X7AFYLW"
    }.freeze

    REGION_HASH = {
      "na" => "https://mws.amazonservices.com",
      "br" => "https://mws.amazonservices.com",
      "eu" => "https://mws-eu.amazonservices.com",
      "in" => "https://mws.amazonservices.in",
      "cn" => "https://mws.amazonservices.com.cn",
      "jp" => "https://mws.amazonservices.jp"
    }.freeze
  end
end
