include_recipe "build-essential"
include_recipe "git"
include_recipe "rvm::vagrant"
include_recipe "rvm::user"
package "zsh"

bash "Install ZSH" do
  cwd "/home/vagrant"
  code <<-EOC
    su vagrant
    git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
    cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
    sed -i 's/ZSH_THEME\=.*/ZSH_THEME\=\"kolo\"/g' /home/vagrant/.zshrc
    sed -i '1i\\ source /etc/profile' /home/vagrant/.zshrc
    sudo chsh -s /bin/zsh vagrant
  EOC
end