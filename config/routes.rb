RdfGenerator::Application.routes.draw do
  match '/' => 'rdf#index'
  match '/*rdf_uri' => 'rdf#show'
end
