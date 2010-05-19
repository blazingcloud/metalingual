class Word
  @@wordnik_url_prefix = "http://api.wordnik.com/api/word.json/"
  @@wordnik_headers = {'api_key' => Rho::RhoConfig.wordnik_key}
  @@mightyverse_url_prefix = "http://mightyverse-staging.heroku.com/search/target_language/en.json?dimension=400x300&content_type=video/quicktime&term="

  attr_reader :wordnik_definitions, :mightyverse_definitions

  def define
    fetch_wordnik_definitions
    fetch_mightyverse_definitions
  end

  def fetch_wordnik_definitions
    term = self.vars[:term].downcase
    url = @@wordnik_url_prefix + term + "/definitions"
    response = Rho::AsyncHttp.get({:url => url, :headers => @@wordnik_headers})
    @wordnik_definitions = response['status'] == 'ok' ? response['body'] : []
  end

  def fetch_mightyverse_definitions
    url = @@mightyverse_url_prefix + term
    response = Rho::AsyncHttp.get({:url => url})
    @mightyverse_definitions = response['status'] == 'ok' ? response['body']['result'] : []
  end

end
