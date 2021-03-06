function [tasasaciertos] = valcruzada(x,y,N)
% N numero de partes que uso en cada
% x Patrones
% y Clases
    i=1;k=5;
    while i<=N
        [xtrn,xtest,ytrn,ytest] = crossval(x,y,N,i);
        [~,aciertoeuc(i)]   = clasifeuclid(xtrn,ytrn,xtest,ytest)
        [~,aciertomahal(i)] = clasifmahal(xtrn,ytrn,xtest,ytest)
        [~,acierto1nn(i)]   = clasif1nn(xtrn,ytrn,xtest,ytest)
        [~,aciertoknn(i)]   = clasifknn(xtrn,ytrn,xtest,ytest,k)
        [~,aciertokmeans(i)]= clasifkmeans(xtrn,ytrn,xtest,ytest,k)
        i=i+1;
    end
    tasasaciertos=[mean(aciertoeuc);mean(aciertomahal);mean(acierto1nn);mean(aciertoknn);mean(aciertokmeans)];
end