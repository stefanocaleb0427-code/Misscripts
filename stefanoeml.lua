local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local userName = player.Name -- Detecta automáticamente tu nombre: NCT_XxBlackdarkzelxX

-- 1. Interfaz del Menú Stefano EML
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "StefanoEML_Menu"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local botonToggle = Instance.new("TextButton")
botonToggle.Size = UDim2.new(0, 50, 0, 50)
botonToggle.Position = UDim2.new(0.02, 0, 0.2, 0)
botonToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
botonToggle.Text = "💪"
botonToggle.TextSize = 24
botonToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
botonToggle.Parent = screenGui

local cornerToggle = Instance.new("UICorner")
cornerToggle.CornerRadius = UDim.new(0, 12)
cornerToggle.Parent = botonToggle

local framePrincipal = Instance.new("Frame")
framePrincipal.Size = UDim2.new(0, 260, 0, 150)
framePrincipal.Position = UDim2.new(0.02, 0, 0.3, 0)
framePrincipal.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
framePrincipal.Visible = true
framePrincipal.Parent = screenGui

local cornerFrame = Instance.new("UICorner")
cornerFrame.CornerRadius = UDim.new(0, 10)
cornerFrame.Parent = framePrincipal

local titulo = Instance.new("TextLabel")
titulo.Size = UDim2.new(0, 200, 0, 40)
titulo.Position = UDim2.new(0, 15, 0, 0)
titulo.Text = "Stefano EML"
titulo.TextSize = 18
titulo.TextColor3 = Color3.fromRGB(255, 170, 0)
titulo.Font = Enum.Font.SourceSansBold
titulo.TextXAlignment = Enum.TextXAlignment.Left
titulo.BackgroundTransparency = 1
titulo.Parent = framePrincipal

local botonX = Instance.new("TextButton")
botonX.Size = UDim2.new(0, 30, 0, 30)
botonX.Position = UDim2.new(1, -35, 0, 5)
botonX.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
botonX.Text = "X"
botonX.TextSize = 14
botonX.TextColor3 = Color3.fromRGB(255, 255, 255)
botonX.Parent = framePrincipal

local cornerX = Instance.new("UICorner")
cornerX.CornerRadius = UDim.new(0, 6)
cornerX.Parent = botonX

local fondoCasilla = Instance.new("Frame")
fondoCasilla.Size = UDim2.new(0, 25, 0, 25)
fondoCasilla.Position = UDim2.new(0, 20, 0, 70)
fondoCasilla.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
fondoCasilla.Parent = framePrincipal

local checkbox = Instance.new("TextButton")
checkbox.Size = UDim2.new(1, 0, 1, 0)
checkbox.BackgroundTransparency = 1
checkbox.Text = "" 
checkbox.TextColor3 = Color3.fromRGB(0, 255, 0)
checkbox.TextSize = 18
checkbox.Parent = fondoCasilla

local etiquetaCasilla = Instance.new("TextLabel")
etiquetaCasilla.Size = UDim2.new(0, 180, 0, 25)
etiquetaCasilla.Position = UDim2.new(0, 55, 0, 70)
etiquetaCasilla.Text = "Activar bucle hyper rápido"
etiquetaCasilla.TextSize = 14
etiquetaCasilla.TextColor3 = Color3.fromRGB(255, 255, 255)
etiquetaCasilla.BackgroundTransparency = 1
etiquetaCasilla.Parent = framePrincipal

-- 2. Lógica de Fuerza Visual Ultra Acelerada
local activado = false
local fuerzaSimulada = 338600000000000 -- Sincronizado con tu foto actual de 338.6T

local function formatNumero(num)
    if num >= 1e12 then return string.format("%.1fT", num / 1e12)
    elseif num >= 1e9 then return string.format("%.1fB", num / 1e9)
    elseif num >= 1e6 then return string.format("%.1fM", num / 1e6) end
    return tostring(num)
end

-- RenderStepped se ejecuta a más de 60 veces por segundo para ganarle por la fuerza a la tabla
game:GetService("RunService").RenderStepped:Connect(function()
    if activado then
        local textoNuevo = formatNumero(fuerzaSimulada)
        
        for _, v in ipairs(playerGui:GetDescendants()) do
            if v:IsA("TextLabel") then
                -- 1. Forzar el marcador superior del juego
                if v.Parent and (v.Parent.Name:lower():match("strength") or v.Parent.Name:lower():match("fuerza")) and not v.Parent:IsA("TextButton") then
                    v.Text = textoNuevo
                end
                
                -- 2. Forzar la tabla de clasificación buscando tu nombre exacto en las celdas
                if v.Text == userName or v.Text:match(userName) then
                    -- Al encontrar tu nombre, buscamos los textos de fuerza que están metidos en tu misma fila
                    local fila = v.Parent
                    if fila then
                        for _, celda in ipairs(fila:GetDescendants()) do
                            if celda:IsA("TextLabel") and (celda.Text:match("M") or celda.Text:match("T") or celda.Text:match("%d+")) and celda ~= v then
                                -- Ignoramos los asesinatos o renacimientos si tienen números puros sin letras
                                if celda.Text:match("M") or celda.Text:match("T") or tonumber(celda.Text) == nil then
                                    celda.Text = textoNuevo
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Bucle Hyper Rápido: Suma 1T completo (1,000,000,000,000) cada 15 milisegundos (0.015 segundos)
task.spawn(function()
    while true do
        task.wait(0.015) 
        if activado then
            fuerzaSimulada = fuerzaSimulada + 1000000000000
        end
    end
end)

-- 3. Eventos de Clic
checkbox.MouseButton1Click:Connect(function()
    activado = not activado
    if activado then
        checkbox.Text = "✓"
        fondoCasilla.BackgroundColor3 = Color3.fromRGB(0, 100, 0) 
    else
        checkbox.Text = ""
        fondoCasilla.BackgroundColor3 = Color3.fromRGB(50, 50, 50) 
    end
end)

botonX.MouseButton1Click:Connect(function() framePrincipal.Visible = false end)
botonToggle.MouseButton1Click:Connect(function() framePrincipal.Visible = not framePrincipal.Visible end)
