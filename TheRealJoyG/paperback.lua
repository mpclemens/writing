function Div(el)
    -- Special Markdown fenced div classes to become LaTeX environments
    local environments = {
        ["dedication"] = true,
        ["copyrightpage"] = true,
        ["epigraph"] = true,
        ["foreword"] = true,
        ["preface"] = true,
        ["acknowledgments"] = true,
        ["introduction"] = true,
        ["afterword"] = true,
        ["colophon"] = true,
    }
    if environments[el.classes[1]] then
        -- insert element in front
        table.insert(
            el.content, 1,
            pandoc.RawBlock("latex", "\\begin{" .. el.classes[1] .. "}"))
        -- insert element at the back
        table.insert(
            el.content,
            pandoc.RawBlock("latex", "\\end{" .. el.classes[1] .. "}"))
    end
    return el
end
