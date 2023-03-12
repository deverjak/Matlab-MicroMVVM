classdef (Abstract) AbstractViewModel < matlab.mixin.SetGet
    %ABSTRACTVIEWMODEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = protected)
        Registry event.listener = event.listener.empty
    end
    
    methods
        function registerBinding(obj, guiObj, propertyName)
            % based on https://www.mathworks.com/matlabcentral/fileexchange/90885-bindvalue
            modelGuiBindingFcn = @(property,event) set(guiObj,'Value',event.AffectedObject.(property.Name));
            obj.Registry(length(obj.Registry)+1) = addlistener(obj, propertyName, 'PostSet', modelGuiBindingFcn);
            
            guiModelBindingFcn = @(~,event) set(obj, propertyName, event.Value);
            metaprop = findprop(obj, propertyName);
            
            isEditable = isprop(guiObj,'ValueChangedFcn'); 
            isSetable = isequal(metaprop.SetAccess, 'public');
            
            if (isEditable && isSetable) 
                set(guiObj(isEditable),'ValueChangedFcn',guiModelBindingFcn);
            end
        end
    end
    
    methods (Static, Access = private)
        
    end
    
end

