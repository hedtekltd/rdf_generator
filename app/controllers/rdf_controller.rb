require 'net/http'

class RdfController < ApplicationController
  def index
    query = "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \n PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n CONSTRUCT { ?s rdf:type rdfs:Class } WHERE { ?s rdf:type rdfs:Class }"
    puts query
    results = Net::HTTP.post_form(URI.parse(Rails::TRIPLESTORE['sparql-uri']), { 'query' => query })
    puts results
    render :text => results.body, :content_type => "application/rdf+xml"
  end
  def show
    uri = Rails::TRIPLESTORE['base-uri'] + params['rdf_uri']
    query = "CONSTRUCT { <#{uri}> ?p ?o . ?s ?r <#{uri}> } WHERE { { <#{uri}> ?p ?o } UNION { ?s ?r <#{uri}> } }"
    results = Net::HTTP.post_form(URI.parse(Rails::TRIPLESTORE['sparql-uri']), { 'query' => query })
    render :text => results.body, :content_type => "application/rdf+xml"
  end
end
