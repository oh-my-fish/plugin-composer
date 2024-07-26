# complete -c composer -s h -l help -d 'Display help for the given command. When no command is given display help for the list command' -f
# complete -c composer -s q -l quiet -d 'Do not output any message' -f
# complete -c composer -s V -l version -d 'Display this application version' -f
# complete -c composer -s d -l working-dir=WORKING-DIR -d 'If specified, use the given directory as working directory.' -f
# complete -c composer -s n -l no-interaction -d 'Do not ask any interactive question' -f
# complete -c composer -s v -l verbose -d 'Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug' -f
# complete -c composer -s vv -d 'Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug' -f
# complete -c composer -s vvv -d 'Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug' -f
# complete -c composer -l ansi -d 'Force ANSI output' -f
# complete -c composer -l no-ansi -d 'Disable ANSI output' -f
# complete -c composer -l profile -d 'Display timing and memory usage information' -f
# complete -c composer -l no-plugins -d 'Whether to disable plugins.' -f
# complete -c composer -l no-scripts -d 'Skips the execution of all scripts defined in composer.json file.' -f
# complete -c composer -l no-cache -d 'Prevent use of the cache' -f

function __composer_entries
    set cmd (commandline -opc)

    if [ (count $cmd) -gt 1 ]
        if [ "run" = $cmd[2] ]
            composer list --no-ansi | sed "1,/Available commands/d" | string match -i -r '.*defined\sin\scomposer' | string trim | awk '{print $1}'
            return
        end
    end

    composer list --no-ansi | sed "1,/Available commands/d" | string match -i -r '\s+.+?\s+' | string trim
end

complete -f -c composer -a '(__composer_entries)'

complete -f -c composer -l ansi -d 'Force ANSI output' -f
complete -f -c composer -l no-ansi -d 'Disable ANSI output' -f
complete -f -c composer -l profile -d 'Display timing and memory usage information' -f
complete -f -c composer -l no-plugins -d 'Whether to disable plugins.' -f
complete -f -c composer -l no-scripts -d 'Skips the execution of all scripts defined in composer.json file.' -f
complete -f -c composer -l no-cache -d 'Prevent use of the cache' -f
complete -f -c composer -l v -d 'Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug' -f
complete -f -c composer -l vv -d 'Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug' -f
complete -f -c composer -l vvv -d 'Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug' -f

complete -f -c composer -s h -l help -d 'Display help for the given command. When no command is given display help for the list command' -f
complete -f -c composer -s q -l quiet -d 'Do not output any message' -f
complete -f -c composer -s V -l version -d 'Display this application version' -f
complete -f -c composer -s d -l working-dir=WORKING-DIR -d 'If specified, use the given directory as working directory.' -f
complete -f -c composer -s n -l no-interaction -d 'Do not ask any interactive question' -f
