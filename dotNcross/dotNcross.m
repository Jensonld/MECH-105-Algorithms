function [dotProduct,dotTheta,crossProduct,magnitudeCross] = dotNcross(a1,a2,a3,b1,b2,b3)

aMag = (a1^2+a2^2+a3^2)^(1/2); bMag = (b1^2+b2^2+b3^2)^(1/2);
dotProduct = a1*b1+a2*b2+a3*b3;
dotTheta = acosd(dotProduct/aMag/bMag);
c1 = a2*b3-a3*b2; c2 = a3*b1-a1*b3; c3 = a1*b2-a2*b1;
crossProduct = [c1 c2 c3];
magnitudeCross = (c1^2+c2^2+c3^2)^(1/2);
end