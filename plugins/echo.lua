local function pre_process(msg)
local to = msg.to.type
local service = msg.service
	if to == 'user' and msg.fwd_from then
		local user = 'user#id'..msg.from.id
		local from_id = msg.fwd_from.peer_id
		if msg.fwd_from.first_name then
			from_first_name = msg.fwd_from.first_name:gsub("_", " ")
		else
			from_first_name = "None"
		end
		if msg.fwd_from.last_name then
			from_last_name = msg.fwd_from.last_name:gsub("_", " ")
		else
			from_last_name = "None"
		end
		if msg.fwd_from.username then
			from_username = "@"..msg.fwd_from.username
		else
			from_username = "@[none]"
		end
		text = "User From Info:\n\nID: "..from_id.."\nFirst: "..from_first_name.."\nLast: "..from_last_name.."\nUsername: "..from_username
		send_large_msg(user, text)
	end
	return msg
end


local function run(msg, matches)
  local text = matches[1]
  local b = 1

  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return text
end

return {
  description = "Simplest plugin ever!",
  usage = "!echo [whatever]: echoes the msg",
  patterns = {
    "^!echo +(.+)$"
  },
  run = run,
  pre_process = pre_process
}
