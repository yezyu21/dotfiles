-- ~/.config/hypr/hyprland.lua

-- Módulos (antes "source =", ahora se usa require con el archivo .lua)
require("modules.monitors")
require("modules.programs")
require("modules.autostart")
require("modules.env")
require("modules.decoration")
require("modules.animations")
require("modules.windowrules")
require("modules.layout")
require("modules.misc")
require("modules.input")
require("modules.bind")

-- Brillo de pantalla (equivalente a "binde", con la bandera repeating)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })
