function Para(el)
    -- Replace custom macro placeholders with actual LaTeX commands
    local replacements = {
        ["{{frontmatter}}"] = "\\frontmatter",
        ["{{mainmatter}}"] = "\\mainmatter",
        ["{{backmatter}}"] = "\\backmatter",

        ["{{imprint}}"] = "\\myimprint",
        ["{{fullimprint}}"] = "\\myfullimprint",

        ["{{titlepage}}"] = "\\mytitlepage",
        ["{{halftitlepage}}"] = "\\myhalftitlepage",

        ["{{toc}}"] = "\\mytableofcontents",

        -- LaTeX/memoir will autonumber empty section names, so clear out the macros injected for epub handling
        ["{{bookN}}"] = "",
        ["{{bookRESET}}"] = "",
        ["{{bookR}}"] = "",
        ["{{bookT}}"] = "",
        ["{{chapterN}}"] = "",
        ["{{chapterRESET}}"] = "",
        ["{{chapterR}}"] = "",
        ["{{chapterT}}"] = "",
        ["{{partN}}"] = "",
        ["{{partRESET}}"] = "",
        ["{{partR}}"] = "",
        ["{{partT}}"] = "",
        ["{{sectionN}}"] = "",
        ["{{sectionRESET}}"] = "",
        ["{{sectionR}}"] = "",
        ["{{sectionT}}"] = "",


    }
    for i, item in ipairs(el.content) do
        if item.t == "Str" and replacements[item.text] then
            el.content[i] = pandoc.RawInline("latex", replacements[item.text])
        end
    end
    return el
end
