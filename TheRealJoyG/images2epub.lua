-- Filter to look for [[image]] macros and replace them with the necessary code to include and reference the image in an EPUB file.

function Para(el)
    local replacements = {
        ["[[imprint]]"] = { src = "imprint.png", attr = { class = "imprint" } },
        ["[[fullimprint]]"] = { src = "fullimprint.png", attr = { class = "fullimprint" } },
    }
    for i, item in ipairs(el.content) do
        if item.t == "Str" and replacements[item.text] then
            el.content[i] = pandoc.Image("", replacements[item.text].src, "", replacements[item.text].attr)
        end
    end
    return el
end
