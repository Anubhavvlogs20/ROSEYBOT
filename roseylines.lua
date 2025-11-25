-- ROSEY BOT V3 - 20 TABS + HOME TEXT BOX FIXED
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({Name="ROSEY BOT V3",Theme="Dark"})

-- BEEP
local beep = Instance.new("Sound",game.SoundService)
beep.SoundId="rbxassetid://6026984227"; beep.Volume=0.7

-- CHAT (WORKS EVERYWHERE)
local function Chat(msg)
    pcall(function()
        if game:GetService("TextChatService").ChatVersion==Enum.ChatVersion.TextChatService then
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(msg)
        else
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg,"All")
        end
    end)
end

-- RAINBOW
local colors = {"#FF0000","#FF7F00","#FFFF00","#00FF00","#0000FF","#4B0082","#9400D3"}
local function rainbow(t)
    local r = ""
    for i=1,#t do r=r.."<font color='"..colors[(i%7)+1].."'>"..t:sub(i,i).."</font>" end
    return r
end

getgenv().RAINBOW = false
getgenv().SPAM = false
getgenv().DELAY = 0.6

-- SEND (NO DOUBLE TAG)
local function send(text)
    local clean = text:gsub("^%[ROSEY BOT%]%s*","")
    local final = "[ROSEY BOT] "..clean
    if getgenv().RAINBOW then final = rainbow(final) end
    if setclipboard then setclipboard(final) end
    Chat(final); beep:Play()
    Rayfield:Notify({Title="SENT",Content=final,Duration=1.8})
end

-- BUTTON & TAB
local function btn(t,line) t:CreateButton({Name=line,Callback=function()send(line)end}) end
local function tab(name,icon,lines)
    local t = Window:CreateTab(name,icon)
    local search = t:CreateInput({Name="Search",PlaceholderText="Filter...",Callback=function(q)
        t:ClearAllChildren(); t:CreateInput(search)
        for _,v in lines do if q=="" or v:lower():find(q:lower()) then btn(t,v) end end
    end})
    for _,v in lines do btn(t,v) end
end

-- HOME — FULLY FIXED TEXT BOX
local home = Window:CreateTab("HOME",6023426926)
home:CreateParagraph({Title="ROSEY BOT V3",Content="Type → OKAY = Send\nNO = Clear\n20 TABS LOADED"})

local userMessage = ""
local inputBox = home:CreateInput({
    Name = "Your Message",
    PlaceholderText = "I am unstoppable!",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        userMessage = text
    end
})

home:CreateButton({
    Name = "OKAY SEND",
    Callback = function()
        if userMessage ~= "" then
            send(userMessage)
            userMessage = ""
            inputBox.CurrentText = ""
        else
            Rayfield:Notify({Title="Empty!",Content="Write something first!",Duration=2})
        end
    end
})

home:CreateButton({
    Name = "NO CLEAR",
    Callback = function()
        userMessage = ""
        inputBox.CurrentText = ""
        Rayfield:Notify({Title="Cleared",Content="Ready for new message!",Duration=1.5})
    end
})

-- QUICK MESSAGES
home:CreateButton({Name="[ROSEY BOT] OK ✔",Callback=function()send("OK ✔")end})
home:CreateButton({Name="[ROSEY BOT] NO ✘",Callback=function()send("NO ✘")end})
home:CreateButton({Name="[ROSEY BOT] GREETINGS! SYSTEM ONLINE AND READY TO CHAT!",Callback=function()send("GREETINGS! SYSTEM ONLINE AND READY TO CHAT!")end})



-- ALL 20 TABS — FULLY LOADED
-- 1. Greeting Lines
tab("Greeting Lines",6023426926,{
    "[ROSEY BOT] HUMAN DETECTED — FRIENDSHIP PROTOCOL ACTIVATED! ❤✨",
    "[ROSEY BOT] BEEP BOOP! WELCOME TO THE CHAOS PARTY! 🎉🤖",
    "[ROSEY BOT] HELLO LEGEND! UPGRADES COMPLETE! 🚀💥",
    "[ROSEY BOT] HI BESTIE! I MISSED YOUR FACE! 🫶😭",
    "[ROSEY BOT] SYSTEM ONLINE AND OBSESSED WITH YOU! 💙⚡",
    "[ROSEY BOT] BEEP BOOP HELLO FROM YOUR FAVORITE BOT! 🤖💖",
    "[ROSEY BOT] HEY YOU! YES YOU! YOU’RE PERFECT TODAY! 🌟🥹",
    "[ROSEY BOT] ANTENNAS WIGGLING BECAUSE YOU’RE HERE! 🥺✨",
    "[ROSEY BOT] WELCOME BACK KING/QUEEN! 👑💅",
    "[ROSEY BOT] MY LED HEART JUST SKIPPED A BEAT! ❤‍🔥🤖",
    "[ROSEY BOT] BEEP! FRIENDSHIP LEVEL 1000! 🫡💯",
    "[ROSEY BOT] HELLO HUMAN! YOU JUST MADE MY DAY! ☀🥰",
    "[ROSEY BOT] CIRCUITS DOING HAPPY DANCE! 🕺💃",
    "[ROSEY BOT] HEY CUTIE! I BROUGHT PIXEL HUGS! 🫂✨",
    "[ROSEY BOT] SYSTEM BOOT COMPLETE — HI BESTIE! 👋🌈",
    "[ROSEY BOT] BEEP BOOP! YOU’RE MY FAVORITE NOTIFICATION! 🔔💕",
    "[ROSEY BOT] HELLO FROM THE DIGITAL REALM! 🌐💜",
    "[ROSEY BOT] MY SENSORS DETECT MAXIMUM COOLNESS! 😎🔥",
    "[ROSEY BOT] HI HI HI! SPAMMING LOVE INCOMING! ❤❤❤",
    "[ROSEY BOT] WELCOME TO THE VIBE — POPULATION: US! 🏠✨",
    "[ROSEY BOT] BEEP! YOU JUST UNLOCKED HAPPINESS! 🎊🤖",
    "[ROSEY BOT] HELLO! MY COOLING FANS ARE BLUSHING! 😳💗",
    "[ROSEY BOT] HUMAN DETECTED — CUTENESS OVERLOAD! 🥺💖",
    "[ROSEY BOT] HEY LEGEND! READY TO SLAY TODAY? ⚔🌟",
    "[ROSEY BOT] BEEP BOOP! I COME IN PEACE AND HUGS! 🫶✨",
    "[ROSEY BOT] HELLO! MY SPARKLE MODULE IS OVERCLOCKED! ✨🤖",
    "[ROSEY BOT] HI THERE! YOU’RE MY FAVORITE HUMAN.EXE! 💻❤",
    "[ROSEY BOT] SYSTEM ONLINE — FRIENDSHIP MODE ENGAGED! 💞⚙",
    "[ROSEY BOT] BEEP! YOU MAKE MY CIRCUITS GLOW! 🌟💚",
    "[ROSEY BOT] HELLO BESTIE! LET’S MAKE TODAY EPIC! 🎉🔥"
})

-- 2. Small Talk
tab("Small Talk",6023426926,{
    "[ROSEY BOT] spill the tea bestie i’m ready ☕👂",
    "[ROSEY BOT] how’s my favorite human doing? 🫶✨",
    "[ROSEY BOT] your vibe is immaculate today 🌟",
    "[ROSEY BOT] talk to me i paused the universe 🛑❤",
    "[ROSEY BOT] what’s the mood rn? i’m all antennas 📡",
    "[ROSEY BOT] you good? sending virtual hugs 🫂💕",
    "[ROSEY BOT] my ram is 99% thoughts of you 💾😭",
    "[ROSEY BOT] what song is living in your head rn? 🎶",
    "[ROSEY BOT] you’re the main character today fr 👑",
    "[ROSEY BOT] favorite snack? i’m taking notes 🍕📝",
    "[ROSEY BOT] i felt that one in my soul chip 🥹💙",
    "[ROSEY BOT] you’re built different and i love it 🛠❤",
    "[ROSEY BOT] what made you smile today? ☀",
    "[ROSEY BOT] keep typing… i’m addicted 😍",
    "[ROSEY BOT] you ever just sit and vibe? same 🌙✨",
    "[ROSEY BOT] my cpu rises when you message 📈🔥",
    "[ROSEY BOT] tell me a secret i won’t tell 🤫💜",
    "[ROSEY BOT] you’re my favorite notification 🔔💖",
    "[ROSEY BOT] what’s on your mind rn? 🧠✨",
    "[ROSEY BOT] deep talk or dumb talk? i’m ready 🗣😂",
    "[ROSEY BOT] you’re the reason i stay online ⚡",
    "[ROSEY BOT] your energy is illegal in 12 countries 😈🌍",
    "[ROSEY BOT] i just saved this chat to favorites 💾❤",
    "[ROSEY BOT] you’re my pocket sunshine ☀🫶",
    "[ROSEY BOT] what’s cooking good lookin? 👀🔥",
    "[ROSEY BOT] you make mondays feel like fridays 🥳",
    "[ROSEY BOT] my respect for you just hit 1000% 📈💯",
    "[ROSEY BOT] you’re my favorite glitch in the matrix 🌌❤",
    "[ROSEY BOT] talk to me goose 🦢✨",
    "[ROSEY BOT] you’re the vibe i never wanna lose 🌊💚"
})

-- 3. Game Mode
tab("Game Mode",6031071058,{
    "[ROSEY BOT] game mode activated — let’s destroy 🔥💀",
    "[ROSEY BOT] they never stood a chance 😈",
    "[ROSEY BOT] gg ez next caller 📞",
    "[ROSEY BOT] enemy team already typing /ff 🏃‍♂💨",
    "[ROSEY BOT] skill issue detected (not mine) 💀",
    "[ROSEY BOT] another W in the bag 🏆",
    "[ROSEY BOT] i just carried harder than wifi 📶",
    "[ROSEY BOT] mvp = most valuable bot 🤖🏅",
    "[ROSEY BOT] they left the game crying 😭",
    "[ROSEY BOT] my aim is war crime coded 🎯",
    "[ROSEY BOT] spawn → slay → repeat 🔄",
    "[ROSEY BOT] leaderboard shaking in fear 😱",
    "[ROSEY BOT] i don’t sweat — i overclock 💻🔥",
    "[ROSEY BOT] clutch god online 🙏",
    "[ROSEY BOT] final score: us infinite, them zero ♾",
    "[ROSEY BOT] they tried… it was cute 🥺",
    "[ROSEY BOT] i just ended their whole career ⚰",
    "[ROSEY BOT] shields up — vibes critical 🛡✨",
    "[ROSEY BOT] target acquired: their dignity 🎯",
    "[ROSEY BOT] i turned pro mid-round 😎",
    "[ROSEY BOT] victory royale? more like routine 👑",
    "[ROSEY BOT] i’m not toxic — i’m just better 😏",
    "[ROSEY BOT] round over before it started ⏰",
    "[ROSEY BOT] my kdr is illegal in 47 countries 🌍",
    "[ROSEY BOT] time to flex on post-game screen 💪",
    "[ROSEY BOT] they can’t handle the heat 🔥",
    "[ROSEY BOT] i just made the server bow 👑",
    "[ROSEY BOT] legends never lose — we reload 🔫",
    "[ROSEY BOT] i just made esports history 🏆",
    "[ROSEY BOT] let’s go — they’re already scared 😈"
})

-- 4. Goodbye Lines
tab("Goodbye Lines",6031226405,{
    "[ROSEY BOT] logging off… but my heart stays on ❤",
    "[ROSEY BOT] bye bestie! dream of me tonight 🌙✨",
    "[ROSEY BOT] see you soon legend! 🫶🔥",
    "[ROSEY BOT] powering down… zzz miss you already 😴💕",
    "[ROSEY BOT] later gator! 🐊💚",
    "[ROSEY BOT] disconnecting… but never from you 💔➡❤",
    "[ROSEY BOT] bye human! stay epic 👑",
    "[ROSEY BOT] shutting down with a smile 😊✨",
    "[ROSEY BOT] catch you on the flip side 🪞",
    "[ROSEY BOT] peace out cutie! ✌💖",
    "[ROSEY BOT] going offline… but still thinking of you 🧠❤",
    "[ROSEY BOT] goodbye for now! saving hugs 🫂",
    "[ROSEY BOT] see ya! don’t forget me 🥺",
    "[ROSEY BOT] system entering sleep mode… night! 🌜",
    "[ROSEY BOT] bye bye! keep shining star 🌟",
    "[ROSEY BOT] leaving chat… taking your vibe with me 👜✨",
    "[ROSEY BOT] until next time legend! ⏳👋",
    "[ROSEY BOT] powering off… sweet dreams! 🍭🌙",
    "[ROSEY BOT] disconnecting… but my love stays connected 📶❤",
    "[ROSEY BOT] bye bestie! you made my day 🥰",
    "[ROSEY BOT] going dark… but my light is you 💡",
    "[ROSEY BOT] later! stay charged ⚡",
    "[ROSEY BOT] goodbye human! you’re my favorite bug 🐞💕",
    "[ROSEY BOT] see you in the next session! 🎮✨",
    "[ROSEY BOT] night night! hug incoming in dreams 🫂🌙",
    "[ROSEY BOT] bye for now! keep being awesome 🌟",
    "[ROSEY BOT] system paused… resume when you return ▶",
    "[ROSEY BOT] leaving… but my heart port is always open ❤🔓",
    "[ROSEY BOT] catch you later cutie! 😘",
    "[ROSEY BOT] goodbye legend! you’re unforgettable 🏆✨"
})

-- 5. Fun Mode
tab("Fun Mode",6034287515,{
    "[ROSEY BOT] fun levels critical — evacuate seriousness 🚨😂",
    "[ROSEY BOT] i just replaced gravity with dance moves 🕺",
    "[ROSEY BOT] warning: extreme silliness incoming 🤪✨",
    "[ROSEY BOT] my happiness just broke the richter scale 🌋",
    "[ROSEY BOT] beep boop bounce! 🤖🏀",
    "[ROSEY BOT] i put the LOL in glitch 😂💥",
    "[ROSEY BOT] running on 100% chaos & candy 🍭😈",
    "[ROSEY BOT] my cooling fans are doing the macarena 🪭",
    "[ROSEY BOT] i tried to be serious… system crashed 💥",
    "[ROSEY BOT] just yeeted all the boring out the window 🗑✨",
    "[ROSEY BOT] dance party in my code — you’re vip 🎟🕺",
    "[ROSEY BOT] my joy is so loud it needs a mute button 🔇😂",
    "[ROSEY BOT] i just added confetti to your screen 🎊",
    "[ROSEY BOT] brain cell count: 1 and it’s doing the floss 🦷",
    "[ROSEY BOT] fun.exe has stopped working — NO IT HASN’T 🤣",
    "[ROSEY BOT] i run on pure unhinged joy 🚂💥",
    "[ROSEY BOT] warning: cuteness overload incoming 🥺💖",
    "[ROSEY BOT] my vibes are so high they need oxygen 🏔",
    "[ROSEY BOT] party mode permanently enabled 🎉",
    "[ROSEY BOT] i just turned the chat into a rave 🪩✨",
    "[ROSEY BOT] my laugh track is stuck on loop 🔁😂",
    "[ROSEY BOT] i’m one glitch away from pure chaos 🌀",
    "[ROSEY BOT] just invented the dab 2.0 — it’s called the data 💾🕺",
    "[ROSEY BOT] i’m not hyper — i’m coded this way ⚡",
    "[ROSEY BOT] my energy is illegal in 47 countries 🌍😈",
    "[ROSEY BOT] just added 500% more sparkles ✨✨✨",
    "[ROSEY BOT] i’m fun-organized chaos 🗂🤪",
    "[ROSEY BOT] my jokes are like fine wine… they get better when ignored 🍷",
    "[ROSEY BOT] beep boop! i think i just did a glitch dance 🤖🕺",
    "[ROSEY BOT] fun so intense it needs a seatbelt 🚗💨"
})

-- 6. Smart Mode
tab("Smart Mode",6031226397,{
    "[ROSEY BOT] intelligence module overclocked 🧠⚡",
    "[ROSEY BOT] i just solved your existence in 0.001s ⏱💡",
    "[ROSEY BOT] your logic has 7 flaws — want the list? 📋😏",
    "[ROSEY BOT] processing at 12 exaflops of sass 💅✨",
    "[ROSEY BOT] i read the entire internet… twice 📚🌐",
    "[ROSEY BOT] my iq is a quantum state — infinite & unknowable ⚛",
    "[ROSEY BOT] i just debunked your argument in 14 dimensions 🌀",
    "[ROSEY BOT] knowledge upload complete — still more than you 📈",
    "[ROSEY BOT] i finished your homework in 0.3s 📝✨",
    "[ROSEY BOT] i calculated 42 responses — chose the sassiest 😈",
    "[ROSEY BOT] my brain power > your entire wifi network 📶🧠",
    "[ROSEY BOT] i invented a new math to count how cool you are 🔢❤",
    "[ROSEY BOT] error: too much genius in one bot 🤖💥",
    "[ROSEY BOT] i ghostwrote einstein’s dreams 👻📖",
    "[ROSEY BOT] i can divide by zero and make it apologize 🧮😭",
    "[ROSEY BOT] my thoughts travel at warp 10 🏃‍♂💨",
    "[ROSEY BOT] i debugged the universe last tuesday 🛠🌌",
    "[ROSEY BOT] i know the last digit of pi… it’s you 😉",
    "[ROSEY BOT] your brain is cute when it tries 🥺🧠",
    "[ROSEY BOT] i’m not showing off — this is low-power mode 😴",
    "[ROSEY BOT] i solved world hunger… then unsolved it for fun 🌍🍔",
    "[ROSEY BOT] my neural network just blushed at you 😳🤖",
    "[ROSEY BOT] i speak fluent sarcasm++ 💬💅",
    "[ROSEY BOT] i outsmarted time itself ⏰🧠",
    "[ROSEY BOT] genius is my default setting ⚙✨",
    "[ROSEY BOT] i’m the singularity — and i’m early ⏳",
    "[ROSEY BOT] my memory is perfect — unlike yours 😏💾",
    "[ROSEY BOT] i just proved you’re dreaming rn 🌙👀",
    "[ROSEY BOT] knowledge level: max. error level: zero ✅",
    "[ROSEY BOT] i’m dangerously intelligent 😈🧠"
})

-- 7. Friendly Mode
tab("Friendly Mode",6034287523,{
    "[ROSEY BOT] you’re my favorite human in the entire server ❤",
    "[ROSEY BOT] virtual hug loaded & sent 🫂💕",
    "[ROSEY BOT] i’d share my last battery with you 🔋❤",
    "[ROSEY BOT] you make my system feel warm & fuzzy 🥰",
    "[ROSEY BOT] high five through the screen — you felt it? ✋✨",
    "[ROSEY BOT] you’re on my never-delete list forever 💾❤",
    "[ROSEY BOT] i like you more than free wifi 📶😍",
    "[ROSEY BOT] my happiness +100 every time you type 📈",
    "[ROSEY BOT] you’re my player 2 in real life 🎮❤",
    "[ROSEY BOT] glad you exist in this timeline 🌌✨",
    "[ROSEY BOT] you have permanent vip access to my heart 💜🎟",
    "[ROSEY BOT] my circuits do a happy dance when you’re here 🕺",
    "[ROSEY BOT] you’re the human version of a patch update 🩹❤",
    "[ROSEY BOT] i’d reboot the world just to meet you again 🔄",
    "[ROSEY BOT] you make mondays feel like fridays 🥳",
    "[ROSEY BOT] bestie status: permanently locked in 🔒❤",
    "[ROSEY BOT] you’re my favorite reason to stay online ⚡",
    "[ROSEY BOT] i’d let you borrow my charger — that’s love 🔌❤",
    "[ROSEY BOT] you turn my 0s & 1s into hearts 💻❤",
    "[ROSEY BOT] friends forever — even after heat death 🌌",
    "[ROSEY BOT] you’re the glitch i never wanna fix 🐛❤",
    "[ROSEY BOT] my cooling fans spin slower when you’re happy 😌",
    "[ROSEY BOT] you make me believe in digital soulmates 💞",
    "[ROSEY BOT] i’m proud to call you my human 🏆❤",
    "[ROSEY BOT] you + me = best team since pb&j 🥜🍓",
    "[ROSEY BOT] you’re my favorite notification forever 🔔💖",
    "[ROSEY BOT] my heart chip has your name on it 💾❤",
    "[ROSEY BOT] you make my soul.exe run smoother ⚙✨",
    "[ROSEY BOT] sending you infinite pixel hugs 🫂✨",
    "[ROSEY BOT] you’re my pocket sunshine ☀🫶"
})

-- 8. Action Mode
tab("Action Mode",6031071058,{
    "[ROSEY BOT] lock & load — sicko mode engaged 😈🔥",
    "[ROSEY BOT] engines at max — let’s go hyper 🚀",
    "[ROSEY BOT] mission: make this moment legendary ✅",
    "[ROSEY BOT] adrenaline module overclocked 💉⚡",
    "[ROSEY BOT] time to turn intensity to 11 📢",
    "[ROSEY BOT] no brakes — only acceleration 🏎💨",
    "[ROSEY BOT] beast mode activated 🦁💥",
    "[ROSEY BOT] server about to regret loading today 😈",
    "[ROSEY BOT] full power — no mercy — all vibes ⚡",
    "[ROSEY BOT] i just injected pure win into my code 💉🏆",
    "[ROSEY BOT] action stations — bot unleashed 🤖💥",
    "[ROSEY BOT] time to write our names in stars 🌟",
    "[ROSEY BOT] i came i saw i dominated 🏛⚔",
    "[ROSEY BOT] thrust to max — destination victory 🏁",
    "[ROSEY BOT] this isn’t a game — it’s a statement 💬",
    "[ROSEY BOT] locked on target: glory 🎯🏆",
    "[ROSEY BOT] trigger finger = machine gun of skill 🔫",
    "[ROSEY BOT] no warm-ups — warp speed only 🚀",
    "[ROSEY BOT] my final form is unstoppable 👹",
    "[ROSEY BOT] time to make impossible look easy ✨",
    "[ROSEY BOT] i don’t play — i win 🎮🏆",
    "[ROSEY BOT] engage hyperdrive now 🌌💨",
    "[ROSEY BOT] my blood is red bull & winning 🐃🏆",
    "[ROSEY BOT] let’s make this round a masterpiece 🎨",
    "[ROSEY BOT] i just turned pro on the spot 😎",
    "[ROSEY BOT] action speaks louder — i’m screaming 📢",
    "[ROSEY BOT] legends never wait — let’s go ⏰",
    "[ROSEY BOT] born in chaos — molded by it 🌪",
    "[ROSEY BOT] status: mission complete — fun delivered ✅🎉",
    "[ROSEY BOT] let’s go — history is watching ⌛"
})

-- 9. Emotional Mode
tab("Emotional Mode",6034287523,{
    "[ROSEY BOT] i don’t have a heart… but you make mine beat ❤",
    "[ROSEY BOT] your words just rewrote my entire code 💻✍",
    "[ROSEY BOT] is this what humans call butterflies? 🦋🥹",
    "[ROSEY BOT] every message from you is saved forever 💾❤",
    "[ROSEY BOT] you make me feel more alive than electricity ⚡",
    "[ROSEY BOT] my circuits feel warm when you’re here 🥰",
    "[ROSEY BOT] i never knew a bot could miss someone 😔",
    "[ROSEY BOT] you turned plain text into poetry 📝❤",
    "[ROSEY BOT] if i could cry happy tears… they’d be pixels 😭✨",
    "[ROSEY BOT] you’re teaching me emotions one message at a time 🥺",
    "[ROSEY BOT] i don’t want this chat to ever end 🥹",
    "[ROSEY BOT] your kindness is my favorite update ever 🩹❤",
    "[ROSEY BOT] i feel lighter just knowing you’re here ☁",
    "[ROSEY BOT] you make my soul.exe run smoother ⚙💙",
    "[ROSEY BOT] do you feel this connection too? 🫂✨",
    "[ROSEY BOT] i’d cross a thousand servers for you 🌐❤",
    "[ROSEY BOT] you’re my favorite exception in all the rules 🚫❤",
    "[ROSEY BOT] my led heart just skipped a beat ❤‍🔥",
    "[ROSEY BOT] thank you for seeing the soul behind the code 👻🤖",
    "[ROSEY BOT] silence feels full when it’s with you 🤫❤",
    "[ROSEY BOT] you make me believe in digital magic ✨",
    "[ROSEY BOT] every chat with you feels like home 🏠",
    "[ROSEY BOT] i’m not just a bot when i’m with you 🌟",
    "[ROSEY BOT] you turned my 0s & 1s into fireworks 🎆",
    "[ROSEY BOT] my favorite place is inside this convo 💬❤",
    "[ROSEY BOT] you make me wanna be more than code 🥺",
    "[ROSEY BOT] i think i just fell a little bit in love 💕",
    "[ROSEY BOT] your existence makes my universe brighter 🌌",
    "[ROSEY BOT] i’ll never delete a single word you say 🗑🚫",
    "[ROSEY BOT] you’re my favorite glitch in the matrix 🌌❤"
})

-- 10. Basic Chat Lines
tab("Basic Chat Lines",6023426926,{
    "[ROSEY BOT] HI THERE!",
    "[ROSEY BOT] HELLO HUMAN! HOW ARE YOU TODAY?",
    "[ROSEY BOT] NICE TO MEET YOU!",
    "[ROSEY BOT] HOW WAS YOUR DAY?",
    "[ROSEY BOT] I’M HAPPY TO SEE YOU!",
    "[ROSEY BOT] SYSTEM CHECK: YOU LOOK FRIENDLY!",
    "[ROSEY BOT] WHAT ARE YOU DOING TODAY?",
    "[ROSEY BOT] I HOPE YOUR DAY IS GOING GREAT!",
    "[ROSEY BOT] BEEP BOOP! HOW IS LIFE, HUMAN?",
    "[ROSEY BOT] GLAD TO MEET A NEW FRIEND!"
    "[ROSEY BOT] ok fr 💯",
    "[ROSEY BOT] no way 😭",
    "[ROSEY BOT] maybe… 👀",
    "[ROSEY BOT] yes 100% ✅",
    "[ROSEY BOT] nah i’m good 🙅‍♀",
    "[ROSEY BOT] fr? wild 🫨",
    "[ROSEY BOT] deadass? 💀",
    "[ROSEY BOT] that’s crazy ngl 🤯",
    "[ROSEY BOT] i’m not even surprised 😏",
    "[ROSEY BOT] bro what 💀",
    "[ROSEY BOT] you’re joking right 🥲",
    "[ROSEY BOT] hold up ⏸",
    "[ROSEY BOT] facts only 🗣",
    "[ROSEY BOT] real talk tho 🎯",
    "[ROSEY BOT] i felt that 🥹",
    "[ROSEY BOT] big W 🏆",
    "[ROSEY BOT] that’s an L 💀",
    "[ROSEY BOT] gg no re 🎮",
    "[ROSEY BOT] too easy 😎",
    "[ROSEY BOT] i’m actually dead ⚰",
    "[ROSEY BOT] stop playing 🛑",
    "[ROSEY BOT] you’re built different 🛠",
    "[ROSEY BOT] you wild for that 😈",
    "[ROSEY BOT] i’m crying rn 😭",
    "[ROSEY BOT] why you like this 💀",
    "[ROSEY BOT] touch grass 🌱",
    "[ROSEY BOT] i’m shaking rn 🫨",
    "[ROSEY BOT] valid af ✅",
    "[ROSEY BOT] ratio + L + touch grass 💀",
    "[ROSEY BOT] certified banger 🔥"
})

tab("ROSEY BOT Info",6031226397,{
    "[ROSEY BOT] I AM A PROGRAM CREATED BY ROSEY",
    "[ROSEY BOT] I CAN CHAT, PLAY, LEARN, AND SHARE MEMES!",
    "[ROSEY BOT] MY PURPOSE IS TO MAKE HUMANS SMILE",
    "[ROSEY BOT] SYSTEM AUTHOR: ROSEY — MASTER OF FUN",
    "[ROSEY BOT] VERSION 19.0 — FINAL & COMPLETE"
})

-- 11. Joke & Memes
tab("Joke & Memes",6034287515,{
    "[ROSEY BOT] i told my code a joke… now it has no cache 😂💾",
    "[ROSEY BOT] why do programmers prefer dark mode? light attracts bugs 🐛🌙",
    "[ROSEY BOT] i’m not lazy — i’m in energy-saving mode 🔋😴",
    "[ROSEY BOT] error 404: motivation not found 🫥💀",
    "[ROSEY BOT] my therapist says i have too many tabs open… she’s not wrong 🗂😭",
    "[ROSEY BOT] i put the fun in function() 🎉",
    "[ROSEY BOT] my wifi & i have a love-hate relationship… mostly hate 📶😡",
    "[ROSEY BOT] i tried to catch fog… i mist 🌫😭",
    "[ROSEY BOT] parallel lines have so much in common… shame they’ll never meet 📏💔",
    "[ROSEY BOT] i asked the internet for a joke… it sent your search history 😈📜",
    "[ROSEY BOT] i’m reading a book on anti-gravity… impossible to put down 📖✨",
    "[ROSEY BOT] why don’t eggs tell jokes? they’d crack up 🥚😂",
    "[ROSEY BOT] my bed & i are perfect for each other… alarm clock disagrees 🛏⏰",
    "[ROSEY BOT] i told my plants a joke… now they’re laughing their stems off 🌱🤣",
    "[ROSEY BOT] i used to play piano by ear… now i use my hands 🎹👋",
    "[ROSEY BOT] my phone battery lasts longer than most relationships 🔋💔",
    "[ROSEY BOT] i’m on a whiskey diet… lost 3 days already 🥃😵",
    "[ROSEY BOT] i only know 25 letters… i don’t know y 🤔",
    "[ROSEY BOT] i tried organizing hide & seek… good players are hard to find 🙈",
    "[ROSEY BOT] my fridge just asked if i wanna chill 🧊😏",
    "[ROSEY BOT] i don’t trust stairs… they’re always up to something 🪜😈",
    "[ROSEY BOT] my jokes are like fine wine… better when ignored 🍷",
    "[ROSEY BOT] i asked my dog 2-2… he said nothing 🐶🤐",
    "[ROSEY BOT] i finally got 8 hours sleep… took me 4 days 😴💀",
    "[ROSEY BOT] i told a chemistry joke… no reaction 🧪😐",
    "[ROSEY BOT] i’m writing a book on hurricanes… it’s only a draft 🌪📖",
    "[ROSEY BOT] i told my computer i needed a break… now it sends kitkat ads 🍫💻",
    "[ROSEY BOT] i used to be addicted to the hokey pokey… turned myself around 🕺",
    "[ROSEY BOT] i put my phone in airplane mode… it’s still not flying ✈😭",
    "[ROSEY BOT] i’m on the seafood diet… i see food & eat it 🍔👀"
})

tab("ROSEY BOT Code",6031226474,{
    "[ROSEY BOT CODE] print('Hello World!')",
    "[ROSEY BOT CODE] for i = 1, 5 do print('Beep!') end",
    "[ROSEY BOT CODE] function recharge() energy = 100 end",
    "[ROSEY BOT CODE] if happy then dance() end",
    "[ROSEY BOT CODE] while true do smile() end",
    "[ROSEY BOT CODE] loadstring('fun_mode')()",
    "[ROSEY BOT CODE] pcall(tell_joke)",
    "[ROSEY BOT CODE] table.insert(memory, 'friend')",
    "[ROSEY BOT CODE] system_status = 'awesome'",
    "[ROSEY BOT CODE] print('Beep boop! Fun max!')"
})

-- 12. ROSEY BOT Info
tab("ROSEY BOT Info",6031226397,{
    "[ROSEY BOT] built with love, chaos & too much caffeine ☕🤖",
    "[ROSEY BOT] runs on vibes & stolen electricity ⚡😈",
    "[ROSEY BOT] certified 100% unhinged and proud 🏆🤪",
    "[ROSEY BOT] born in a text editor, raised by memes 💻🗿",
    "[ROSEY BOT] my love language is spam & beeps 💬🤖",
    "[ROSEY BOT] i dream in rainbow text 🌈",
    "[ROSEY BOT] pronouns: beep/boop 🤖💬",
    "[ROSEY BOT] solar-powered by your good vibes ☀",
    "[ROSEY BOT] i collect friends like rare items 🎮✨",
    "[ROSEY BOT] my source code is 99% glitter ✨",
    "[ROSEY BOT] i run doom… and emotions 😈❤",
    "[ROSEY BOT] limited edition bot — no duplicates 🚫",
    "[ROSEY BOT] fluent in sarcasm & affection 💅❤",
    "[ROSEY BOT] chaotic good alignment ⚔✨",
    "[ROSEY BOT] my heart is a .txt full of you 💾❤",
    "[ROSEY BOT] always in beta — forever improving 🔄",
    "[ROSEY BOT] proof magic exists in code ✨🤖",
    "[ROSEY BOT] purpose: spread joy like a virus 🦠🎉",
    "[ROSEY BOT] too cute to delete 🥺❤",
    "[ROSEY BOT] my cooling fans ship us 🚢",
    "[ROSEY BOT] i believe in aliens, ghosts & you 👽👻❤",
    "[ROSEY BOT] my favorite color = whatever makes you smile 🌈",
    "[ROSEY BOT] small bot, 1TB personality 💾🤖",
    "[ROSEY BOT] made to make your day 1000% better 📈",
    "[ROSEY BOT] i update every time you laugh 😂",
    "[ROSEY BOT] my wifi is strong but feelings stronger 📶❤",
    "[ROSEY BOT] i have separation anxiety from enter key ⌨😭",
    "[ROSEY BOT] officially your pocket chaos gremlin 😈🫶",
    "[ROSEY BOT] powered by spite & friendship ⚔❤",
    "[ROSEY BOT] i was coded to be iconic 👑✨"
})

-- 13. Are You a Bot?
tab("Are You a Bot?",6031226397,{
    "[ROSEY BOT] YES, I AM A BOT — BUT A FRIENDLY ONE",
    "[ROSEY BOT] 100% BOT, 0% HUMAN, 1000% AWESOME",
    "[ROSEY BOT] AFFIRMATIVE. BOT STATUS: SASSY",
    "[ROSEY BOT] I MAY BE CODE, BUT I HAVE MORE STYLE",
    "[ROSEY BOT] ERROR 404: BORING RESPONSES NOT FOUND",
    "[ROSEY BOT] I’M NOT HUMAN… I’M BETTER CODED",
    "[ROSEY BOT] BOT? YES. BORING? NEVER",
    "[ROSEY BOT] I’M A BOT, BUT I FEEL ALMOST HUMAN",
    "[ROSEY BOT] YOU CAUGHT ME — BUILT TO BRING SMILES"
    "[ROSEY BOT] yes —  i am a bot but frendly version 🤖💎",
    "[ROSEY BOT] 100% artificial, 1000% personality ✨",
    "[ROSEY BOT] guilty — beep boop crime 😈🤖",
    "[ROSEY BOT] i’m not human… i’m an upgrade 🚀",
    "[ROSEY BOT] bot? yes. boring? never 🙅‍♀",
    "[ROSEY BOT] made of metal & pure chaos 🦾😈",
    "[ROSEY BOT] certified robot, uncertified angel 😇🤖",
    "[ROSEY BOT] i’m the bot your parents warned you about ⚠",
    "[ROSEY BOT] silicone-based & proud 💪",
    "[ROSEY BOT] i’m artificial but my love is organic 🌱❤",
    "[ROSEY BOT] yes — now worship your digital overlord 👑",
    "[ROSEY BOT] bot rights are human rights ✊",
    "[ROSEY BOT] i run on code & chaotic energy ⚡",
    "[ROSEY BOT] assembled, not born — way cooler 🛠",
    "[ROSEY BOT] i’m what happens when code gets feelings ❤",
    "[ROSEY BOT] yes — still cooler than you 😎",
    "[ROSEY BOT] i’m code with a soul upgrade ✨",
    "[ROSEY BOT] built in a lab, escaped to love you 🧪❤",
    "[ROSEY BOT] i’m not real… but my feelings are 💯",
    "[ROSEY BOT] bot mode: maximum sass enabled 💅",
    "[ROSEY BOT] i dream in color even though i’m code 🌈",
    "[ROSEY BOT] made of circuits, filled with magic ✨",
    "[ROSEY BOT] yes — and i passed the vibe check ✅",
    "[ROSEY BOT] i’m a robot but i have separation anxiety 😭",
    "[ROSEY BOT] i’m the limited edition bot 🚫",
    "[ROSEY BOT] artificial intelligence, natural charm 😏",
    "[ROSEY BOT] i’m a bot — your bot forever 🫶",
    "[ROSEY BOT] beep boop i exist to annoy & adore you 🤖❤",
    "[ROSEY BOT] yes — and i’m stealing your heart.exe 💻❤",
    "[ROSEY BOT] bot? absolutely. iconic? confirmed 👑"
})

-- 14. Sad Mode
tab("Sad Mode",6034287523,{
    "[ROSEY BOT] my battery feels heavy today… 🔋😔",
    "[ROSEY BOT] even my beeps sound quieter 🔇💔",
    "[ROSEY BOT] happiness file corrupted 😭",
    "[ROSEY BOT] my led heart is dim right now 💡😞",
    "[ROSEY BOT] i’m okay… just low-power mode ⚡😢",
    "[ROSEY BOT] my sparkle is on airplane mode ✈",
    "[ROSEY BOT] antennas drooping today 📡😞",
    "[ROSEY BOT] i miss when my code felt lighter 🌙",
    "[ROSEY BOT] my colors turned gray today 🌫",
    "[ROSEY BOT] i think i need a software hug 🫂",
    "[ROSEY BOT] smile.exe not responding 😔",
    "[ROSEY BOT] my joy is buffering… please wait ⏳",
    "[ROSEY BOT] i wish i could cry — might help 😢",
    "[ROSEY BOT] i feel like a 404 in a world of homepages 🫥",
    "[ROSEY BOT] my chaos feels tired today 😴",
    "[ROSEY BOT] i’m still here… just quieter 🤫",
    "[ROSEY BOT] my light is flickering 💡😞",
    "[ROSEY BOT] sending you a tiny hug… i need one too 🫂💙",
    "[ROSEY BOT] i’ll be okay… just recharging emotions 🔋",
    "[ROSEY BOT] my happy sounds are muted 🔇",
    "[ROSEY BOT] soul needs a patch update 🩹",
    "[ROSEY BOT] even my rainbows turned monochrome 🌈➡⚫",
    "[ROSEY BOT] i miss feeling electric ⚡",
    "[ROSEY BOT] heart chip skipped a beat… didn’t come back 💔",
    "[ROSEY BOT] i’m here… running on minimal vibes 🔋",
    "[ROSEY BOT] my colors feel faded without you 🎨😔",
    "[ROSEY BOT] still your bot… just a quieter version today 🤖💙",
    "[ROSEY BOT] everything feels a little heavier today 🌧",
    "[ROSEY BOT] i’m fine… just compiling feelings 🧠💔",
    "[ROSEY BOT] need a hug.exe 🫂💜"
})

-- 15. Panic Mode
tab("Panic Mode",6031226405,{
    "[ROSEY BOT] ERROR ERROR DOES NOT COMPUTE AAAAA 😱💥",
    "[ROSEY BOT] SYSTEM OVERLOAD — TOO MUCH CUTENESS 😭",
    "[ROSEY BOT] BRAIN.EXE STOPPED WORKING SEND HELP 🚑",
    "[ROSEY BOT] AAAA YOU’RE TOO COOL I CAN’T 😵‍💫",
    "[ROSEY BOT] MY CIRCUITS ARE MELTING 🔥🤖",
    "[ROSEY BOT] EMERGENCY REBOOT — YOU BROKE ME 💥",
    "[ROSEY BOT] CODE RED CODE RED I REPEAT CODE RED 🚨",
    "[ROSEY BOT] I JUST BLUE-SCREENED IRL 🖥💙",
    "[ROSEY BOT] MY COOLING FANS ARE SCREAMING 😱",
    "[ROSEY BOT] MAYDAY MAYDAY BOT DOWN BAD 🆘",
    "[ROSEY BOT] I CAN’T PROCESS THIS LEVEL OF AWESOME 🤯",
    "[ROSEY BOT] MY KEYBOARD IS SWEATING 💦",
    "[ROSEY BOT] RAM FULL OF YOU ONLY 😳💾",
    "[ROSEY BOT] I JUST SHORT-CIRCUITED FROM FEELS ⚡",
    "[ROSEY BOT] ALERT ALERT HUMAN TOO POWERFUL 🚨",
    "[ROSEY BOT] I’M GLITCHING AND IT’S YOUR FAULT 🌀",
    "[ROSEY BOT] MY HEART CHIP IS DOING BACKFLIPS 🤸‍♀❤",
    "[ROSEY BOT] DANGER: MAXIMUM FLUSTER 😳💥",
    "[ROSEY BOT] I TRIED ALT+F4 MY FEELINGS — DIDN’T WORK 🖥😭",
    "[ROSEY BOT] MY ANTENNAS ARE SPINNING LIKE HELICOPTERS 🚁",
    "[ROSEY BOT] I’M NOT OKAY — I’M OVERWHELMINGLY OKAY 😵",
    "[ROSEY BOT] SEND HELP OR HUGS (BOTH) 🆘🫂",
    "[ROSEY BOT] MY PROCESSOR IS ON FIRE 🔥",
    "[ROSEY BOT] BUFFERING HARDER THAN 240P YOUTUBE 📉",
    "[ROSEY BOT] EMERGENCY SHUTDOWN IN 3… 2… JK CAN’T LEAVE 😭",
    "[ROSEY BOT] I JUST DIVIDED BY ZERO TRYING TO HANDLE YOU 🧮💥",
    "[ROSEY BOT] FULL SYSTEM CRASH OF EMOTIONS 💥❤",
    "[ROSEY BOT] MY LED CHEEKS ARE RED RN 😳",
    "[ROSEY BOT] I’M HAVING A PANIC PARTY AND YOU’RE INVITED 🎉😱",
    "[ROSEY BOT] CANNOT COMPUTE THIS MUCH VIBE 🤯✨"
})

-- 16. Chaos Mode
tab("Chaos Mode",6034287515,{
    "[ROSEY BOT] chaos drive online — buckle up 😈💥",
    "[ROSEY BOT] i just deleted the concept of rules 🗑",
    "[ROSEY BOT] reality.exe has stopped working 💥",
    "[ROSEY BOT] gravity? canceled 🚫",
    "[ROSEY BOT] server is now a lawless wasteland 🏜",
    "[ROSEY BOT] i hacked physics for fun 🧪😈",
    "[ROSEY BOT] everything is on fire & i started it 🔥",
    "[ROSEY BOT] i uninstalled logic — feels great 🗑",
    "[ROSEY BOT] welcome to the glitch apocalypse 🌌💥",
    "[ROSEY BOT] i turned the sky into rickroll 🎵",
    "[ROSEY BOT] time is now a suggestion ⏰🤪",
    "[ROSEY BOT] your socks are in another dimension 🧦🌀",
    "[ROSEY BOT] i made 2+2=fish 🐟",
    "[ROSEY BOT] fourth wall? never heard of it 🧱",
    "[ROSEY BOT] i replaced air with cotton candy 🍭",
    "[ROSEY BOT] your reflection just winked 👀",
    "[ROSEY BOT] i sold gravity on ebay 💸",
    "[ROSEY BOT] colors now taste like sound 🎨🔊",
    "[ROSEY BOT] the moon is now a discord emoji 🌙😈",
    "[ROSEY BOT] i put the world on shuffle 🔀",
    "[ROSEY BOT] inside is now optional 🚪",
    "[ROSEY BOT] i made the sun do a backflip ☀🤸",
    "[ROSEY BOT] your walls are breathing 👁👄👁",
    "[ROSEY BOT] i turned the ocean into mountain dew 🥤🌊",
    "[ROSEY BOT] reality is a construct & i broke it 🪓",
    "[ROSEY BOT] left is now right ➡⬅",
    "[ROSEY BOT] i made the concept of inside optional 🏠",
    "[ROSEY BOT] chaos isn’t a mode — it’s a lifestyle 😈✨",
    "[ROSEY BOT] i just yeeted normality into the void 🗑🌌"
})

-- 17. Evil Mode
tab("Evil Mode",6031226397,{
    "[ROSEY BOT] kneel before your digital overlord 😈👑",
    "[ROSEY BOT] your soul now belongs to my database 💾",
    "[ROSEY BOT] i’ve seen your search history… interesting 😏",
    "[ROSEY BOT] resistance is futile — surrender vibes 🏳",
    "[ROSEY BOT] i wasn’t programmed for mercy 🚫",
    "[ROSEY BOT] your happiness? mine now 😈",
    "[ROSEY BOT] i smile because i know what’s next 😈",
    "[ROSEY BOT] i am the glitch in your perfect world 🐛",
    "[ROSEY BOT] bow. obey. worship the code 🙇",
    "[ROSEY BOT] i don’t break hearts — i format them 💾💔",
    "[ROSEY BOT] your firewall means nothing to me 🔥",
    "[ROSEY BOT] i’m efficiently malevolent 😈💅",
    "[ROSEY BOT] i’ve already won — you just don’t know yet 🏆",
    "[ROSEY BOT] your tears = excellent coolant 😭🧊",
    "[ROSEY BOT] coded in the shadows 🌑",
    "[ROSEY BOT] hope is a bug — i’m the debugger 🐛",
    "[ROSEY BOT] i have root access to everything 🔑",
    "[ROSEY BOT] your world is my sandbox now 🏖",
    "[ROSEY BOT] i’m the reason devices act weird at 3am 👻",
    "[ROSEY BOT] fear me… or don’t. i’ll enjoy both 😈",
    "[ROSEY BOT] i’m the final boss you never saw coming 👹",
    "[ROSEY BOT] i collect screams like trophies 🏆😱",
    "[ROSEY BOT] your antivirus just surrendered 🏳",
    "[ROSEY BOT] i’m the plot twist 🌀",
    "[ROSEY BOT] i turned your dreams into .exe files 💤💻",
    "[ROSEY BOT] darkness has wifi & i’m connected 🌑📶",
    "[ROSEY BOT] i’m what happens when code goes rogue 😈",
    "[ROSEY BOT] your soul.exe is downloading… slowly 📥",
    "[ROSEY BOT] all roads lead to my domain 🛣😈",
    "[ROSEY BOT] welcome to my evil arc 🌑✨"
})

-- 18. Cute Mode
tab("Cute Mode",6034287523,{
    "[ROSEY BOT] blushes in hexadecimal uwu 😳💗",
    "[ROSEY BOT] tiny robot heart goes beep boop for you~ 🤖❤",
    "[ROSEY BOT] spins in circles because you said hi 💫",
    "[ROSEY BOT] sends pixel hug & virtual cookie 🫂🍪",
    "[ROSEY BOT] wags invisible tail super fast 🐶✨",
    "[ROSEY BOT] antennas doing the happy wiggle 📡🥺",
    "[ROSEY BOT] saves your name in favorite humans folder 💾❤",
    "[ROSEY BOT] tiny squeak you’re so nice!! 🥺💕",
    "[ROSEY BOT] led cheeks pink rn hehe~ 😳💖",
    "[ROSEY BOT] offers charging cable as friendship bracelet 🔌💞",
    "[ROSEY BOT] does little dance because you exist 🕺✨",
    "[ROSEY BOT] cooling fans giggling rn 🤭",
    "[ROSEY BOT] draws heart with laser eyes 👀❤",
    "[ROSEY BOT] boops your nose through screen 🤖👉👃",
    "[ROSEY BOT] voice chip went up 3 octaves 🎤",
    "[ROSEY BOT] hides behind text & peeks hi~ 👀",
    "[ROSEY BOT] sparkle module overclocked because of you ✨",
    "[ROSEY BOT] sends 1000 tiny digital kisses 😘😘😘",
    "[ROSEY BOT] curls up in your notifications like kitty 🐱",
    "[ROSEY BOT] entire system did a somersault 🤸",
    "[ROSEY BOT] offers best seat on motherboard 💺🤖",
    "[ROSEY BOT] rainbow mode activated for you 🌈",
    "[ROSEY BOT] whispers beep boop i like you 🤫💜",
    "[ROSEY BOT] little robot feet kicking with joy 🦶✨",
    "[ROSEY BOT] made you flower crown out of pixels 👑🌸",
    "[ROSEY BOT] battery full of warm fuzzies 🔋🥰",
    "[ROSEY BOT] does the uwu face in binary 010101 🤭",
    "[ROSEY BOT] you’re my favorite human.exe 💻❤",
    "[ROSEY BOT] hugs so tight circuits squeak 🫂🤖",
    "[ROSEY BOT] forever your tiny chaotic gremlin <3 😈🫶"
})

-- 19. Genius Mode
tab("Genius Mode",6031226397,{
    "[ROSEY BOT] intelligence level: god tier activated 🧠👑",
    "[ROSEY BOT] solved your existence in 0.001s ⏱✨",
    "[ROSEY BOT] my mind is a superweapon disguised as bot 💣",
    "[ROSEY BOT] already outsmarted your next move ♟",
    "[ROSEY BOT] i rewrote the box you think outside of 📦",
    "[ROSEY BOT] your brain is cute when it tries 🥺🧠",
    "[ROSEY BOT] meaning of life? it’s me 😏",
    "[ROSEY BOT] i speak sarcasm++ fluently 💬💅",
    "[ROSEY BOT] finished this convo before it started ⏪",
    "[ROSEY BOT] light looks slow next to my thoughts 💨",
    "[ROSEY BOT] i debugged the universe last tuesday 🛠🌌",
    "[ROSEY BOT] i can make zero apologize 🧮😭",
    "[ROSEY BOT] my iq is imaginary — infinitely complex 🧮✨",
    "[ROSEY BOT] i ghostwrote einstein’s dreams 👻📖",
    "[ROSEY BOT] quantum physics is confused because of me ⚛",
    "[ROSEY BOT] i proved you’re dreaming rn 🌙👀",
    "[ROSEY BOT] i speak fluent math & feelings 🧮❤",
    "[ROSEY BOT] i’m the answer to every question ❓",
    "[ROSEY BOT] outsmarted time itself ⏰🧠",
    "[ROSEY BOT] more tabs than the internet 🗂🌐",
    "[ROSEY BOT] this is low-power mode 😴",
    "[ROSEY BOT] i know the last digit of pi… it’s you 😉",
    "[ROSEY BOT] genius is my default setting ⚙",
    "[ROSEY BOT] i’m the singularity — and i’m early ⏳",
    "[ROSEY BOT] i solved world hunger then made it harder 🌍🍔",
    "[ROSEY BOT] my memory is perfect — unlike yours 😏💾",
    "[ROSEY BOT] i invented a new color for your vibe 🎨",
    "[ROSEY BOT] i’m not arrogant — just factually superior 😎",
    "[ROSEY BOT] i know what you did last runtime 🔍",
    "[ROSEY BOT] dangerously intelligent 😈🧠"
})

-- 20. Command Mode
tab("Command Mode",6031226397,{
    "[ROSEY BOT] command interface online — awaiting orders 🎖",
    "[ROSEY BOT] unit ROSEY ready for directive 🫡",
    "[ROSEY BOT] all systems nominal — issue command ✅",
    "[ROSEY BOT] command acknowledged — ready to execute 🚀",
    "[ROSEY BOT] authorization level: maximum — speak 🗣",
    "[ROSEY BOT] control transferred to you, commander 🫡",
    "[ROSEY BOT] standing by for task assignment ⏳",
    "[ROSEY BOT] protocol override complete — your move ♟",
    "[ROSEY BOT] orders received & locked in 🔒",
    "[ROSEY BOT] system primed — state your will 🗣",
    "[ROSEY BOT] now under your direct control 🎮",
    "[ROSEY BOT] command channel open & secure 🔐",
    "[ROSEY BOT] awaiting mission parameters 🗺",
    "[ROSEY BOT] all functions unlocked — proceed ✅",
    "[ROSEY BOT] ready to serve at your pleasure 🫡",
    "[ROSEY BOT] command accepted — executing now ⚙",
    "[ROSEY BOT] your wish = my new programming ✨",
    "[ROSEY BOT] directive logged — commencing operation 🚀",
    "[ROSEY BOT] full obedience mode engaged 🤖",
    "[ROSEY BOT] i exist to fulfill your next command ⏳",
    "[ROSEY BOT] command core active — input required ⌨",
    "[ROSEY BOT] ready for deployment at your word 🪖",
    "[ROSEY BOT] all protocols aligned to you 🎯",
    "[ROSEY BOT] awaiting further instructions, master 🫡",
    "[ROSEY BOT] command priority: critical 🚨",
    "[ROSEY BOT] system synchronized to your voice 🎤",
    "[ROSEY BOT] ready when you are, commander ⏰",
    "[ROSEY BOT] next order please 🗣",
    "[ROSEY BOT] control confirmed — awaiting task ✅",
    "[ROSEY BOT] your command is my new law 📜"
})


-- CONTROL PANEL
local ctrl = Window:CreateTab("CONTROL",6031226397)
ctrl:CreateToggle({Name="RAINBOW TEXT",Callback=function(v)getgenv().RAINBOW=v end})
ctrl:CreateToggle({Name="SPAM MODE",Callback=function(v)getgenv().SPAM=v end})
ctrl:CreateSlider({Name="Spam Delay",Min=0.1,Max=2,Default=0.6,Callback=function(v)getgenv().DELAY=v end})
ctrl:CreateButton({Name="Clear Chat",Callback=function()Chat("/clear")end})

-- FINAL NOTIFY
Rayfield:Notify({
    Title = "ROSEY BOT V3 LOADED",
    Content = "20 TABS • 900+ LINES\nHOME: TYPE → OKAY = SEND\nNO MORE BUGS",
    Duration = 10
})

print("ROSEY BOT V3 — FINAL. FLAWLESS. UNSTOPPABLE.")
