require 'net/http'

class RdfController < ApplicationController
  def show
    uri = Rails::TRIPLESTORE['base-uri'] + params['rdf_uri']
    query = "CONSTRUCT { <#{uri}> ?p ?o } WHERE { <#{uri}> ?p ?o }"
    puts query
    results = Net::HTTP.post_form(URI.parse(Rails::TRIPLESTORE['sparql-uri']), { 'query' => query })
    puts results
    render :text => results.body
  end
end
