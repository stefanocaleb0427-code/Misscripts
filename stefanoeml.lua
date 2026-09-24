local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local userInputService = game:GetService("UserInputService")

-- 1. Crear el contenedor principal de la interfaz
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "StefanoEML_Menu"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- 2. Crear el botón flotante (Configurado para ser arrastrable)
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

-- SCRIPT INTERNO PARA HACER EL BOTÓN ARRASTRABLE EN MÓVIL Y PC
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    botonToggle.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

botonToggle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = botonToggle.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

botonToggle.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

userInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- 3. Marco del Menú Stefano EML (Ventana)
local framePrincipal = Instance.new("Frame")
framePrincipal.Size = UDim2.new(0, 260, 0, 190)
framePrincipal.Position = UDim2.new(0.02, 0, 0.3, 0)
framePrincipal.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
framePrincipal.BorderSizePixel = 0
framePrincipal.Visible = true
framePrincipal.Parent = screenGui

local cornerFrame = Instance.new("UICorner")
cornerFrame.CornerRadius = UDim.new(0, 10)
cornerFrame.Parent = framePrincipal

-- Título
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

-- Botón "X"
local botonX = Instance.new("TextButton")
botonX.Size = UDim2.new(0, 30, 0, 30)
botonX.Position = UDim2.new(1, -35, 0, 5)
botonX.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
botonX.Text = "X"
botonX.TextSize = 14
botonX.TextColor3 = Color3.fromRGB(255, 255, 255)
botonX.Font = Enum.Font.SourceSansBold
botonX.Parent = framePrincipal

local cornerX = Instance.new("UICorner")
cornerX.CornerRadius = UDim.new(0, 6)
cornerX.Parent = botonX

-- 4. Casilla de Activación (Checkbox)
local fondoCasilla = Instance.new("Frame")
fondoCasilla.Size = UDim2.new(0, 25, 0, 25)
fondoCasilla.Position = UDim2.new(0, 20, 0, 65)
fondoCasilla.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
fondoCasilla.Parent = framePrincipal

local cornerCasilla = Instance.new("UICorner")
cornerCasilla.CornerRadius = UDim.new(0, 4)
cornerCasilla.Parent = fondoCasilla

local checkbox = Instance.new("TextButton")
checkbox.Size = UDim2.new(1, 0, 1, 0)
checkbox.BackgroundTransparency = 1
checkbox.Text = "" 
checkbox.TextColor3 = Color3.fromRGB(0, 255, 0)
checkbox.TextSize = 18
checkbox.Parent = fondoCasilla

local etiquetaCasilla = Instance.new("TextLabel")
etiquetaCasilla.Size = UDim2.new(0, 180, 0, 25)
etiquetaCasilla.Position = UDim2.new(0, 55, 0, 65)
etiquetaCasilla.Text = "Activar bucle a 30ms (Qa)"
etiquetaCasilla.TextSize = 14
etiquetaCasilla.TextColor3 = Color3.fromRGB(255, 255, 255)
etiquetaCasilla.Font = Enum.Font.SourceSans
etiquetaCasilla.TextXAlignment = Enum.TextXAlignment.Left
etiquetaCasilla.BackgroundTransparency = 1
etiquetaCasilla.Parent = framePrincipal

-- 5. Sección de Créditos del Clan
local lineaDivisoria = Instance.new("Frame")
lineaDivisoria.Size = UDim2.new(1, -30, 0, 1)
lineaDivisoria.Position = UDim2.new(0, 15, 0, 120)
lineaDivisoria.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
lineaDivisoria.BorderSizePixel = 0
lineaDivisoria.Parent = framePrincipal

local textoCreditos = Instance.new("TextLabel")
textoCreditos.Size = UDim2.new(1, -30, 0, 20)
textoCreditos.Position = UDim2.new(0, 15, 0, 130)
textoCreditos.Text = "Créditos:"
textoCreditos.TextSize = 12
textoCreditos.TextColor3 = Color3.fromRGB(150, 150, 150)
textoCreditos.Font = Enum.Font.SourceSansItalic
textoCreditos.TextXAlignment = Enum.TextXAlignment.Center
textoCreditos.BackgroundTransparency = 1
textoCreditos.Parent = framePrincipal

local mencionClan = Instance.new("TextLabel")
mencionClan.Size = UDim2.new(1, -30, 0, 25)
mencionClan.Position = UDim2.new(0, 15, 0, 150)
mencionClan.Text = "@clan.EML"
mencionClan.TextSize = 15
mencionClan.TextColor3 = Color3.fromRGB(255, 200, 50) 
mencionClan.Font = Enum.Font.SourceSansBold
mencionClan.TextXAlignment = Enum.TextXAlignment.Center
mencionClan.BackgroundTransparency = 1
mencionClan.Parent = framePrincipal

-- 6. Lógica de Fuerza con Conversión a Qa (30ms)
local activado = false
local fuerzaSimulada = 338600000000000 

local siglas = {"", "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc"}

local function formatNumero(num)
    if num < 1000 then return tostring(num) end
    local id = math.floor(math.log10(num) / 3) + 1
    if id > #siglas then id = #siglas end
    local siglaActual = siglas[id]
    local valorRedondeado = num / (10 ^ ((id - 1) * 3))
    return string.format("%.1f%s", valorRedondeado, siglaActual)
end

game:GetService("RunService").RenderStepped:Connect(function()
    if activado then
        local textoNuevo = formatNumero(fuerzaSimulada)
        
        for _, v in ipairs(playerGui:GetDescendants()) do
            if v:IsA("TextLabel") then
                if v.Parent and (v.Parent.Name:lower():match("strength") or v.Parent.Name:lower():match("fuerza")) and not v.Parent:IsA("TextButton") then
                    v.Text = textoNuevo
                end
                
                if v.Parent and (v.Parent.Name:lower():match("leader") or v.Parent.Name:lower():match("cell") or v.Parent.Name:lower():match("row")) then
                    if v.Text:match("M") or v.Text:match("T") or v.Text:match("Qa") then
                        v.Text = textoNuevo
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.03) 
        if activado then
            fuerzaSimulada = fuerzaSimulada + 1000000000000 
        end
    end
end)

-- 7. Configurar Eventos de Clic
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

-- Clic normal abre o cierra el menú (pero mantener presionado te permite arrastrarlo)
botonToggle.MouseButton1Click:Connect(function()
    if not dragging then
        framePrincipal.Visible = not framePrincipal.Visible
    end
end)
