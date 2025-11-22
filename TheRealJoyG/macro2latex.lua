function Para(el)
    -- Replace custom macro placeholders with actual LaTeX commands
    local replacements = {
        ["[[mainmatter]]"] = "\\mainmatter",
        ["[[frontmatter]]"] = "\\frontmatter",
        ["[[backmatter]]"] = "\\backmatter",
        ["[[toc]]"] = "\\begin{mytableofcontents}\\end{mytableofcontents}",
        ["[[fullimprint]]"] =
        "\\begin{center}\\includegraphics[keepaspectratio=true,width=2in]{fullimprint.png}\\end{center}",
    }
    for i, item in ipairs(el.content) do
        if item.t == "Str" and replacements[item.text] then
            el.content[i] = pandoc.RawInline("latex", replacements[item.text])
        end
    end
    return el
end
