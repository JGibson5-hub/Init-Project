function table = makeTable
  
  a = dir(['../Data/*.io']);
  load('input.txt');%parameter file
  [energy1, tally1, error1] = getTally(a,['1tally        ' var(6)]);
  % add additional tallies here
  talConst = val(5);
  
  % if you need to sum over energy
  energy = energy1{1}*1000;
  eWin = [val(1) val(2) val(3) val(4)];
  Wind1logic = and(energy>eWin(1),energy<eWin(2));
  Wind2logic = and(energy>eWin(3),energy<eWin(4));

  for i = 1:length(a)
   
    table(i).CR11 = sum(tally1{i}(Wind1logic))*talConst;
    table(i).CR12 = sum(tally1(Wind2logic))*talConst;
    table(i).CR1spec = tally1{i}*talConst;
    table(i).energy = energy1{i}*1000;
    table(i).CR12 = sqrt( sum( (error1{i}(Wind2logic).*tally1{i}(Wind2logic)).^2 ) ) * talConst;
    table(i).fname = a(i).name;
    h = waitbar(i/length(a));
	
  endfor
  delete(h);
endfunction