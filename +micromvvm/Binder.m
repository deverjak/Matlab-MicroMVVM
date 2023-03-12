classdef Binder
    %BINDER Summary of this class goes here
    %   Detailed explanation goes here
    properties (Access = private)
        Bindings micromvvm.PropertyBinding = micromvvm.PropertyBinding.empty
    end
    
    methods(Static, Access = public)
        function setCommandAndCallback(targetObject, callbackType, invokedCommand)
            if ~isprop(targetObject, 'Command')
                targetObject.addprop('Command');
            end
            targetObject.Command = invokedCommand;
            targetObject.(callbackType) = @micromvvm.Binder.executeCommand;
        end
    end
    
    methods(Static, Access = private)
        function executeCommand(source, ~)
            command = source.Command;
            if ~isprop(command, 'Command')
                % throw InvalidPropertyException
            end
            if ~isa(command, 'micromvvm.ICommand')
                % throw InvalidPropertyException
            end
            command.execute();
        end
    end
end

