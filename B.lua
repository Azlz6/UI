local parts = workspace:GetDescendants()
for _, part in ipairs(parts) do
    if part:IsA("BasePart") or part:IsA("Part") then
       return part.CanTouch = false
    end
end
