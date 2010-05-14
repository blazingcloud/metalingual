describe Word do
  it "should return search result" do
    word = Word.new({:term => "Speak"})
    word.define

puts "XXX"
puts word.wordnik_definitions


    word.wordnik_definitions.class.should == Array
#    word.wordnik_definitions.length.should != 0

#     word.mightyverse_definitions.class.should == Array
#     word.mightyverse_definitions[0]['phrase']['language'].should == "fr"
#     word.mightyverse_definitions[0]['phrase']['text'].should == "Est-ce que vous pouvez parler plus lentement?"
  end

end
