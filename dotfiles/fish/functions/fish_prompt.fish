function fish_prompt
    # Colors
    set c_user (set_color brred)
    set c_host (set_color yellow)
    set c_path (set_color green)
    set c_symbol (set_color green)
    set c_symboll (set_color green)
    set c_reset (set_color normal)

    # SSH indicator
    if test -n "$SSH_TTY"
        echo -n "$c_user$USER$c_reset@$c_host"(prompt_hostname)" "
    end

    # First line: path
    set -l full_path (pwd | string replace -r "^$HOME" "")
    echo -n "$c_symbol❯❯❯❯ $c_path$full_path$c_reset"

    # New line + prompt symbol
    echo ""
    if fish_is_root_user
        echo -n (set_color red)"# "$c_reset
    else
        echo -n "$c_symbol⇢ $c_reset"
    end
end
