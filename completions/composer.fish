function __composer_entries
    set cmd (commandline -opc)

    if [ (count $cmd) -gt 1 ]
        # when using the run command
        if test $cmd[2] = "run"; or test $cmd[2] = "run-script"
            composer list --no-ansi | sed "1,/Available commands/d" | string match -i -r '.*defined\sin\scomposer' | string trim | awk '{print $1}'
            return
        end
    end

    composer list --no-ansi | sed "1,/Available commands/d" | string match -i -r '\s+.+?\s+' | string trim
end

complete -f -c composer -a '(__composer_entries)'

# Options
complete -c composer -s h -l help -d "Display help for the given command"
complete -c composer -s q -l quiet -d "Do not output any message"
complete -c composer -s V -l version -d "Display this application version"
complete -c composer -l ansi -d "Force ANSI output"
complete -c composer -l no-ansi -d "Disable ANSI output"
complete -c composer -s n -l no-interaction -d "Do not ask any interactive question"
complete -c composer -l profile -d "Display timing and memory usage information"
complete -c composer -l no-plugins -d "Disable plugins"
complete -c composer -l no-scripts -d "Skip execution of scripts defined in composer.json"
complete -c composer -s d -l working-dir -r -d "Use the given directory as working directory"
complete -c composer -l no-cache -d "Prevent use of the cache"
complete -c composer -s v -d "Increase verbosity (1 for normal output)"
complete -c composer -l vv -d "Increase verbosity (2 for more verbose output)"
complete -c composer -l vvv -d "Increase verbosity (3 for debug)"

# Commands
complete -c composer -f -n "__fish_use_subcommand" -a about -d "Shows a short information about Composer"
complete -c composer -f -n "__fish_use_subcommand" -a archive -d "Creates an archive of this composer package"
complete -c composer -f -n "__fish_use_subcommand" -a audit -d "Checks for security vulnerability advisories for installed packages"
complete -c composer -f -n "__fish_use_subcommand" -a browse -d "Opens the package's repository URL or homepage in your browser"
complete -c composer -f -n "__fish_use_subcommand" -a bump -d "Increases the lower limit of your composer.json requirements"
complete -c composer -f -n "__fish_use_subcommand" -a check-platform-reqs -d "Check that platform requirements are satisfied"
complete -c composer -f -n "__fish_use_subcommand" -a clear-cache -d "Clears composer's internal package cache"
complete -c composer -f -n "__fish_use_subcommand" -a completion -d "Dump the shell completion script"
complete -c composer -f -n "__fish_use_subcommand" -a config -d "Sets config options"
complete -c composer -f -n "__fish_use_subcommand" -a create-project -d "Creates new project from a package into given directory"
complete -c composer -f -n "__fish_use_subcommand" -a depends -d "Shows which packages cause the given package to be installed"
complete -c composer -f -n "__fish_use_subcommand" -a diagnose -d "Diagnoses the system to identify common errors"
complete -c composer -f -n "__fish_use_subcommand" -a dump-autoload -d "Dumps the autoloader"
complete -c composer -f -n "__fish_use_subcommand" -a exec -d "Executes a vendored binary/script"
complete -c composer -f -n "__fish_use_subcommand" -a fund -d "Discover how to help fund the maintenance of your dependencies"
complete -c composer -f -n "__fish_use_subcommand" -a global -d "Allows running commands in the global composer dir (\$COMPOSER_HOME)"
complete -c composer -f -n "__fish_use_subcommand" -a help -d "Display help for a command"
complete -c composer -f -n "__fish_use_subcommand" -a init -d "Creates a basic composer.json file in current directory"
complete -c composer -f -n "__fish_use_subcommand" -a install -d "Installs the project dependencies"
complete -c composer -f -n "__fish_use_subcommand" -a licenses -d "Shows information about licenses of dependencies"
complete -c composer -f -n "__fish_use_subcommand" -a list -d "List commands"
complete -c composer -f -n "__fish_use_subcommand" -a outdated -d "Shows a list of installed packages that have updates available"
complete -c composer -f -n "__fish_use_subcommand" -a prohibits -d "Shows which packages prevent the given package from being installed"
complete -c composer -f -n "__fish_use_subcommand" -a reinstall -d "Uninstalls and reinstalls the given package names"
complete -c composer -f -n "__fish_use_subcommand" -a remove -d "Removes a package from the require or require-dev"
complete -c composer -f -n "__fish_use_subcommand" -a require -d "Adds required packages to your composer.json and installs them"
complete -c composer -f -n "__fish_use_subcommand" -a run-script -d "Runs the scripts defined in composer.json"
complete -c composer -f -n "__fish_use_subcommand" -a search -d "Searches for packages"
complete -c composer -f -n "__fish_use_subcommand" -a show -d "Shows information about packages"
complete -c composer -f -n "__fish_use_subcommand" -a status -d "Shows a list of locally modified packages"
complete -c composer -f -n "__fish_use_subcommand" -a suggests -d "Shows package suggestions"
complete -c composer -f -n "__fish_use_subcommand" -a update -d "Updates your dependencies to the latest version"
complete -c composer -f -n "__fish_use_subcommand" -a validate -d "Validates a composer.json and composer.lock"

# Aliases
complete -c composer -f -n "__fish_use_subcommand" -a home -d "Alias of browse"
complete -c composer -f -n "__fish_use_subcommand" -a why -d "Alias of depends"
complete -c composer -f -n "__fish_use_subcommand" -a clearcache -d "Alias of clear-cache"
complete -c composer -f -n "__fish_use_subcommand" -a cc -d "Alias of clear-cache"
complete -c composer -f -n "__fish_use_subcommand" -a dumpautoload -d "Alias of dump-autoload"
complete -c composer -f -n "__fish_use_subcommand" -a i -d "Alias of install"
complete -c composer -f -n "__fish_use_subcommand" -a why-not -d "Alias of prohibits"
complete -c composer -f -n "__fish_use_subcommand" -a rm -d "Alias of remove"
complete -c composer -f -n "__fish_use_subcommand" -a uninstall -d "Alias of remove"
complete -c composer -f -n "__fish_use_subcommand" -a r -d "Alias of require"
complete -c composer -f -n "__fish_use_subcommand" -a run -d "Alias of run-script"
complete -c composer -f -n "__fish_use_subcommand" -a info -d "Alias of show"
complete -c composer -f -n "__fish_use_subcommand" -a u -d "Alias of update"
complete -c composer -f -n "__fish_use_subcommand" -a upgrade -d "Alias of update"