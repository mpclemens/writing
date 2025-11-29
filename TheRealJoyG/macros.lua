local epub_replacements = {
    ["{{Backmatter}}"] = ""
}

local function forEpub(el)
    if el.content == nil then
        return el
    end
    for i, item in ipairs(el.content) do
        if item.t == "Str" and epub_replacements[item.text] then
            el.content[i] = pandoc.Str(epub_replacements[item.text])
        end
    end
    return el
end

local latex_replacements = {
    ["{{Frontmatter}}"] = "\\frontmatter",
    ["{{Mainmatter}}"] = "\\mainmatter",
    ["{{Backmatter}}"] = "\\backmatter",

    ["{{Imprint}}"] = "\\myimprint",
    ["{{Fullimprint}}"] = "\\myfullimprint",

    ["{{Titlepage}}"] = "\\mytitlepage",
    ["{{Halftitlepage}}"] = "\\myhalftitlepage",

    ["{{Toc}}"] = "\\mytableofcontents",
}

local function forLatex(el)
    if el.content == nil then
        return el
    end

    for i, item in ipairs(el.content) do
        if item.t == "Str" and latex_replacements[item.text] then
            el.content[i] = pandoc.RawInline("latex", latex_replacements[item.text])
        end
    end
    return el
end

local function formatCheck(el)
    if FORMAT:match 'epub3' then
        return forEpub(el)
    elseif FORMAT:match 'latex' then
        return forLatex(el)
    else
        return el
    end
end

function Text(el)
    return formatCheck(el)
end

function Block(el)
    return formatCheck(el)
end

function Inline(el)
    return formatCheck(el)
end
