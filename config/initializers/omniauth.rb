OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer if Rails.env.development?
    provider :github, '1a2aa994738ffd34088e', '6bb308c49094b5e4cb2f2102b9c0c9e2cd6cde95', 
    { :name => "github", :scope => ['read:user', 'user:email']}
end