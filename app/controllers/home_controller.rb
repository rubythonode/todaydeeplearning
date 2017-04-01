class HomeController < ApplicationController
  def index
    raw_papers = ArvixGetter.new().papers
    hashed = Hash.from_xml(raw_papers)
    entries = hashed["feed"]["entry"]
    entry = entries[0]
    parsed_entry = ArvixParser.new(entry).parse
  end
end