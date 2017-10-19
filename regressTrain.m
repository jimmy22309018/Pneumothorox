function misclass = regressTrain(XT,yT,Xt,yt)
    b = regress(yT,XT);
    class = Xt * b;
    misclass=sum(abs((class-yt)).*abs((class-yt)));
    
end
