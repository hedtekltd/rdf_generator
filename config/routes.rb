RdfGenerator::Application.routes.draw do
  match '/*rdf_uri' => 'rdf#show'
end
