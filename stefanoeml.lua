local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

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
framePrincipal.BorderSizePixel = 0
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
botonX.Font = Enum.Font.SourceSansBold
botonX.Parent = framePrincipal

local cornerX = Instance.new("UICorner")
cornerX.CornerRadius = UDim.new(0, 6)
cornerX.Parent = botonX

local fondoCasilla = Instance.new("Frame")
fondoCasilla.Size = UDim2.new(0, 25, 0, 25)
fondoCasilla.Position = UDim2.new(0, 20, 0, 70)
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

local etiquetaCasilla = Instance.new("TextLabel")
etiquetaCasilla.Size = UDim2.new(0, 180, 0, 25)
etiquetaCasilla.Position = UDim2.new(0, 55, 0, 70)
etiquetaCasilla.Text = "Activar bucle (+1T / seg)"
etiquetaCasilla.TextSize = 14
etiquetaCasilla.TextColor3 = Color3.fromRGB(255, 255, 255)
etiquetaCasilla.Font = Enum.Font.SourceSans
etiquetaCasilla.TextXAlignment = Enum.TextXAlignment.Left
etiquetaCasilla.BackgroundTransparency = 1
etiquetaCasilla.Parent = framePrincipal

local activado = false
local fuerzaSimulada = 302100000000000 

local function formatNumero(num)
    if num >= 1e12 then
        return string.format("%.1fT", num / 1e12)
    elseif num >= 1e9 then
        return string.format("%.1fB", num / 1e9)
    elseif num >= 1e6 then
        return string.format("%.1fM", num / 1e6)
    end
    return tostring(num)
end

task.spawn(function()
    while true do
        task.wait(1)
        if activado then
            fuerzaSimulada = fuerzaSimulada + 1000000000000 
            local textoNuevo = formatNumero(fuerzaSimulada)
            
            for _, v in ipairs(playerGui:GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextBox") then
                    if v.Text:match("M") or v.Text:match("T") or string.lower(v.Name):match("fuerza") or string.lower(v.Name):match("strength") then
                        v.Text = textoNuevo
                    end
                end
            end
        end
    end
end)

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

botonX.MouseButton1Click:Connect(function()
    framePrincipal.Visible = false
end)

botonToggle.MouseButton1Click:Connect(function()
    framePrincipal.Visible = not framePrincipal.Visible
end)
