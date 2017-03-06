# config valid only for current version of Capistrano
# sudo adduser ilab
# sudo adduser ilab sudo
# su ilab

#### with sudo task for deployment user -ie ilab
#### sudo visudo and add this line ilab ALL=(ALL) NOPASSWD: ALL to skip password task
#### visudo will override .bashrc so better put rbenv init config in rbenv installation to .bash_profile instead of .bashrc


# sudo groupadd deployer
# sudo usermod -a -G deployer ilab
# sudo chown -R ilab:deployer /var/www
# sudo chmod -R g+w /var/www
# sudo chmod go-w -R /var/www warning “Insecure world writable dir /home/chance ” in PATH, mode 040777 http://stackoverflow.com/questions/5380671/getting-the-warning-insecure-world-writable-dir-home-chance-in-path-mode-04
# ssh config for remote server and repo

# env :PATH, ENV['PATH']

lock '3.4.0'

set :rbenv_ruby, File.read('.ruby-version').strip

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

set :application, 'khmer-writing'
set :repo_url, 'https://github.com/ilabsea/khmer-writing'
set :branch, :develop


namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end



# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/setting.yml', 'config/database.yml')
