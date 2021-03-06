namespace :nodejs do
  desc "Install Node.js"
  task :install, roles: :app do
    run "echo | #{sudo} apt-get -y install nodejs"
  end
  after "deploy:install", "nodejs:install"
end