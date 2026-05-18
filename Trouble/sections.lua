-- Replace section placheholders with numbered titles, incrementing the number as it progresses

-- Document will contain macros like {{ChapterN}}, {{SectionW}}, etc.
--
-- Leading part of counter is the keys of this table, value is the type of replcement
-- N = Number, W = Word, R = Roman Numeral
local counters = {
    ["Book"] = 0,
    ["Part"] = 0,
    ["Chapter"] = 0,
    ["Section"] = 0,
}

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

local function forEpub(el)
    if el.content == nil then
        return el
    end
    for i, item in ipairs(el.content) do
        if item.t == "Str" and item.text ~= "" then
            for pattern, _ in pairs(counters) do
                if item.text:find("{{" .. pattern .. "[NWR]}}") then
                    counters[pattern] = counters[pattern] + 1
                    -- special cases: reset lower level counters
                    if pattern == "Book" then
                        counters["Part"] = 0
                        counters["Chapter"] = 0
                        counters["Section"] = 0
                    elseif pattern == "Chapter" then
                        counters["Section"] = 0
                    end
                    if item.text:find("{{" .. pattern .. "N}}") then
                        el.content[i] = item.text:gsub("{{" .. pattern .. "N}}",
                            pandoc.Str(pattern .. " " .. counters[pattern]).text)
                    elseif item.text:find("{{" .. pattern .. "W}}") then
                        el.content[i] = pandoc.Str(pattern .. " " .. toWords(counters[pattern]))
                    elseif item.text:find("{{" .. pattern .. "R}}") then
                        el.content[i] = pandoc.Str(pattern .. " " .. toRoman(counters[pattern]))
                    end
                end
            end
        end
    end
    return el
end

local function forLatex(el)
    if el.content == nil then
        return el
    end
    -- LaTeX documentclass handles automatic numbering, so remove the macros
    for i, item in ipairs(el.content) do
        if item.t == "Str" and item.text ~= "" then
            for pattern, _ in pairs(counters) do
                if item.text:find("{{" .. pattern .. "[NWR]}}") then
                    el.content[i] = item.text:gsub("{{" .. pattern .. "[NWR]}}", "")
                end
            end
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

function Block(el)
    return formatCheck(el)
end

function Inline(el)
    return formatCheck(el)
end
