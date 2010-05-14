# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here

class Word
  @@wordnik_url_prefix = "http://api.wordnik.com/api/word.json/"
  @@wordnik_headers = {'api_key' => ""}
  @@mightyverse_url = "http://localhost:3000/mightyverse.json"

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
    response = Rho::AsyncHttp.get({:url => @@mightyverse_url})
    @mightyverse_definitions = response['status'] == 'ok' ? response['body'] : []
  end

end
