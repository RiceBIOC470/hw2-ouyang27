function mm=meannonan(x)
zz = [];
for ii = 1:length(x(1,:))
    col = x(:,ii);
    notin = isnan(col)|isinf(col);
    col(notin) = [];
    zz(ii) = mean(col);
end
mm = zz;