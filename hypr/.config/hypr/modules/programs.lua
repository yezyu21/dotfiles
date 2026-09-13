-------------------
--- MY PROGRAMS ---
-------------------

-- Set programs that you use
-- En Lua, si otro módulo necesita estas variables (como bind.lua),
-- hay que devolverlas como tabla con "return" y hacer require() desde el otro archivo.
return {
    terminal    = "kitty",
    fileManager = "nautilus",
    menu        = "pkill rofi || bash ~/.config/rofi/launcher.sh",
}
