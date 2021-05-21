exports('drawHologram',
    function(x, y, z, text)
        local onScreen, _x, _y = World3dToScreen2d(x, y, z)
        local px, py, pz = table.unpack(GetGameplayCamCoord())
        local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    
        local scale = ((1 / dist) * 2) * (1 / GetGameplayCamFov()) * 100
    
        if onScreen then
            SetTextColour(255, 255, 255, 255)
            SetTextScale(0.0 * scale, 0.65 * scale)
            SetTextFont(4)
            SetTextProportional(1)
            SetTextCentre(true)
    
            SetTextDropshadow(1, 1, 1, 1, 255)
    
            BeginTextCommandWidth("STRING")
            AddTextComponentString(text)
            local height = GetTextScaleHeight(0.55 * scale, 4)
            local width = EndTextCommandGetWidth(4)
    
            SetTextEntry("STRING")
            AddTextComponentString(text)
            EndTextCommandDisplayText(_x, _y)
        end
    end
)