class Word
  @@count = 3;
  @@wordnik_url_prefix = "http://api.wordnik.com/api/word.json/"
  @@wordnik_headers = {'api_key' => Rho::RhoConfig.wordnik_key}
  @@mightyverse_url_prefix = "http://www.mightyverse.com/search/target_language/en.json?count=#{@@count}&api_key=#{Rho::RhoConfig.mightyverse_key}&term="

  attr_reader :wordnik_definitions, :mightyverse_definitions

  def define
    fetch_wordnik_definitions
    fetch_mightyverse_definitions
  end

  def fetch_wordnik_definitions
    term = self.vars[:term].downcase
    url = @@wordnik_url_prefix + term + "/definitions?count=#{@@count}"
    response = Rho::AsyncHttp.get({:url => url, :headers => @@wordnik_headers})
    @wordnik_definitions = response['status'] == 'ok' ? response['body'] : []
  end

  def fetch_mightyverse_definitions
    url = @@mightyverse_url_prefix + term

    if System::get_property('platform') == 'APPLE'
      url += '&content_type=video/quicktime'
    else
      url += '&content_type=video/mp4'
    end

    response = Rho::AsyncHttp.get({:url => url})
    @mightyverse_definitions = response['status'] == 'ok' ? response['body']['result'] : []
  end

end
