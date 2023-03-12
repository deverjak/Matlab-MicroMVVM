classdef (Abstract) AbstractViewModel < handle
    %ABSTRACTVIEWMODEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = protected, Sealed)
       Binder micromvvm.Binder = micromvvm.Binder()
       ViewModelListener event.listener = event.listener.empty
       Registry
    end
    
    events
        PropertyChanged
    end
    
    methods
        function registerListener(obj, Sealed)
            obj.ViewModelListener = addlistener(obj, 'PropertyChanged', @obj.setRegisteredField);
        end
        
        function registerBinding(obj, targetObject, property)
            obj.Registry = struct(property, targetObject);
        end
    end
    
    methods (Access = protected, Sealed)
        function raisePropertyChanged(obj, propertyName)
            notify(obj, 'PropertyChanged', micromvvm.PropertyChangedData(propertyName));
        end
        
        function setRegisteredField(obj, source, event)
            event.Property
        end
    end
end

