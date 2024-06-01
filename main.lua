local input_box = get("input-text")
local output_box = get("output-text")
local uwuify_button = get("uwuify-button")

function uwuify(str, stutterChance)
    local smilies = {
        "(ᵘʷᵘ)",
        "(ᵘﻌᵘ)",
        "(◡ ω ◡)",
        "(◡ ꒳ ◡)",
        "(◡ w ◡)",
        "(◡ ሠ ◡)",
        "(˘ω˘)",
        "(⑅˘꒳˘)",
        "(˘ᵕ˘)",
        "(˘ሠ˘)",
        "(˘³˘)",
        "(˘ε˘)",
        "(´˘`)",
        "(´꒳`)",
        "(˘˘˘)",
        "( ᴜ ω ᴜ )",
        "( ´ω` )۶",
        "(„ᵕᴗᵕ„)",
        "(ㅅꈍ ˘ ꈍ)",
        "(⑅˘꒳˘)",
        "( ｡ᵘ ᵕ ᵘ ｡)",
        "( ᵘ ꒳ ᵘ ✼)",
        "( ˘ᴗ˘ )",
        "(ᵕᴗ ᵕ⁎)",
        "*:･ﾟ✧(ꈍᴗꈍ)✧･ﾟ:*",
        "*˚*(ꈍ ω ꈍ).₊̣̇.",
        "(。U ω U。)",
        "(U ᵕ U❁)",
        "(U ﹏ U)",
        "(◦ᵕ ˘ ᵕ◦)",
        "ღ(U꒳Uღ)",
        "♥(。U ω U。)",
        "– ̗̀ (ᵕ꒳ᵕ) ̖́-",
        "( ͡U ω ͡U )",
        "( ͡o ᵕ ͡o )",
        "( ͡o ꒳ ͡o )",
        "( ˊ.ᴗˋ )",
        "(灬´ᴗ`灬)",
        "uwu",
        "owo"
    }

    str = str:gsub('r', 'w')
    str = str:gsub('l', 'w')
    str = str:gsub('R', 'W')
    str = str:gsub('L', 'W')
    str = str:gsub('no', 'nyo')
    str = str:gsub('No', 'Nyo')
    str = str:gsub('NO', 'NYO')
    str = str:gsub('!', ' uwu!')

    -- Add random smilies at the end of the sentence
    str = str .. ' ' .. smilies[math.random(#smilies)]

    -- Add stuttering at the start of any word with a configurable chance
    str = str:gsub("(%a+)", function(word)
        if math.random() < stutterChance then
            local firstLetter = word:sub(1, 1)
            return firstLetter .. "-" .. word
        else
            return word
        end
    end)

    return str
end

uwuify_button.on_click(
    function()
        local input_text = input_box.get_content()
        output_box.set_content(uwuify(input_text, 0.5))
    end
)
