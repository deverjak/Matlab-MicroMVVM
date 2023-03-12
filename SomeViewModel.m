classdef SomeViewModel < micromvvm.AbstractViewModel
    
    properties (GetAccess = public, SetAccess = private)
        Greetings (1,1) string = "Hello World"
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
    
    s
end