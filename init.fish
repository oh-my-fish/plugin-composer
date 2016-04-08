# add Composer's global binaries to PATH
if test -z "$COMPOSER_BIN_PATH"
  if test -n "$COMPOSER_HOME"
    set -gx COMPOSER_BIN_PATH $COMPOSER_HOME/vendor/bin
  else if test -n "$XDG_CONFIG_HOME"
    set -gx COMPOSER_BIN_PATH $XDG_CONFIG_HOME/composer/vendor/bin
  else if test -d "$HOME/.config/composer"
    set -gx COMPOSER_BIN_PATH $HOME/.config/composer/vendor/bin
  else
    set -gx COMPOSER_BIN_PATH $HOME/.composer/vendor/bin
  end
end

if not contains "$COMPOSER_BIN_PATH" $PATH
  set PATH "$COMPOSER_BIN_PATH" $PATH
end

# get composer path
if test -z "$COMPOSER_BIN"
  if type -q composer.phar
    set -gx COMPOSER_BIN (which composer.phar)
  else if type -q composer
    set -gx COMPOSER_BIN (which composer)
  else
    echo "FAILED to find Composer! Please install composer.phar to your PATH."
  end
end
