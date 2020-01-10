%-----------------------------------------------------------------------------
% Copyright Notice
%
% Copyright (c) 2002, Sandia Corporation, Albuquerque, NM, USA.  Under the
% terms of Contract DE-AC04-94AL85000, there is a non-exclusive license for
% use of this work by or on behalf of the U.S. Government.  Export of this
% program may require a license from the United States Government.
%-----------------------------------------------------------------------------
%
%
% Plot Xyce output
%
%function [out,fig] = plotXyce(file,plt,varargin)
function [out,fig] = plotXyce(file,plt,varargin)

if nargin==1,
  plt=true;
end;

fid = fopen(file,'r');
str = fgetl(fid);
line = strread(str,'%s');
vars_to_plot = {line{3:end}};
time_ind = 2;
vars_ind = [3:length(line)];

N = length(vars_to_plot);

% remove first line from file
eval(sprintf('!tail -n +2 %s > %s.2',file,file));
% remove last line from file
eval(sprintf('!grep -v Xyce %s.2 > %s.tmp',file,file));
% remove tmp file
eval(sprintf('!rm %s.2',file));

disp('Loading file...');
data = load(strcat(file,'.tmp'));

out.data = data;
out.vars_to_plot = vars_to_plot;
out.vars_ind = vars_ind;

if (plt),
  fig = figure;
  for i=1:N
    subplot(N,1,i);
    plot(data(:,time_ind),data(:,vars_ind(i)),varargin{:});
    ylabel(vars_to_plot{i});
    if (i==1),
      title(sprintf('Xyce simulation:  %s',file));
    end;
    if (i==N),
      xlabel('time');
    end;
  end;
end;


% vim:set tabstop=2 expandtab shiftwidth=2 shiftround:
