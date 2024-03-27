hook.Add("InitPostEntity","Loading",function()
    local word = {"dominated","overpowering","slayed","annihilated","crushed","decimated","eliminated","exterminated","obliterated","conquered","overwhelmed","devastated","subjugated"}

    local ChosenColor = Color(200,200,200)



    local Frame = vgui.Create( "DFrame" )
    Frame:SetTitle( "ColorPicker3000" )
    Frame:SetSize( 300,300 )
    Frame:Center()
    Frame:SetVisible(false)
    Frame.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
        draw.RoundedBox( 0, 0, 0, w, h, Color( 231, 76, 60, 150 ) ) -- Draw a red box instead of the frame
    end

    local ColorPicker = vgui.Create( "DColorMixer", Frame )
    ColorPicker:SetSize( 200, 200 )
    ColorPicker:SetPos(50, 50)
    ColorPicker:SetPalette( true )
    ColorPicker:SetAlphaBar( true )
    ColorPicker:SetWangs( true )
    ColorPicker:SetColor( Color( 255, 255, 255 ) )

    local ConfirmColor = vgui.Create("DButton", Frame)
    ConfirmColor:SetText( "I want this color" )
    ConfirmColor:SetSize( 90, 30 )
    ConfirmColor:SetPos( 100, Frame:GetTall() - 40 )
    ConfirmColor.DoClick = function()
        ChosenColor = ColorPicker:GetColor() -- Grabs the red, green, blue, and alpha values as a Color object
        Frame:SetVisible(false)
    end

    concommand.Add("ColorPick",function (ply,cmd,args)
        Frame:SetVisible(true)
        Frame:MakePopup()
    end)

    net.Receive("TestNet", function()
        local ply = net.ReadEntity()
        local att = net.ReadEntity()
        local ran = math.random(1,13)
        chat.AddText(ChosenColor,att ," ", word[ran]," ", ply)
    end)
end)