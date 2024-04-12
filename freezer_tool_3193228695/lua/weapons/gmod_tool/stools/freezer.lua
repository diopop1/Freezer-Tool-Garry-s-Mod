AddCSLuaFile()
TOOL.Category = "Construction"
TOOL.Name = "Freezer" 


function TOOL:LeftClick(trace)
    
    if SERVER then
        
        local ent = trace.Entity
        
        if IsValid(ent) and not ent:IsWorld() then
            
            local physObj = ent:GetPhysicsObject()
            
            if IsValid(physObj) then
             
                physObj:EnableMotion(false)
            end
        end
    end
   
    return true
end


function TOOL:RightClick(trace)
    
    if SERVER then
        
        local ent = trace.Entity
       
        if IsValid(ent) and not ent:IsWorld() then
         
            local physObj = ent:GetPhysicsObject()
          
            if IsValid(physObj) then
               
                physObj:EnableMotion(true)

               
                local surfaceNormal = trace.HitNormal
                if surfaceNormal.z < 0.7 then
                  
                    physObj:EnableGravity(true)
                end
            end
        end
    end
   
    return true
end


if CLIENT  then
    
    TOOL.Information = {

		{ name = "info", stage = 1 },
		{ name = "left" },
		{ name = "right" },
    }
    language.Add( "tool.Freezer.name","Freezer Tool" )
    language.Add( "tool.Freezer.desc","Allows you to freeze and unfreeze objects" )
    language.Add( "tool.Freezer.left", "Freezing Items" )
	language.Add( "tool.Freezer.right", "Unfreezing Items" )
end

/*
| Copyright © diopop1 - 2024 |

[ diopop1 - development. ]
[ ChatGPT - assistance in writing code. ]

All rights reserved, but you can improve the addon and release it as an improved version but with me as the author of the original addon.
*/ 