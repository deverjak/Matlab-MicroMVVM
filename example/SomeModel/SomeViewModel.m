classdef SomeViewModel < micromvvm.AbstractViewModel
    
    properties (SetObservable)
        Greetings (1,1) string = "Hello World"
    end
        
    % Greetings command and setter implementation
    methods (Access = public)        
        function command = displayHelloWorld(obj)
            command = micromvvm.RelayCommand(@obj.displayHelloWorldExecute);
        end
    end
    
    methods (Access = private)
        function displayHelloWorldExecute(obj)
            disp(obj.Greetings)
        end
    end
    
end