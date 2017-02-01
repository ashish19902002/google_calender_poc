OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '256765835013-vq9jtavh2s144rg90u1n2bb85ot3b28a.apps.googleusercontent.com', 'zfqaUsz-9ZqOB3S4KhmDMp9J', { access_type: "offline", approval_prompt: "", scope: 'userinfo.email,calendar'}
end