require 'rest_client'

module WhitLi
  class Client

    attr_accessor :api_key

    def initialize api_key
      @api_key = api_key
    end

    def import_token fb_id, token
      api_call "user/importToken", "post", { :uid => fb_id, :oauth_token => token }
    end

    def populate fb_id
      api_call "user/populate", "get", { :uid => fb_id }
    end

    def import_generic request_body
      api_call "user/importGeneric", "put", { :RequestBody => request_body }
    end

    def get fb_id, key_id, schema = "fb"
      api_call "key/get", "get", { :uid => fb_id, :key_id => key_id, :schema => schema }
    end

    def compare fb_id_1, fb_id_2, context_id, schema = "fb"
      api_call "key/compare", "get", { :uid1 => fb_id_1, :uid2 => fb_id_2, :context_id => context_id, :schema => schema }
    end

    private

    def api_call path, method = "get", params = {}
      params = params.merge({:api_key => @api_key, :format => WhitLi::Config::FORMAT})
      begin
        response = RestClient.send method, [WhitLi::Config::API_URL, path].join("/")+"."+params[:format], { :params => params }
      rescue => e
        raise_errors e.response  
      end
      raise_errors response
      WhitLi::Mash.from_json response.body
    end

    def raise_errors response
      case response.code.to_i
      when 400
        data = Mash.from_json(response.body)
        raise WhitLi::Errors::GeneralError.new(data), "(#{data.status}): #{data.message}"
      when 403
        raise WhitLi::Errors::AccessDeniedError, "(#{response.code}): #{response.message}"
      when 405, 401
        raise WhitLi::Errors::UnauthorizedError, "(#{response.code}): #{response.message}"
      when 404
        raise WhitLi::Errors::NotFoundError, "(#{response.code}): #{response.message}"
      when 500
        raise WhitLi::Errors::InformWhitLiError, "WhitLi had an internal error. (#{response.code}): #{response.message}"
      when 502..503
        raise WhitLi::Errors::UnavailableError, "(#{response.code}): #{response.message}"
      end
    end

  end
end