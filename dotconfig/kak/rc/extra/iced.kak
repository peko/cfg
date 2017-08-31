# http://icedscript.org
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*[.](iced) %{
    set buffer filetype iced
}

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter -group / regions -default code iced     \
    double_string '"""' '"""'                '' \
    single_string "'''" "'''"                '' \
    comment       '###' '###'                '' \
    double_string '"' (?<!\\)(\\\\)*"        '' \
    single_string "'" "'"                    '' \
    comment       '#' '$'                    ''

#    regex         '/' (?<!\\)(\\\\)*/[gimy]* '' \
#    regex         '///' ///[gimy]*           '' \

# Regular expression flags are: g → global match, i → ignore case, m → multi-lines, y → sticky
# https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp

add-highlighter -group /iced/double_string fill string
add-highlighter -group /iced/double_string regions regions interpolation \Q#{ \} \{
add-highlighter -group /iced/double_string/regions/interpolation fill meta
add-highlighter -group /iced/single_string fill string
#add-highlighter -group /iced/regex fill meta
#add-highlighter -group /iced/regex regions regions interpolation \Q#{ \} \{
#add-highlighter -group /iced/regex/regions/interpolation fill meta
add-highlighter -group /iced/comment fill comment

# Keywords are collected at
# https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords
# http://icedscript.org/documentation/docs/lexer.html#section-63
add-highlighter -group /iced/code regex [$@]\w* 0:variable
add-highlighter -group /iced/code regex \b(Array|Boolean|Date|Function|Number|Object|RegExp|String)\b 0:type
add-highlighter -group /iced/code regex \b(document|false|no|null|off|on|parent|self|this|true|undefined|window|yes)\b 0:value
add-highlighter -group /iced/code regex \b(and|is|isnt|not|or)\b 0:operator
add-highlighter -group /iced/code regex \b(break|case|catch|class|const|continue|debugger|default|delete|do|else|enum|export|extends|finally|for|function|if|implements|import|in|instanceof|interface|let|native|new|package|private|protected|public|return|static|super|switch|throw|try|typeof|var|void|while|with|yield)\b 0:keyword

# Commands
# ‾‾‾‾‾‾‾‾

def -hidden iced-filter-around-selections %{
    eval -draft -itersel %{
        exec <a-x>
        # remove trailing white spaces
        try %{ exec -draft s \h + $ <ret> d }
    }
}

def -hidden iced-indent-on-new-line %{
    eval -draft -itersel %{
        # copy '#' comment prefix and following white spaces
        try %{ exec -draft k <a-x> s ^ \h * \K \# \h * <ret> y gh j P }
        # preserve previous line indent
        try %{ exec -draft \; K <a-&> }
        # filter previous line
        try %{ exec -draft k : iced-filter-around-selections <ret> }
        # indent after start structure
        try %{ exec -draft k <a-x> <a-k> ^ \h * (case|catch|class|else|finally|for|function|if|switch|try|while|with) \b | (=|->) $ <ret> j <a-gt> }
    }
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook -group iced-highlight global WinSetOption filetype=iced %{ add-highlighter ref iced }

hook global WinSetOption filetype=iced %{
    hook window InsertEnd  .* -group iced-hooks  iced-filter-around-selections
    hook window InsertChar \n -group iced-indent iced-indent-on-new-line
}

hook -group iced-highlight global WinSetOption filetype=(?!iced).* %{ remove-highlighter iced }

hook global WinSetOption filetype=(?!iced).* %{
    remove-hooks window iced-indent
    remove-hooks window iced-hooks
}
