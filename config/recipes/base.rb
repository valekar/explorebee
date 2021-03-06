def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  task :install do
    run "#{sudo} apt-get -y update"
    run "echo | #{sudo} apt-get -y install python-software-properties"
    run "echo | #{sudo} apt-get -y install software-properties-common"
  end
end