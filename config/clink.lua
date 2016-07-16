-- Redefine the base prompt filter
function set_prompt_filter()
    cwd = clink.get_cwd()
    --prompt = "\x1b[1;32;40m{cwd}{git}{hg}\x1b[1;32;40m> \x1b[0m"
    prompt = "\x1b[1;32;40m{cwd}{git}{hg}> \x1b[0m"
    clink.prompt.value = string.gsub(prompt, "{cwd}", cwd)
end

-- Reregister filter
clink.prompt.register_filter(set_prompt_filter, 1)
