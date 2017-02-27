# Add `~/bin` to the `$PATH`
# export PATH="$HOME/bin:$PATH";
export PATH=/usr/local/bin:$PATH;


#M2_HOME=/usr/local/apache-maven/apache-maven-3.0.4
export M2_HOME=/usr/local/Cellar/maven/3.3.3/libexec


# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#source $(brew --prefix nvm)/nvm.sh
nvm alias default 4.7.0

eval "$(chef shell-init bash)"
export CHEF_USER=mandd003

# JMeter
export JMETER_HOME=/usr/local/bin/jmeter


# The next line updates PATH for the Google Cloud SDK.
source '/Users/dmandel/SDK/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/dmandel/SDK/google-cloud-sdk/completion.bash.inc'

eval "$(rbenv init -)"

# RubyGEMS
export GEM_ROOT=/Users/dmandel/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0
export GEM_PATH=/Users/dmandel/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0:/Users/dmandel/.rbenv/versions/2.1.5/lib/ruby/gems/2.1.0:/Users/dmandel/.chefdk/gem/ruby/2.1.0:/opt/chefdk/embedded/lib/ruby/gems/2.1.0
export GEM_HOME=/Users/dmandel/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0

export VAULT_ADDR=https://devkeys.disney.network

# Python
PYTHONPATH="/lib/python2.7/site-packages/:/usr/local/Cellar/python/2.7.12/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages:/Library/Python/2.7/site-packages"
export PYTHONPATH

