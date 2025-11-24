function Para(el)
    -- Replace custom macro placeholders with actual LaTeX commands
    local replacements = {
        ["[[imprint]]"] = "![](imprint.png){.imprint}",
        ["[[fullimprint]]"] = "![](fullimprint.png){.fullimprint}",
    }
    for i, item in ipairs(el.content) do
        if item.t == "Str" and replacements[item.text] then
            el.content[i] = replacements[item.text]
        end
    end
    return el
end
