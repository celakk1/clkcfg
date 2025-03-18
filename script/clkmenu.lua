-- Credits To The Original Devs @xz, @goof
getgenv().Config = {
	Invite = "clkmenu.gg",
	Version = "0.1",
}

getgenv().luaguardvars = {
	DiscordName = "watermelonmuncher",
}

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/celakk1/clkcfg/refs/heads/main/script/informantwtflib.lua"))()

library:init() -- Initalizes Library Do Not Delete This

local Window = library.NewWindow({
	title = "clkmenu.gg",
	size = UDim2.new(0, 525, 0, 650)
})

local tabs = {
    Tab1 = Window:AddTab("Tab1"),
	Settings = library:CreateSettingsTab(Window),
}

-- 1 = Set Section Box To The Left
-- 2 = Set Section Box To The Right

local sections = {
	Section1 = tabs.Tab1:AddSection("Section1", 1),
	Section2 = tabs.Tab1:AddSection("Section2", 2),
}

sections.Section1:AddToggle({
	enabled = true,
	text = "Toggle1",
	flag = "Toggle_1",
	tooltip = "Tooltip1",
	risky = true, -- turns text to red and sets label to risky
})

sections.Section1:AddButton({
	enabled = true,
	text = "Button1",
	flag = "Button_1",
	tooltip = "Tooltip1",
	risky = false,
	confirm = false, -- shows confirm button
})

sections.Section1:AddSeparator({
	text = "Separator"
})

sections.Section1:AddSlider({
	text = "Slider", 
	flag = 'Slider_1', 
	suffix = "", 
	value = 0.000,
	min = 0.1, 
	max = 0.999,
	increment = 0.001,
	tooltip = "Tooltip1",
	risky = false,
})

sections.Section1:AddBind({
	text = "Keybind",
	flag = "Key_1",
	nomouse = true,
	noindicator = true,
	tooltip = "Tooltip1",
	mode = "toggle",
	bind = Enum.KeyCode.Q,
	risky = false,
})

sections.Section1:AddList({
	enabled = true,
	text = "List",
	flag = "List_1",
	multi = false,
	tooltip = "Tooltip1",
    risky = false,
    dragging = false,
    focused = false,
	value = "1",
	values = {
		"1",
		"2",
		"3"
	},
})

sections.Section1:AddBox({
    enabled = true,
    focused = true,
    text = "TextBox1",
    input = "PlaceHolder1",
	flag = "Text_1",
	risky = false,
})

sections.Section1:AddText({
    enabled = true,
    text = "Text1",
    flag = "Text_1",
    risky = false,
})

sections.Section1:AddColor({
    enabled = true,
    text = "ColorPicker1",
    flag = "Color_1",
    tooltip = "ToolTip1",
    color = Color3.new(255, 255, 255),
    trans = 0,
    open = false,
})

--Window:SetOpen(true) -- Either Close Or Open Window
