## INSTALATION

### Install asdf
```
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
git clone https://github.com/excid3/asdf.git ~/.asdf
cd
ls
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
echo 'legacy_version_file = yes' >> ~/.asdfrc
echo 'export EDITOR="code --wait"' >> ~/.bashrc
exec $SHELL
```

### Install ruby and project
```
asdf plugin list all
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 3.3.3
asdf list
git clone <repository>
cd <repository>
asdf local ruby 3.3.3
```

### Prepare project
```
gem install bundler
bundle install
bundle exec jekyll s
```
