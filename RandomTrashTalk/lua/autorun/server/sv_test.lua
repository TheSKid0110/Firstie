util.AddNetworkString("TestNet")



hook.Add("PlayerDeath","BestieTestie", function (ply,inf,att)
    net.Start("TestNet")
    net.WriteEntity(ply)
    net.WriteEntity(att)
    net.Broadcast()
end)