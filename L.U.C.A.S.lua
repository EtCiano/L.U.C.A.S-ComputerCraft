-- ======================================================================== --
-- L. U. C. A. S -- Logística Unificada de Crafting Automático e Sistemas   --
-- Por    - EtCiano                                                         --
-- Versão - 1.0                                                             --
-- ======================================================================== --

local nomeBauEntrada = "minecraft:barrel_4"
local bauEntrada = peripheral.wrap(nomeBauEntrada)

-- testando o monitor
local monitor = peripheral.wrap("right")
monitor.write("Ola Mundo!")

local craftingsCaminho = {}

local craftingsPossiveis = {
    mixer = {
        name = "mechanical mixer",
        id = 1,
        localCraft = "basin_0",
    },
    press_depot = {
        name = "mechanical press com depot",
        id = 2,
        localCraft = "create:depot_0",
    },
    millstone = {
        name = "millstone",
        id = 3,
        localCraft = "create:millstone_0",
    },
    press_basin = {
        name = "mechanical press com basin",
        id = 4,
        localCraft = "basin_1",
    }
}

local function craftar(caminho)
    local crafting = nil
    for _, c in pairs(craftingsPossiveis) do
        if c.id == tonumber(caminho) then
            crafting = c
            break
        end
    end
    if not crafting then
        print("Erro: Crafting '" .. caminho .. "' não encontrado!")
        return
    end
    
    print("Executando crafting: " .. crafting.name)
    
    local localCraft = peripheral.wrap(crafting.localCraft)

    local ingredientes = {}
    for slot, item in pairs(bauEntrada.list()) do
        ingredientes[item.name] = true
        bauEntrada.pushItems(crafting.localCraft, slot)

        repeat
            sleep(0.5)
            local aindaTemIngrediente = false
            for i, itemLocalCraft in pairs(localCraft.list()) do
                if ingredientes[itemLocalCraft.name] then
                    aindaTemIngrediente = true
                else
                    localCraft.pushItems(nomeBauEntrada, i)
                end
            end
        until not aindaTemIngrediente
    end
    
    -- =========================================================================
    -- TODO: Fazer com que o programa espere o crafting terminar para continuar
    -- TODO: Sistema de filtro
    -- =========================================================================

end

if not bauEntrada then
    print("Erro: Baú de entrada '" .. nomeBauEntrada .. "' não encontrado!")
    return
end
print("")
print(" = - Sistema L.U.C.A.S iniciado. Pressione Ctrl+T para parar - =")
print("")

while true do
    local itens = bauEntrada.list()
    
    print("Itens encontrados:")
    
    for slot, item in pairs(itens) do
        print(item.name .. " - Quantidade: " .. item.count)
    end
    
    print("")
    
    print("->> Insira o caminho dos itens, separados por espaço:")
    local craftingsOrdenados = {}
    for _, crafting in pairs(craftingsPossiveis) do
        table.insert(craftingsOrdenados, crafting)
    end
    table.sort(craftingsOrdenados, function(a, b) return a.id < b.id end)
    for _, crafting in ipairs(craftingsOrdenados) do
        print(crafting.id .. " - " .. crafting.name)
    end
    
    io.write("->> ")
    inputCraftings = io.read()
    craftingsCaminho = {}
    for word in inputCraftings:gmatch("%S+") do
        table.insert(craftingsCaminho, word)
    end

    for i, craftCaminho in ipairs(craftingsCaminho) do
        craftar(craftCaminho)
    end
    
    print("Processo finalizado.")
    sleep(1)
end