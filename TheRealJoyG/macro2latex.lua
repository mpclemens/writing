function Para(el)
    -- Replace custom macro placeholders with actual LaTeX commands
    local replacements = {
        ["[[frontmatter]]"] = "\\frontmatter",
        ["[[mainmatter]]"] = "\\mainmatter",
        ["[[backmatter]]"] = "\\backmatter",

        ["[[imprint]]"] = "\\myimprint",
        ["[[fullimprint]]"] = "\\myfullimprint",

        ["[[titlepage]]"] = "\\mytitlepage",
        ["[[halftitlepage]]"] = "\\myhalftitlepage",

        ["[[toc]]"] = "\\mytableofcontents",
    }
    for i, item in ipairs(el.content) do
        if item.t == "Str" and replacements[item.text] then
            el.content[i] = pandoc.RawInline("latex", replacements[item.text])
        end
    end
    return el
end
