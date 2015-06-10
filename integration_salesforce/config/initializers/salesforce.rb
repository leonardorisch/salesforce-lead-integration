$salesforce_config = YAML.load_file(File.join(Rails.root, 'config', 'salesforce.yml'))[Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :salesforce, $salesforce_config["client_key"], $salesforce_config["client_secret"]
end

OmniAuth.config.on_failure = Proc.new do |env|
  SalesforceController.action(:failure).call(env) if env["omniauth.strategy"].is_a? OmniAuth::Strategies::Salesforce
end

