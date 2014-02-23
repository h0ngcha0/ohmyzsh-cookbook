include_recipe "build-essential"
include_recipe "git"
include_recipe "rvm::vagrant"
include_recipe "rvm::user"
package "zsh"

bash "Install ZSH" do
  cwd "/home/hongchao.liu"
  code <<-EOC
    su hongchao.liu
    git clone git://github.com/robbyrussell/oh-my-zsh.git /home/hongchao.liu/.oh-my-zsh
    cp /home/hongchao.liu/.oh-my-zsh/templates/zshrc.zsh-template /home/hongchao.liu/.zshrc
    sed -i 's/ZSH_THEME\=.*/ZSH_THEME\=\"kolo\"/g' /home/hongchao.liu/.zshrc
    sed -i '1i\\ source /etc/profile' /home/hongchao.liu/.zshrc
    sudo chsh -s /bin/zsh hongchao.liu
  EOC
end
