classdef (ConstructOnLoad) PropertyChangedData < event.EventData
    %PROPERTYCHANGEDDATA Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Property
    end
    
    methods
        function eventData = PropertyChangedData(property)
            eventData.Property = property;
        end
    end
end

