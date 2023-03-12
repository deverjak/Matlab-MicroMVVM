classdef (Abstract) AbstractViewModel < matlab.mixin.SetGetExactNames
    %ABSTRACTVIEWMODEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = protected)
        Registry event.listener = event.listener.empty
    end
    
    methods
        function registerBinding(obj, guiObj, propertyName)           
            obj.setModelToGuiBinding(guiObj, propertyName);
            if (obj.isModelPropertySetable(propertyName) && ...
                    obj.isTargetGuiObjectEditable(guiObj))
                obj.setGuiToModelBinding(guiObj, propertyName);
            end
        end
    end
    
    methods (Access = protected)
        function setModelToGuiBinding(obj, guiObj, propertyName)
            modelGuiBindingFcn = @(property,event) set(guiObj,'Value',event.AffectedObject.(property.Name));
            obj.Registry(length(obj.Registry)+1) = addlistener(obj, propertyName, 'PostSet', modelGuiBindingFcn);
        end
        
        function tf = isModelPropertySetable(obj, propertyName)
            metaprop = findprop(obj, propertyName);
            tf = isequal(metaprop.SetAccess, 'public');
        end
        
        function setGuiToModelBinding(obj, guiObj, propertyName)
            guiModelBindingFcn = @(~,event) set(obj, propertyName, event.Value);
            set(guiObj,'ValueChangedFcn',guiModelBindingFcn);
        end
        
        function tf = isTargetGuiObjectEditable(~, guiObj)
            tf = isprop(guiObj,'ValueChangedFcn');
        end
    end
    
    
end
