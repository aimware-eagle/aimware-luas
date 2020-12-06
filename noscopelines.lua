function removescopeoverlay(lol)
    local localplayer = entities.GetLocalPlayer()
    local is_scoped = localplayer:GetPropBool("m_bIsScoped")

    if is_scoped == false then return end
    if not rscope:GetValue() then return end
    if is_scoped == true then
        localplayer:SetPropBool(false, "m_bIsScoped")
    end
end

function UI()
    rscope = gui.Checkbox(gui.Reference("Visuals","Overlay", "Weapon"), "rscope", "Remove Scope Overlay", false)
end
UI();

callbacks.Register( "DrawModel", "scope", removescopeoverlay );

-- lua by https://aimware.net/forum/user/63613
