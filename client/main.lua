local opened = false
local PreviousComponent = {}
local PreviousTexture = {}
local PreviousTorso = {}

RegisterCommand(Config.Command, function()
    if not opened then
        opened = true
        SendNUIMessage({
            action = 'show'
        })

        SetNuiFocus(true, true)
        SetNuiFocusKeepInput(true)

        StartLoopControls()
    end
end, false)

RegisterKeyMapping(Config.Command, 'Open Clothing Menu', 'keyboard', Config.KeyToOpen)

function StartLoopControls()
    CreateThread(function()
        while opened do
            Wait(0)

            DisableControlAction(0, 1, true) -- disable mouse look
            DisableControlAction(0, 2, true) -- disable mouse look
            DisableControlAction(0, 3, true) -- disable mouse look
            DisableControlAction(0, 4, true) -- disable mouse look
            DisableControlAction(0, 5, true) -- disable mouse look
            DisableControlAction(0, 6, true) -- disable mouse look
            DisableControlAction(0, 263, true) -- disable melee
            DisableControlAction(0, 264, true) -- disable melee
            DisableControlAction(0, 257, true) -- disable melee
            DisableControlAction(0, 140, true) -- disable melee
            DisableControlAction(0, 141, true) -- disable melee
            DisableControlAction(0, 142, true) -- disable melee
            DisableControlAction(0, 143, true) -- disable melee
            DisableControlAction(0, 177, true) -- disable escape
            DisableControlAction(0, 200, true) -- disable escape
            DisableControlAction(0, 202, true) -- disable escape
            DisableControlAction(0, 322, true) -- disable escape
            DisableControlAction(0, 245, true) -- disable chat
            DisableControlAction(0, 37, true) -- disable TAB
            DisableControlAction(0, 261, true) -- disable mouse wheel
            DisableControlAction(0, 262, true) -- disable mouse wheel
            HideHudComponentThisFrame(19)
            DisablePlayerFiring(PlayerId(), true) -- disable weapon firing
        end
    end)
end

RegisterNUICallback('close', function()
    SendNUIMessage({
        action = 'hide'
    })
    SetNuiFocus(false, false)
    opened = false
end)

RegisterNUICallback('select', function(data)
    local playerPed = PlayerPedId()
    local item = data.item

    if PreviousComponent[item] == nil then
        if item == 'shirt' then
            PreviousComponent[item] = GetPedDrawableVariation(playerPed, 11)
            PreviousTexture[item] = GetPedTextureVariation(playerPed, 11)
            PreviousTorso[item] = GetPedDrawableVariation(playerPed, 3)
            PlayAnim(item)
            if GetPedGender(playerPed) == 'male' then
                SetPedComponentVariation(playerPed, 11, Config.TakeOff.male.shirt, 0, 2)
                SetPedComponentVariation(playerPed, 8, 15, 0, 2)
                SetPedComponentVariation(playerPed, 3, 15, 0, 2)
            elseif GetPedGender(playerPed) == 'female' then
                SetPedComponentVariation(playerPed, 11, Config.TakeOff.female.shirt, 0, 2)
                SetPedComponentVariation(playerPed, 8, 15, 0, 2)
                SetPedComponentVariation(playerPed, 3, 15, 0, 2)
            end
        elseif item == 'pants' then
            PreviousComponent[item] = GetPedDrawableVariation(playerPed, 4)
            PreviousTexture[item] = GetPedTextureVariation(playerPed, 4)
            PlayAnim(item)
            if GetPedGender(playerPed) == 'male' then
                SetPedComponentVariation(playerPed, 4, Config.TakeOff.male.pants, 0, 2)
            elseif GetPedGender(playerPed) == 'female' then
                SetPedComponentVariation(playerPed, 4, Config.TakeOff.female.pants, 0, 2)
            end
        elseif item == 'shoes' then
            PreviousComponent[item] = GetPedDrawableVariation(playerPed, 6)
            PreviousTexture[item] = GetPedTextureVariation(playerPed, 6)
            PlayAnim(item)
            if GetPedGender(playerPed) == 'male' then
                SetPedComponentVariation(playerPed, 6, Config.TakeOff.male.shoes, 0, 2)
            elseif GetPedGender(playerPed) == 'female' then
                SetPedComponentVariation(playerPed, 6, Config.TakeOff.female.shoes, 0, 2)
            end
        elseif item == 'jewelry' then
            PreviousComponent[item] = GetPedDrawableVariation(playerPed, 7)
            PreviousTexture[item] = GetPedTextureVariation(playerPed, 7)
            PlayAnim(item)
            if GetPedGender(playerPed) == 'male' then
                SetPedComponentVariation(playerPed, 7, Config.TakeOff.male.jewelry, 0, 2)
            elseif GetPedGender(playerPed) == 'female' then
                SetPedComponentVariation(playerPed, 7, Config.TakeOff.female.jewelry, 0, 2)
            end
        elseif item == 'glasses' then
            PlayAnim(item)
            PreviousComponent[item] = GetPedPropIndex(playerPed, 1)
            PreviousTexture[item] = GetPedPropTextureIndex(playerPed, 1)
            if GetPedGender(playerPed) == 'male' then
                SetPedPropIndex(playerPed, 1, Config.TakeOff.male.glasses, 0, false)
            elseif GetPedGender(playerPed) == 'female' then
                SetPedPropIndex(playerPed, 1, Config.TakeOff.female.glasses, 0, false)
            end
        elseif item == 'watch' then
            PreviousComponent[item] = GetPedPropIndex(playerPed, 6)
            PreviousTexture[item] = GetPedPropTextureIndex(playerPed, 6)
            PlayAnim(item)
            if GetPedGender(playerPed) == 'male' then
                SetPedPropIndex(playerPed, 6, Config.TakeOff.male.watch, 0, false)
            elseif GetPedGender(playerPed) == 'female' then
                SetPedPropIndex(playerPed, 6, Config.TakeOff.female.watch, 0, false)
            end
        elseif item == 'vest' then
            PreviousComponent[item] = GetPedDrawableVariation(playerPed, 9)
            PreviousTexture[item] = GetPedTextureVariation(playerPed, 9)
            PlayAnim(item)
            if GetPedGender(playerPed) == 'male' then
                SetPedComponentVariation(playerPed, 9, Config.TakeOff.male.vest, 0, 2)
            elseif GetPedGender(playerPed) == 'female' then
                SetPedComponentVariation(playerPed, 9, Config.TakeOff.female.vest, 0, 2)
            end
        elseif item == 'mask' then
            PreviousComponent[item] = GetPedDrawableVariation(playerPed, 1)
            PreviousTexture[item] = GetPedTextureVariation(playerPed, 1)
            PlayAnim(item)
            if GetPedGender(playerPed) == 'male' then
                SetPedComponentVariation(playerPed, 1, Config.TakeOff.male.mask, 0, 2)
            elseif GetPedGender(playerPed) == 'female' then
                SetPedComponentVariation(playerPed, 1, Config.TakeOff.female.mask, 0, 2)
            end
        elseif item == 'ear' then
            PreviousComponent[item] = GetPedPropIndex(playerPed, 2)
            PreviousTexture[item] = GetPedPropTextureIndex(playerPed, 2)
            PlayAnim(item)
            ClearPedProp(playerPed, 2)
        elseif item == 'hat' then
            PreviousComponent[item] = GetPedPropIndex(playerPed, 0)
            PreviousTexture[item] = GetPedPropTextureIndex(playerPed, 0)
            PlayAnim(item)
            if GetPedGender(playerPed) == 'male' then
                SetPedPropIndex(playerPed, 0, Config.TakeOff.male.hat, 0, false)
            elseif GetPedGender(playerPed) == 'female' then
                SetPedPropIndex(playerPed, 0, Config.TakeOff.female.hat, 0, false)
            end
        elseif item == 'bag' then
            PreviousComponent[item] = GetPedDrawableVariation(playerPed, 5)
            PreviousTexture[item] = GetPedTextureVariation(playerPed, 5)
            PlayAnim(item)
            if GetPedGender(playerPed) == 'male' then
                SetPedComponentVariation(playerPed, 5, Config.TakeOff.male.bag, 0, 2)
            elseif GetPedGender(playerPed) == 'female' then
                SetPedComponentVariation(playerPed, 5, Config.TakeOff.female.bag, 0, 2)
            end
        elseif item == 'gloves' then
            if GetPedDrawableVariation(playerPed, 3) > 15 then
                PreviousComponent[item] = GetPedDrawableVariation(playerPed, 3)
                PreviousTexture[item] = GetPedTextureVariation(playerPed, 3)
                PlayAnim(item)
                if GetPedGender(playerPed) == 'male' then
                    SetPedComponentVariation(playerPed, 3, Config.TakeOff.male.gloves, 0, 2)
                elseif GetPedGender(playerPed) == 'female' then
                    SetPedComponentVariation(playerPed, 3, Config.TakeOff.female.gloves, 0, 2)
                end
            end
        end
    else
        if item == 'shirt' then
            PlayAnim(item)
            SetPedComponentVariation(playerPed, 11, PreviousComponent[item], PreviousTexture[item], 2)
            SetPedComponentVariation(playerPed, 3, PreviousTorso[item], 0, 2)
            PreviousTorso[item] = nil
            PreviousComponent[item] = nil
            PreviousTexture[item] = nil
        elseif item == 'pants' then
            PlayAnim(item)
            SetPedComponentVariation(playerPed, 4, PreviousComponent[item], PreviousTexture[item], 2)
            PreviousComponent[item] = nil
            PreviousTexture[item] = nil
        elseif item == 'shoes' then
            PlayAnim(item)
            SetPedComponentVariation(playerPed, 6, PreviousComponent[item], PreviousTexture[item], 2)
            PreviousComponent[item] = nil
            PreviousTexture[item] = nil
        elseif item == 'jewelry' then
            PlayAnim(item)
            SetPedComponentVariation(playerPed, 7, PreviousComponent[item], PreviousTexture[item], 2)
            PreviousComponent[item] = nil
            PreviousTexture[item] = nil
        elseif item == 'glasses' then
            PlayAnim(item)
            SetPedPropIndex(playerPed, 1, PreviousComponent[item], PreviousTexture[item], false)
            PreviousComponent[item] = nil
            PreviousTexture[item] = nil
        elseif item == 'watch' then
            PlayAnim(item)
            SetPedPropIndex(playerPed, 6, PreviousComponent[item], PreviousTexture[item], false)
            PreviousComponent[item] = nil
            PreviousTexture[item] = nil
        elseif item == 'vest' then
            PlayAnim(item)
            SetPedComponentVariation(playerPed, 9, PreviousComponent[item], PreviousTexture[item], 2)
            PreviousComponent[item] = nil
            PreviousTexture[item] = nil
        elseif item == 'mask' then
            PlayAnim(item)
            SetPedComponentVariation(playerPed, 1, PreviousComponent[item], PreviousTexture[item], 2)
            PreviousComponent[item] = nil
            PreviousTexture[item] = nil
        elseif item == 'ear' then
            PlayAnim(item)
            SetPedPropIndex(playerPed, 2, PreviousComponent[item], PreviousTexture[item], false)
            PreviousComponent[item] = nil
            PreviousTexture[item] = nil
        elseif item == 'hat' then
            PlayAnim(item)
            SetPedPropIndex(playerPed, 0, PreviousComponent[item], PreviousTexture[item], false)
            PreviousComponent[item] = nil
            PreviousTexture[item] = nil
        elseif item == 'bag' then
            PlayAnim(item)
            SetPedComponentVariation(playerPed, 5, PreviousComponent[item], PreviousTexture[item], 2)
            PreviousComponent[item] = nil
            PreviousTexture[item] = nil
        elseif item == 'gloves' then
            PlayAnim(item)
            SetPedComponentVariation(playerPed, 3, PreviousComponent[item], PreviousTexture[item], 2)
            PreviousComponent[item] = nil
            PreviousTexture[item] = nil
        end
    end
end)

RegisterNUICallback('reset', function(data, cb)
    local playerPed = PlayerPedId()

    if PreviousComponent['shirt'] ~= nil then
        SetPedComponentVariation(playerPed, 11, PreviousComponent['shirt'], PreviousTexture['shirt'], 2)
        SetPedComponentVariation(playerPed, 3, PreviousTorso['shirt'], 0, 2)
        PreviousTorso['shirt'] = nil
        PreviousComponent['shirt'] = nil
        PreviousTexture['shirt'] = nil
    end

    if PreviousComponent['pants'] ~= nil then
        SetPedComponentVariation(playerPed, 4, PreviousComponent['pants'], PreviousTexture['pants'], 2)
        PreviousComponent['pants'] = nil
        PreviousTexture['pants'] = nil
    end

    if PreviousComponent['shoes'] ~= nil then
        SetPedComponentVariation(playerPed, 6, PreviousComponent['shoes'], PreviousTexture['shoes'], 2)
        PreviousComponent['shoes'] = nil
        PreviousTexture['shoes'] = nil
    end

    if PreviousComponent['jewelry'] ~= nil then
        SetPedComponentVariation(playerPed, 7, PreviousComponent['jewelry'],
        PreviousTexture['jewelry'], 2)
        PreviousComponent['jewelry'] = nil
        PreviousTexture['jewelry'] = nil
    end

    if PreviousComponent['glasses'] ~= nil then
        SetPedPropIndex(playerPed, 1, PreviousComponent['glasses'], PreviousTexture['glasses'], false)
        PreviousComponent['glasses'] = nil
        PreviousTexture['glasses'] = nil
    end

    if PreviousComponent['watch'] ~= nil then
        SetPedPropIndex(playerPed, 6, PreviousComponent['watch'], PreviousTexture['watch'], false)
        PreviousComponent['watch'] = nil
        PreviousTexture['watch'] = nil
    end

    if PreviousComponent['vest'] ~= nil then
        SetPedComponentVariation(playerPed, 9, PreviousComponent['vest'], PreviousTexture['vest'], 2)
        PreviousComponent['vest'] = nil
        PreviousTexture['vest'] = nil
    end

    if PreviousComponent['mask'] ~= nil then
        SetPedComponentVariation(playerPed, 1, PreviousComponent['mask'], PreviousTexture['mask'], 2)
        PreviousComponent['mask'] = nil
        PreviousTexture['mask'] = nil
    end

    if PreviousComponent['ear'] ~= nil then
        SetPedPropIndex(playerPed, 2, PreviousComponent['ear'], PreviousTexture['ear'], false)
        PreviousComponent['ear'] = nil
        PreviousTexture['ear'] = nil
    end

    if PreviousComponent['hat'] ~= nil then
        SetPedPropIndex(playerPed, 0, PreviousComponent['hat'], PreviousTexture['hat'], false)
        PreviousComponent['hat'] = nil
        PreviousTexture['hat'] = nil
    end

    if PreviousComponent['bag'] ~= nil then
        SetPedComponentVariation(playerPed, 5, PreviousComponent['bag'], PreviousTexture['bag'], 2)
        PreviousComponent['bag'] = nil
        PreviousTexture['bag'] = nil
    end

    if PreviousComponent['gloves'] ~= nil then
        SetPedComponentVariation(playerPed, 3, PreviousComponent['gloves'], PreviousTexture['gloves'], 2)
        PreviousComponent['gloves'] = nil
        PreviousTexture['gloves'] = nil
    end

    cb('ok')
end)

function PlayAnim(item)
    local playerPed = PlayerPedId()
    local anim = nil
    local dict = nil
    local move = nil

    if item == 'shirt' then
        dict = 'missmic4'
        anim = 'michael_tux_fidget'
        move = 51
    elseif item == 'pants' then
        dict = 're@construction'
        anim = 'out_of_breath'
        move = 51
    elseif item == 'shoes' then
        dict = 'random@domestic'
        anim = 'pickup_low'
        move = 0
    elseif item == 'jewelry' then
        dict = 'clothingtie'
        anim = 'try_tie_positive_a'
        move = 51
    elseif item == 'glasses' then
        dict = 'clothingspecs'
        anim = 'take_off'
        move = 51
    elseif item == 'watch' then
        dict = 'nmt_3_rcm-10'
        anim = 'cs_nigel_dual-10'
        move = 51
    elseif item == 'vest' then
        dict = 'clothingtie'
        anim = 'try_tie_negative_a'
        move = 51
    elseif item == 'mask' then
        dict = 'mp_masks@standard_car@ds@'
        anim = 'put_on_mask'
        move = 51
    elseif item == 'ear' then
        dict = 'mp_cp_stolen_tut'
        anim = 'b_think'
        move = 51
    elseif item == 'hat' then
        dict = 'mp_masks@standard_car@ds@'
        anim = 'put_on_mask'
        move = 51
    elseif item == 'bag' then
        dict = 'anim@heists@ornate_bank@grab_cash'
        anim = 'intro'
        move = 51
    elseif item == 'gloves' then
        dict = 'nmt_3_rcm-10'
        anim = 'cs_nigel_dual-10'
        move = 51
    end


    while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(100) end
    TaskPlayAnim(playerPed, dict, anim, 3.0, 3.0, 1500, move, 0, false, false, false)
    Wait(1500)
end

function GetPedGender(playerPed)
    local male = GetHashKey("mp_m_freemode_01")
    local female = GetHashKey("mp_f_freemode_01")
	local gender = GetEntityModel(playerPed)

    if gender == male then
        return 'male'
    elseif gender == female then
        return 'female'
    end
end