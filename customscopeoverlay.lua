function drawshit()
    local localplayer = entities.GetLocalPlayer()
    local wpn = localplayer:GetPropEntity("m_hActiveWeapon")
    local is_scoped = wpn:GetPropBool("m_zoomLevel")
    
    if cdebug:GetValue() then
        print(wpn)
    end

    local w, h = draw.GetScreenSize();

    if not cscope:GetValue() then return end
    if is_scoped == true then
        draw.Color(cpicker:GetValue())
        draw.Line(w / 2, h / 2 - (cslider:GetValue() / 10), w / 2, h / 2 - cslider:GetValue()) -- top line
        draw.Line(w / 2, h / 2 + (cslider:GetValue() / 10), w / 2, h / 2 + cslider:GetValue()) -- bottom line
        draw.Line(w / 2 + (cslider:GetValue() / 10), h / 2, w / 2 + cslider:GetValue(), h / 2) -- right line
        draw.Line(w / 2 - (cslider:GetValue() / 10), h / 2, w / 2 - cslider:GetValue(), h / 2) -- left line
        draw.FilledCircle(w / 2, h / 2, cslider:GetValue() / 100) -- dot 63613
    end
end

function scopeoverlay(lol)
    local localplayer = entities.GetLocalPlayer()
    local is_scoped = localplayer:GetPropBool("m_bIsScoped")
    local wpn = localplayer:GetPropEntity("m_hActiveWeapon")

    if is_scoped == false then return end
    if not cscope:GetValue() then return end
    if is_scoped == true then
        local scoped = localplayer:SetPropBool(false, "m_bIsScoped")
    end
end

function UI()
    cscope = gui.Checkbox(gui.Reference("Visuals","Overlay", "Weapon"), "cscope", "Custom Scope Overlay", false)
    cdebug = gui.Checkbox(gui.Reference("Misc","General", "Logs"), "cdebug", "Scope debug", false)
    cpicker = gui.ColorPicker(gui.Reference("Visuals","Overlay", "Weapon"), "cpicker", "Overlay Color", 150, 200, 60, 255)
    cslider = gui.Slider(gui.Reference("Visuals","Overlay", "Weapon"), "cslider", "Overlay Size", 100, 50, 800, 10)
end
UI();

callbacks.Register( "DrawModel", "scope", scopeoverlay );
callbacks.Register( "Draw", "drawinshit", drawshit );

-- lua by https://aimware.net/forum/user/63613
