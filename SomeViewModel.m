classdef SomeViewModel < handle
    
    properties (GetAccess = public, SetAccess = private)
        Greetings (1,1) string = "Hello World"
    end
    
    properties (Access = private)
       Binder micromvvm.Binder = micromvvm.Binder()
       ViewModelListener event.listener = event.listener.empty
       Registry
    end
    
    events
        PropertyChanged
    end
    
    methods
        function obj = SomeViewModel()
            
        end
        
        function registerListener(obj)
            obj.ViewModelListener = addlistener(obj, 'PropertyChanged', @obj.setRegisteredField);
        end
        
        function registerBinding(obj, targetObject, property)
            obj.Registry = struct(property, targetObject);
        end
    end
    
    % Greetings command and setter implementation
    methods (Access = public)        
        function command = displayHelloWorld(obj)
            command = micromvvm.RelayCommand(@obj.displayHelloWorldExecute);
        end
        
        function setGreetings(obj, greetings)
            if ~isequal(obj.Greetings, greetings)
                obj.Greetings = greetings;
                obj.raisePropertyChanged('Greetings');
            end
        end
    end
    
    methods (Access = private)
        function displayHelloWorldExecute(obj)
            disp(obj.Greetings)
        end
    end
    
    methods (Access = private)
        function raisePropertyChanged(obj, propertyName)
            notify(obj, 'PropertyChanged', micromvvm.PropertyChangedData(propertyName));
        end
        
        function setRegisteredField(obj, source, event)
            event.Property
        end
    end
end