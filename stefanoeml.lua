local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

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
etiquetaCasilla.Text = "Activar bucle a 30ms"
etiquetaCasilla.TextSize = 14
etiquetaCasilla.TextColor3 = Color3.fromRGB(255, 255, 255)
etiquetaCasilla.BackgroundTransparency = 1
etiquetaCasilla.Parent = framePrincipal

-- 2. Lógica de Fuerza Visual (30ms)
local activado = false
local fuerzaSimulada = 338600000000000 -- Base inicial sincronizada con tus estadísticas

local function formatNumero(num)
    if num >= 1e12 then return string.format("%.1fT", num / 1e12)
    elseif num >= 1e9 then return string.format("%.1fB", num / 1e9)
    elseif num >= 1e6 then return string.format("%.1fM", num / 1e6) end
    return tostring(num)
end

-- Escáner masivo prioritario del lado gráfico del juego
game:GetService("RunService").RenderStepped:Connect(function()
    if activado then
        local textoNuevo = formatNumero(fuerzaSimulada)
        
        for _, v in ipairs(playerGui:GetDescendants()) do
            if v:IsA("TextLabel") then
                -- A) Forzar el marcador superior del juego
                if v.Parent and (v.Parent.Name:lower():match("strength") or v.Parent.Name:lower():match("fuerza")) and not v.Parent:IsA("TextButton") then
                    v.Text = textoNuevo
                end
                
                -- B) Forzar el cambio en las celdas de la tabla mediante escaneo de texto de fuerza
                -- Reemplaza cualquier coincidencia con tu rango de millones actual (como "312 M", "302 M", etc.)
                if v.Text:match("312") and v.Text:match("M") or v.Text:match("302") and v.Text:match("M") or v.Text == "312 M" or v.Text == "302 M" then
                    v.Text = textoNuevo
                elseif v.Parent and v.Parent.Name:lower():match("cell") and v.Text:match("M") and not v.Text:match("T") then
                    -- Si el juego cambia la celda de nombre dinámicamente, este filtro alternativo la atrapa
                    v.Text = textoNuevo
                end
            end
        end
    end
end)

-- Bucle moderado a 30 milisegundos: Suma 1T completo (1,000,000,000,000) cada 0.03 segundos
task.spawn(function()
    while true do
        task.wait(0.03) 
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
