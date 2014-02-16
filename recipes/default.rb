include_recipe "build-essential"
include_recipe "git"
include_recipe "rvm::vagrant"
include_recipe "rvm::user"
package "zsh"

bash "Install ZSH" do
  cwd "/home/ubuntu"
  code <<-EOC
    su ubuntu
    git clone git://github.com/robbyrussell/oh-my-zsh.git /home/ubuntu/.oh-my-zsh
    cp /home/ubuntu/.oh-my-zsh/templates/zshrc.zsh-template /home/ubuntu/.zshrc
    sed -i 's/ZSH_THEME\=.*/ZSH_THEME\=\"kolo\"/g' /home/ubuntu/.zshrc
    sed -i '1i\\ source /etc/profile' /home/ubuntu/.zshrc
    sudo chsh -s /bin/zsh ubuntu
  EOC
end
