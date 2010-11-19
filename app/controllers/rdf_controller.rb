class RdfController < ApplicationController
  def show
    s = SPARQL::Client.new(TRIPLESTORE['sparql-uri'])
  end
end
