local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 1. Crear el contenedor principal de la interfaz
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "StefanoEML_Menu"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- 2. Crear el botón flotante para abrir/cerrar el menú principal
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

-- 3. Crear el Marco del Menú Principal (Ventana ampliada a 190 de altura)
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

-- Título Personalizado del Menú
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

-- Botón "X" para cerrar dentro de la ventana
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

-- 4. Crear la Casilla de Activación (Checkbox)
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
checkbox.Font = Enum.Font.SourceSansBold
checkbox.Parent = fondoCasilla

-- Texto al lado de la casilla
local etiquetaCasilla = Instance.new("TextLabel")
etiquetaCasilla.Size = UDim2.new(0, 180, 0, 25)
etiquetaCasilla.Position = UDim2.new(0, 55, 0, 65)
etiquetaCasilla.Text = "Activar bucle (Format: Qa)"
etiquetaCasilla.TextSize = 14
etiquetaCasilla.TextColor3 = Color3.fromRGB(255, 255, 255)
etiquetaCasilla.Font = Enum.Font.SourceSans
etiquetaCasilla.TextXAlignment = Enum.TextXAlignment.Left
etiquetaCasilla.BackgroundTransparency = 1
etiquetaCasilla.Parent = framePrincipal

-- 5. NUEVA SECCIÓN: Créditos en la parte inferior del Menú
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

local menciónClan = Instance.new("TextLabel")
menciónClan.Size = UDim2.new(1, -30, 0, 25)
menciónClan.Position = UDim2.new(0, 15, 0, 150)
menciónClan.Text = "@clan.EML"
menciónClan.TextSize = 15
menciónClan.TextColor3 = Color3.fromRGB(255, 200, 50) -- Dorado brillante para el clan
menciónClan.Font = Enum.Font.SourceSansBold
menciónClan.TextXAlignment = Enum.TextXAlignment.Center
menciónClan.BackgroundTransparency = 1
menciónClan.Parent = framePrincipal

-- 6. Lógica de Fuerza con Conversión a Qa, Qi, Sx... (30ms)
local activado = false
local fuerzaSimulada = 338600000000000 

local siglas = {"", "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc"}

local function formatNumero(num)
    if num < 1000 then return tostring(num) end
    local id = math.floor(math.log10(num) / 3) + 1
    local siglaActual = siglas[id] or "Inf"
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
                
                if v.Text:match("%d+") and (v.Text:match("M") or v.Text:match("T") or v.Text:match("Qa")) then
                    if v.Text:match("312") or v.Text:match("336") or (v.Parent and v.Parent.Name:lower():match("cell")) then
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
botonToggle.MouseButton1Click:Connect(function() framePrincipal.Visible = not framePrincipal.Visible end)
