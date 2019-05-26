function [J] = Calcula_FactorJ(pares,Conducidas,Conductoras)
        for i_Z=1:pares
            if Conducidas(i_Z)==12
                J(i_Z)=0.21;
            elseif Conducidas(i_Z)==13
                J(i_Z)=0.22;
            elseif Conducidas(i_Z)==14
                J(i_Z)=0.23;
            elseif Conducidas(i_Z)==15
                J(i_Z)=0.25;
            elseif Conducidas(i_Z)==16
                J(i_Z)=0.27;
            elseif Conducidas(i_Z)==17
                J(i_Z)=0.29;
            elseif Conducidas(i_Z)==18 & Conductoras(i_Z)<=17
                J(i_Z)=0.30;
            elseif Conducidas(i_Z)==18 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.305;
            elseif Conducidas(i_Z)==18 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.31;
            elseif Conducidas(i_Z)==18 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.315;
            elseif Conducidas(i_Z)==18 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.32;
            elseif Conducidas(i_Z)==18 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.325;
            elseif Conducidas(i_Z)==18 & Conductoras(i_Z)>170
                J(i_Z)=0.33;
            elseif Conducidas(i_Z)==19 & Conductoras(i_Z)<=17
                J(i_Z)=0.305;
            elseif Conducidas(i_Z)==19 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.31;
            elseif Conducidas(i_Z)==19 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.315;
            elseif Conducidas(i_Z)==19 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.32;
            elseif Conducidas(i_Z)==19 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.325;
            elseif Conducidas(i_Z)==19 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.33;
            elseif Conducidas(i_Z)==19 & Conductoras(i_Z)>170 & Conductoras(i_Z)<=1000
                J(i_Z)=0.335;
            elseif Conducidas(i_Z)==19 & Conductoras(i_Z)>1000
                J(i_Z)=0.34;
            elseif Conducidas(i_Z)==20 & Conductoras(i_Z)<=17
                J(i_Z)=0.31;
            elseif Conducidas(i_Z)==20 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.32;
            elseif Conducidas(i_Z)==20 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.325;
            elseif Conducidas(i_Z)==20 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.33;
            elseif Conducidas(i_Z)==20 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.335;
            elseif Conducidas(i_Z)==20 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.34;
            elseif Conducidas(i_Z)==20 & Conductoras(i_Z)>170
                J(i_Z)=0.345;
            elseif Conducidas(i_Z)>20 & Conducidas(i_Z)<24 & Conductoras(i_Z)<=17
                J(i_Z)=0.322;
            elseif Conducidas(i_Z)>20 & Conducidas(i_Z)<24 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.33;
            elseif Conducidas(i_Z)>20 & Conducidas(i_Z)<24 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.335;
            elseif Conducidas(i_Z)>20 & Conducidas(i_Z)<24 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.34;
            elseif Conducidas(i_Z)>20 & Conducidas(i_Z)<24 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.35;
            elseif Conducidas(i_Z)>20 & Conducidas(i_Z)<24 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.355;
            elseif Conducidas(i_Z)>20 & Conducidas(i_Z)<24 & Conductoras(i_Z)>170
                J(i_Z)=0.36;
            elseif Conducidas(i_Z)==24 & Conductoras(i_Z)<=17
                J(i_Z)=0.335;
            elseif Conducidas(i_Z)==24 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.34;
            elseif Conducidas(i_Z)==24 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.345;
            elseif Conducidas(i_Z)==24 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.35;
            elseif Conducidas(i_Z)==24 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.36;
            elseif Conducidas(i_Z)==24 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.365;
            elseif Conducidas(i_Z)==24 & Conductoras(i_Z)>170
                J(i_Z)=0.37;
            elseif Conducidas(i_Z)>24 & Conducidas(i_Z)<30 & Conductoras(i_Z)<=17
                J(i_Z)=0.345;
            elseif Conducidas(i_Z)>24 & Conducidas(i_Z)<30 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.35;
            elseif Conducidas(i_Z)>24 & Conducidas(i_Z)<30 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.36;
            elseif Conducidas(i_Z)>24 & Conducidas(i_Z)<30 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.365;
            elseif Conducidas(i_Z)>24 & Conducidas(i_Z)<30 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.375;
            elseif Conducidas(i_Z)>24 & Conducidas(i_Z)<30 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.385;
            elseif Conducidas(i_Z)>24 & Conducidas(i_Z)<30 & Conductoras(i_Z)>170
                J(i_Z)=0.39;
            elseif Conducidas(i_Z)==30 & Conductoras(i_Z)<=17
                J(i_Z)=0.355;
            elseif Conducidas(i_Z)==30 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.365;
            elseif Conducidas(i_Z)==30 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.37;
            elseif Conducidas(i_Z)==30 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.38;
            elseif Conducidas(i_Z)==30 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.385;
            elseif Conducidas(i_Z)==30 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.395;
            elseif Conducidas(i_Z)==30 & Conductoras(i_Z)>170
                J(i_Z)=0.405;
            elseif Conducidas(i_Z)>30 & Conducidas(i_Z)<35 & Conductoras(i_Z)<=17
                J(i_Z)=0.365;
            elseif Conducidas(i_Z)>30 & Conducidas(i_Z)<35 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.37;
            elseif Conducidas(i_Z)>30 & Conducidas(i_Z)<35 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.375;
            elseif Conducidas(i_Z)>30 & Conducidas(i_Z)<35 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.385;
            elseif Conducidas(i_Z)>30 & Conducidas(i_Z)<35 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.395;
            elseif Conducidas(i_Z)>30 & Conducidas(i_Z)<35 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.405;
            elseif Conducidas(i_Z)>30 & Conducidas(i_Z)<35 & Conductoras(i_Z)>170
                J(i_Z)=0.415;
            elseif Conducidas(i_Z)==35 & Conductoras(i_Z)<=17
                J(i_Z)=0.37;
            elseif Conducidas(i_Z)==35 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.38;
            elseif Conducidas(i_Z)==35 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.39;
            elseif Conducidas(i_Z)==35 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.395;
            elseif Conducidas(i_Z)==35 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.405;
            elseif Conducidas(i_Z)==35 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.41;
            elseif Conducidas(i_Z)==35 & Conductoras(i_Z)>170
                J(i_Z)=0.42;
            elseif Conducidas(i_Z)>35 & Conducidas(i_Z)<40 & Conductoras(i_Z)<=17
                J(i_Z)=0.375;
            elseif Conducidas(i_Z)>35 & Conducidas(i_Z)<40 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.38;
            elseif Conducidas(i_Z)>35 & Conducidas(i_Z)<40 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.39;
            elseif Conducidas(i_Z)>35 & Conducidas(i_Z)<40 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.40;
            elseif Conducidas(i_Z)>35 & Conducidas(i_Z)<40 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.41;
            elseif Conducidas(i_Z)>35 & Conducidas(i_Z)<40 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.42;
            elseif Conducidas(i_Z)>35 & Conducidas(i_Z)<40 & Conductoras(i_Z)>170
                J(i_Z)=0.43;
            elseif Conducidas(i_Z)==40 & Conductoras(i_Z)<=17
                J(i_Z)=0.38;
            elseif Conducidas(i_Z)==40 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.39;
            elseif Conducidas(i_Z)==40 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.40;
            elseif Conducidas(i_Z)==40 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.41;
            elseif Conducidas(i_Z)==40 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.42;
            elseif Conducidas(i_Z)==40 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.43;
            elseif Conducidas(i_Z)==40 & Conductoras(i_Z)>170
                J(i_Z)=0.435;
            elseif Conducidas(i_Z)>40 & Conducidas(i_Z)<50 & Conductoras(i_Z)<=17
                J(i_Z)=0.39;
            elseif Conducidas(i_Z)>40 & Conducidas(i_Z)<50 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.40;
            elseif Conducidas(i_Z)>40 & Conducidas(i_Z)<50 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.41;
            elseif Conducidas(i_Z)>40 & Conducidas(i_Z)<50 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.42;
            elseif Conducidas(i_Z)>40 & Conducidas(i_Z)<50 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.43;
            elseif Conducidas(i_Z)>40 & Conducidas(i_Z)<50 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.44;
            elseif Conducidas(i_Z)>40 & Conducidas(i_Z)<50 & Conductoras(i_Z)>170
                J(i_Z)=0.45;
            elseif Conducidas(i_Z)==50 & Conductoras(i_Z)<=17
                J(i_Z)=0.395;
            elseif Conducidas(i_Z)==50 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.405;
            elseif Conducidas(i_Z)==50 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.415;
            elseif Conducidas(i_Z)==50 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.425;
            elseif Conducidas(i_Z)==50 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.435;
            elseif Conducidas(i_Z)==50 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.445;
            elseif Conducidas(i_Z)==50 & Conductoras(i_Z)>170
                J(i_Z)=0.455;
            elseif Conducidas(i_Z)>50 & Conducidas(i_Z)<60 & Conductoras(i_Z)<=17
                J(i_Z)=0.40;
            elseif Conducidas(i_Z)>50 & Conducidas(i_Z)<60 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.41;
            elseif Conducidas(i_Z)>50 & Conducidas(i_Z)<60 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.42;
            elseif Conducidas(i_Z)>50 & Conducidas(i_Z)<60 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.43;
            elseif Conducidas(i_Z)>50 & Conducidas(i_Z)<60 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.44;
            elseif Conducidas(i_Z)>50 & Conducidas(i_Z)<60 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.45;
            elseif Conducidas(i_Z)>50 & Conducidas(i_Z)<60 & Conductoras(i_Z)>170
                J(i_Z)=0.46;
            elseif Conducidas(i_Z)==60 & Conductoras(i_Z)<=17
                J(i_Z)=0.405;
            elseif Conducidas(i_Z)==60 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.415;
            elseif Conducidas(i_Z)==60 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.425;
            elseif Conducidas(i_Z)==60 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.44;
            elseif Conducidas(i_Z)==60 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.45;
            elseif Conducidas(i_Z)==60 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.46;
            elseif Conducidas(i_Z)==60 & Conductoras(i_Z)>170
                J(i_Z)=0.47;
            elseif Conducidas(i_Z)>60 & Conducidas(i_Z)<80 & Conductoras(i_Z)<=17        
                J(i_Z)=0.41;
            elseif Conducidas(i_Z)>60 & Conducidas(i_Z)<80 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.42;
            elseif Conducidas(i_Z)>60 & Conducidas(i_Z)<80 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.43;
            elseif Conducidas(i_Z)>60 & Conducidas(i_Z)<80 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.44;
            elseif Conducidas(i_Z)>60 & Conducidas(i_Z)<80 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.455;
            elseif Conducidas(i_Z)>60 & Conducidas(i_Z)<80 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.465;
            elseif Conducidas(i_Z)>60 & Conducidas(i_Z)<80 & Conductoras(i_Z)>170
                J(i_Z)=0.48;
            elseif Conducidas(i_Z)==80 & Conductoras(i_Z)<=17
                J(i_Z)=0.42;
            elseif Conducidas(i_Z)==80 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.43;
            elseif Conducidas(i_Z)==80 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.44;
            elseif Conducidas(i_Z)==80 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.45;
            elseif Conducidas(i_Z)==80 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.46;
            elseif Conducidas(i_Z)==80 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.475;
            elseif Conducidas(i_Z)==80 & Conductoras(i_Z)>170
                J(i_Z)=0.49;
            elseif Conducidas(i_Z)>80 & Conducidas(i_Z)<125 & Conductoras(i_Z)<=17
                J(i_Z)=0.425;
            elseif Conducidas(i_Z)>80 & Conducidas(i_Z)<125 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.435;
            elseif Conducidas(i_Z)>80 & Conducidas(i_Z)<125 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.445;
            elseif Conducidas(i_Z)>80 & Conducidas(i_Z)<125 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.46;
            elseif Conducidas(i_Z)>80 & Conducidas(i_Z)<125 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.47;
            elseif Conducidas(i_Z)>80 & Conducidas(i_Z)<125 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.485;
            elseif Conducidas(i_Z)>80 & Conducidas(i_Z)<125 & Conductoras(i_Z)>170
                J(i_Z)=0.50;
            elseif Conducidas(i_Z)==125 & Conductoras(i_Z)<=17
                J(i_Z)=0.43;
            elseif Conducidas(i_Z)==125 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.44;
            elseif Conducidas(i_Z)==125 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.45;
            elseif Conducidas(i_Z)==125 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.465;
            elseif Conducidas(i_Z)==125 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.48;
            elseif Conducidas(i_Z)==125 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.49;
            elseif Conducidas(i_Z)==125 & Conductoras(i_Z)>170
                J(i_Z)=0.51;
            elseif Conducidas(i_Z)>125 & Conducidas(i_Z)<275 & Conductoras(i_Z)<=17
                J(i_Z)=0.44;
            elseif Conducidas(i_Z)>125 & Conducidas(i_Z)<275 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.45;
            elseif Conducidas(i_Z)>125 & Conducidas(i_Z)<275 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.46;
            elseif Conducidas(i_Z)>125 & Conducidas(i_Z)<275 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.475;
            elseif Conducidas(i_Z)>125 & Conducidas(i_Z)<275 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.485;
            elseif Conducidas(i_Z)>125 & Conducidas(i_Z)<275 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.50;
            elseif Conducidas(i_Z)>125 & Conducidas(i_Z)<275 & Conductoras(i_Z)>170
                J(i_Z)=0.515;
            elseif Conducidas(i_Z)==275 & Conductoras(i_Z)<=17
                J(i_Z)=0.445;
            elseif Conducidas(i_Z)==275 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.455;
            elseif Conducidas(i_Z)==275 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.47;
            elseif Conducidas(i_Z)==275 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.48;
            elseif Conducidas(i_Z)==275 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.495;
            elseif Conducidas(i_Z)==275 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.51;
            elseif Conducidas(i_Z)==275 & Conductoras(i_Z)>170
                J(i_Z)=0.53;
            elseif Conducidas(i_Z)>275 & Conductoras(i_Z)<=17
                J(i_Z)=0.45;
            elseif Conducidas(i_Z)>275 & Conductoras(i_Z)>17 & Conductoras(i_Z)<=25
                J(i_Z)=0.46;
            elseif Conducidas(i_Z)>275 & Conductoras(i_Z)>25 & Conductoras(i_Z)<=35
                J(i_Z)=0.475;
            elseif Conducidas(i_Z)>275 & Conductoras(i_Z)>35 & Conductoras(i_Z)<=50
                J(i_Z)=0.49;
            elseif Conducidas(i_Z)>275 & Conductoras(i_Z)>50 & Conductoras(i_Z)<=85
                J(i_Z)=0.505;
            elseif Conducidas(i_Z)>275 & Conductoras(i_Z)>85 & Conductoras(i_Z)<=170
                J(i_Z)=0.52;
            elseif Conducidas(i_Z)>275 & Conductoras(i_Z)>170
                J(i_Z)=0.54;
            end
        end
end

