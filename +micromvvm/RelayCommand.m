classdef RelayCommand < micromvvm.ICommand
    
    properties (Access = private)
       Action function_handle
    end
    
    methods (Access = public)
        function obj = RelayCommand(action)
            obj.Action = action;
        end
        
        function execute(obj)
           obj.Action(); 
        end
    end
    
    
end

