Rails::TRIPLESTORE = YAML.load_file(File.join(Rails.root, "/config/triplestore.yml"))[Rails.env]
