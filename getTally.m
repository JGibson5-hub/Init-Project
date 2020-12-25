function [energy, tally, error] = getTally(files,searchterm)
  % files = dir(['../Data/*.io'])
  % searchterm = '1tally        8';
  direc = '../Data/';
  for i = 1:length(files)
    
    fid = fopen([direc files(i).name]);
    dat = textscan(fid, '%s', 'delimiter', '\r','headerlines',600);
    fclose(fid);
    dat = dat{:};

    firstNum = '0.0000E+00';
    endTerm = 'total';
    
    fline = 0;
    tmp = dat{1};
    while isempty(strfind(tmp,searchterm))
      fline=fline+1;
      tmp=dat{fline};
    end

    while isempty(strfind(tmp,firstNum))
      fline=fline+1;
      tmp=dat{fline};
    end

    collectNum = [];
    while isempty(strfind(tmp,endTerm))
      tmpVal = strsplit(tmp,' ');
      for idx = 1:length(tmpVal)
        collectNum = [collectNum str2num(tmpVal{idx})];
      endfor
      fline=fline+1;
      tmp=dat{fline};
    end
    
    energy{i} = collectNum(1:3:end);
    tally{i} = collectNum(2:3:end);
    error{i} = collectNum(3:3:end);

    h=waitbar(i/length(files));
  
  endfor
  
  delete(h);
  
endfunction