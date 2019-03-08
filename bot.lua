serpent = require ("serpent")
------------------------------------------------------------------------
function sleep(n)
os.execute("sleep " .. tonumber(n))
end
function dl_cb(arg,data)
end
function STORM(msg,data)
if msg then
Time = os.time() - 60
if msg.date < tonumber(Time) then
print('OLD MESSAGE')
return false
end
local user_id = msg.sender_user_id
local reply_id = msg.reply_to_message_id
local caption = msg.content.caption
local text = msg.content.text -- the text
if msg.chat_id then
local id = tostring(msg.chat_id)
if id:match('-100(%d+)') then
chat_type = 'supergroup'
elseif id:match('^(%d+)') then
chat_type = 'user'
else
chat_type = 'group'
end
end
if msg.content.text then
print(msg.content.text)
end
if chat_type == 'supergroup' then


if text == 'hi' then 
print('hi taha')
end


end -- end type
end -- end msg
end -- STORM
-------------------------------
function tdbot_update_callback(data)
if (data._ == "updateNewMessage") then
STORM(data.message,data)
elseif (data._ == "updateMessageSendSucceeded") then
local msg = data.message	
local text = msg.content.text
elseif (data._== "updateMessageEdited") then
run(data.message,data)
msg = data
local function edit(a,b,c)
STORM(b,data)
end
assert (tdbot_function (
{_ = "getMessage", 
chat_id = data.chat_id,
message_id = data.message_id 
}, edit, nil))

end -- end new msg
end -- end callback_tdbot

