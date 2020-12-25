## ---- CREATE DATA WITH PROPER FORMAT ----
##  if ~exist('table')
##    table = makeTable;
##    for i = 1:length(table)
##      tmp = strsplit(table(i).fname,'_');
##      table(i).param1 = str2num(tmp{1})/10;
##      table(i).param2 = tmp{2};
##      table(i).param3 = tmp{3};
##    endfor
##  endif

## ---- RECEIVE AND VALIDATE DATA ----

## ---- PROCESS DATA USING FUNCTIONS ----

## ---- PLOT OR VALIDATE (OUTPUT .TXT) OUTPUT ----

## ---- TEMPLATES ----
##  GET PROPER DATA ROWS
##  rows = and( vertcat(table.param1)==1.75,...
##            strcmp(vertcat({table.model})','m2.io'),
##            strcmp(vertcat({table.param2})','M1') );
##  tmpTable = table(rows);

## BlueColorVal = [0.0 0.447 0.741];
## RedColorVal = [0.85 0.325 0.098];
## YellowColorVal = [0.929 0.694 0.12];
##  STANDARD PLOT
##  figure(1);clf();hold on
##    plot(dataX,dataY,'linewidth',2)
##    set(gca,'fontsize',14);xlabel('X Label');ylabel('Y Label')
##    grid on
##    xlim([ ]); ylim([]);
##    legend('Model Points','Exp Fit')
##    title(' ');
##    %set(gcf,'paperposition',[.25 .25 12 5]);% FAT
##    %set(gcf,'paperposition',[.25 .25 5 12]);% TALL
##    %print('-djpg','..\Figures\Fig1.jpg')

##  EXAMPLE FIT
##  wgts = [1 1 1 1];
##  model = @(x,thk) x(1) * exp(-x(2)*thk) + x(3);
##  costFun = @(x) (cRates - model(x,colThks)).*wgts;
##  fitVar = lsqnonlin(costFun,[3 1 .1]);

##  PLOT 2-AXIS FIGURE
##  figure(1);clf()
##  plot(xVals,yVals,'linewidth',2)
##  legend('CR1','CR2','location','north')
##  set(gca,'fontsize',14);xlabel('X Label');ylabel('Y Label')
##  ax1=gca;
##  axes
##  plot(xVals_2,yVals_2,'.k','markersize',9)
##  set(gca,'color','none','position',get(ax1,'position'),'yaxislocation','right',...
##      'xticklabel',[],'fontsize',14)
##  grid on
##  ylabel('Ylabel 2')

##  LOG TYPE PLOT WITH INVERTED Y AXIS
##  figure(1);clf();hold on
##    gc1 = get(gcf,'position');
##    set(gcf,'position',[gc1(1) 75 400 900]);
##    plot(nPhi,plotDepth,'linewidth',2)
##    ylim([1650 1800])
##    xlim([-15 45])
##    grid on
##    set(gca,'fontsize',14);;xlabel('X Label');ylabel('Y Label');
##    set(gca,'ydir','reverse','xdir','reverse','xaxislocation','top','position',[0.12 0.13 0.775 0.80])
##    legend('Leg 1','Leg 2')
##    %title(' ');
##    %set(gcf,'paperposition',[.25 .25 5 12])
##    %print('-djpg','Figures\Fig2.jpg')

## IMAGE PLOT
##  rangeVal = 20e3:30e3;
##  figure(1);clf();hold on
##    gc1 = get(gcf,'position');
##    set(gcf,'position',[gc1(1) 75 400 900]);
##    surf(0:15, rangeVal, imageOut(rangeVal,:) )
##    set(gca,'ydir','reverse','fontsize',14,'xaxislocation','top')
##    view(2)
##    colormap('copper')
##    shading interp;
##    caxis([2.2 3])
##    xlim([0 15]);ylim([rangeVal(1) rangeVal(end)])
##    xlabel('X Label');ylabel('Y Label')
##    set(gcf,'paperposition',[.25 .25 5 12])
##    print('-djpg','..\Figures\Fig3.jpg')