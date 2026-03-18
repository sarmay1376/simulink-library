function setup()
% SETUP  Automatically import all core SES engine utilities as function handles.
% Use: from ses import setup
    
    evalin('caller', 'start = @ses.start;');
    evalin('caller', 'run = @ses.run;');
    evalin('caller', 'rundelete = @ses.rundelete;');
    evalin('caller', 'connect = @ses.connect;');
    evalin('caller', 'setparam = @ses.setparam;');
    evalin('caller', 'arrange = @ses.arrange;');
    evalin('caller', 'show = @ses.show;');
    
    fprintf('[SES] Engine utilities imported (start, run, connect, etc.)\n');
end
