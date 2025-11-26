-- Replace section placheholders with numbered titles, incrementing the number as it progresses
local book_number = 0
local part_number = 0
local chapter_number = 0

-- Supported styles for each TYPE of "book", "part", "chapter", "section":

-- TYPEN: Replaces with "Type X", where X is the type number
-- TYPEW: Replaces with "Type Number", where Number is the text equivalent of the type number (e.g., One, Two, Three)
-- TYPER: Replaces with "Type Roman", where Roman is the Roman numeral equivalent of the type number (e.g., I, II, III)

-- Special macro {{TYPERESET}} resets the type number to zero

local function toWords(num)
    local words = {
        [1] = "One",
        [2] = "Two",
        [3] = "Three",
        [4] = "Four",
        [5] = "Five",
        [6] = "Six",
        [7] = "Seven",
        [8] = "Eight",
        [9] = "Nine",
        [10] = "Ten",
        [11] = "Eleven",
        [12] = "Twelve",
        [13] = "Thirteen",
        [14] = "Fourteen",
        [15] = "Fifteen",
        [16] = "Sixteen",
        [17] = "Seventeen",
        [18] = "Eighteen",
        [19] = "Nineteen",
        [20] = "Twenty",
        [21] = "Twenty-One",
        [22] = "Twenty-Two",
        [23] = "Twenty-Three",
        [24] = "Twenty-Four",
        [25] = "Twenty-Five",
        [26] = "Twenty-Six",
        [27] = "Twenty-Seven",
        [28] = "Twenty-Eight",
        [29] = "Twenty-Nine",
        [30] = "Thirty",
        [31] = "Thirty-One",
        [32] = "Thirty-Two",
        [33] = "Thirty-Three",
        [34] = "Thirty-Four",
        [35] = "Thirty-Five",
        [36] = "Thirty-Six",
        [37] = "Thirty-Seven",
        [38] = "Thirty-Eight",
        [39] = "Thirty-Nine",
        [40] = "Forty"
    }
    return words[num]
end

local function toRoman(num)
    local roman_numerals = {
        { 1000, "M" },
        { 900,  "CM" },
        { 500,  "D" },
        { 400,  "CD" },
        { 100,  "C" },
        { 90,   "XC" },
        { 50,   "L" },
        { 40,   "XL" },
        { 10,   "X" },
        { 9,    "IX" },
        { 5,    "V" },
        { 4,    "IV" },
        { 1,    "I" }
    }
    local result = ""
    for _, pair in ipairs(roman_numerals) do
        local value, numeral = pair[1], pair[2]
        while num >= value do
            result = result .. numeral
            num = num - value
        end
    end
    return result
end

function Header(el)
    for i, item in ipairs(el.content) do
        if item.t == "Str" and item.text ~= "" then
            if item.text:find("{{ChapterRESET}}") then
                chapter_number = 0
            elseif item.text:find("{{ChapterN}}") then
                chapter_number = chapter_number + 1
                el.content[i] = pandoc.Str("Chapter " .. chapter_number)
            elseif item.text:find("{{ChapterW}}") then
                chapter_number = chapter_number + 1
                el.content[i] = pandoc.Str("Chapter " .. toWords(chapter_number))
            elseif item.text:find("{{ChapterR}}") then
                chapter_number = chapter_number + 1
                el.content[i] = pandoc.Str("Chapter " .. toRoman(chapter_number))
            end
        end
    end
    return el
end

-- function Header(el)
--     for i, item in ipairs(el.content) do
--         -- Only bother with non-empty elements
--         if item.t == "Str" and item.text ~= "" then
--             -- Book replacements all match "{{book..."
--             if item.text:find("%[%[book%u+%]%]") then
--                 if item.text == "{{bookRESET}}" then
--                     book_number = 0
--                 end
--                 book_number = book_number + 1
--                 if item.text == "{{bookN}}" then
--                     el.content[i] = pandoc.Str("Book " .. book_number)
--                 elseif item.text == "{{bookW}}" then
--                     el.content[i] = pandoc.Str("Book " .. toWords(book_number))
--                 elseif item.text == "{{bookR}}" then
--                     el.content[i] = pandoc.Str("Book " .. toRoman(book_number))
--                 end
--                 -- Part replacements all match "{{part..."
--             elseif item.text:find("%[%[part%u+%]%]") then
--                 if item.text == "{{partRESET}}" then
--                     part_number = 0
--                 end
--                 part_number = part_number + 1
--                 if item.text == "{{partN}}" then
--                     el.content[i] = pandoc.Str("Part " .. part_number)
--                 elseif item.text == "{{partW}}" then
--                     el.content[i] = pandoc.Str("Part " .. toWords(part_number))
--                 elseif item.text == "{{partR}}" then
--                     el.content[i] = pandoc.Str("Part " .. toRoman(part_number))
--                 end
--                 -- Chapter replacements all match "{{chapter..."
--             elseif item.text:find("%[%[chapter%u+%]%]") then
--                 if item.text == "{{chapterRESET}}" then
--                     chapter_number = 0
--                 end
--                 chapter_number = chapter_number + 1
--                 if el.text == "{{chapterN}}" then
--                     el.content[i] = pandoc.Str("Chapter " .. chapter_number)
--                 elseif el.text == "{{chapterT}}" then
--                     el.content[i] = pandoc.Str("Chapter " .. toWords(chapter_number))
--                 elseif el.text == "{{chapterR}}" then
--                     el.content[i] = pandoc.Str("Chapter " .. toRoman(chapter_number))
--                 end
--                 -- Section replacements all match "{{section..."
--             elseif item.text:find("%[%[section%u+%]%]") then
--                 if item.text == "{{sectionRESET}}" then
--                     section_number = 0
--                 end
--                 section_number = section_number + 1
--                 if item.text == "{{sectionN}}" then
--                     el.content[i] = pandoc.Str("Section " .. section_number)
--                 elseif item.text == "{{sectionW}}" then
--                     el.content[i] = pandoc.Str("Section " .. toWords(section_number))
--                 elseif item.text == "{{sectionR}}" then
--                     el.content[i] = pandoc.Str("Section " .. toRoman(section_number))
--                 end
--             end
--         end
--     end
--     return el
-- end
