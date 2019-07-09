function [d_C_final,d_G1_final,d_J1_final,d_D_final] = CalculaEjes_Intermedios(Y_simple,Y_interm,Fr,Ft,T,m,Sut,d,Asup,bsup,Conductoras,Conducidas,i_ejes,i_torsor)
    %Cálculo de esfuerzos
    %Plano xy
    Rdy=(Fr(i_ejes)*(Y_simple/2)+Fr(i_ejes+1)*(Y_interm-(Y_simple/2)))/(Y_interm);                      %Momentos con respecto al punto C
    Rcy=Fr(i_ejes)+Fr(i_ejes+1)-Rdy;                                                                    %Fuerzas en y
    %Plano xz
    Rdz=(Ft(i_ejes)*(Y_simple/2)+Ft(i_ejes+1)*(Y_interm-(Y_simple/2)))/(Y_interm);                      %Momentos con respecto al punto C
    Rcz=Ft(i_ejes)+Ft(i_ejes+1)-Rdz;                                                                    %Fuerzas en z

    %Cortantes
    %Plano xy
    Txy_C=Rcy;
    Txy_G=Rcy;
    Txy_J=Rdy-(Rcy-Fr(i_ejes));
    Txy_D=Rdy;
    %Plano xz
    Txz_C=Rcz;
    Txz_G=Rcz;
    Txz_J=Rdz-(Rcz-Ft(i_ejes));
    Txz_D=Rdz;

    %Momento flector
    %Plano xy
    Mfxy_G=Txy_C*(Y_simple/2);
    Mfxy_J=Txy_D*(Y_simple/2);
    %Plano xz
    Mfxz_G=Txz_C*(Y_simple/2);
    Mfxz_J=Txz_D*(Y_simple/2);

    %Momentos flectores resultantes en engranajes
    Mg=sqrt((Mfxy_G^2)+(Mfxz_G^2));
    Mj=sqrt((Mfxy_J^2)+(Mfxz_J^2));

    %Concentradores de tensiones
    KfF=2;
    KfT=3;

    %PUNTO C (entrada eje)
    %Cortante
    T_C=sqrt((Txy_C^2)+(Txz_C^2));
    tau_alt_C=(4/3)*((4*T_C)/pi);

    %Cálculo de las tensiones equivalentes
    sigma_eq_alt_C=sqrt(3)*tau_alt_C;

    %Aplicando criterio Goodman y suponiendo n=2, podemos calcular el diámetro
    %del árbol
    n=2;
    Se_prima=0.5*Sut;
    Ccarga=1;                                                                   %Porque está sometido a flexión
    Ctam=1.189*d^(-0.097);
    Csup=Asup*Sut^(bsup);
    Ctemp=1;                                                                    %T<450º
    Cfiab=0.814;                                                                %Fiabilidad 99%
    %Resistencia a la fatiga
    Se_C=Ccarga*Ctam*Csup*Ctemp*Cfiab*Se_prima;

    %Diámetro inicial punto C
    d_C_prima=sqrt((2*sigma_eq_alt_C)/Se_C);

    %Recalcular para el nuevo diámetro
    if d_C_prima<8
        Ctam_C=1;
    else
        Ctam_C=1.189*d_C_prima^(-0.097);
    end
    Se_C_nuevo=Ccarga*Ctam_C*Csup*Ctemp*Cfiab*Se_prima;
    d_C=sqrt((2*sigma_eq_alt_C)/Se_C_nuevo);

    %Elegir el diámetro normalizado que más se ajuste a los cálculos
    if d_C<=4
        d_C_final=4;
    elseif d_C>4 & d_C<=5
        d_C_final=5;
    elseif d_C>5 & d_C<=6
        d_C_final=6;
    elseif d_C>6 & d_C<=8
        d_C_final=8;
    elseif d_C>8 & d_C<=10
        d_C_final=10;
    elseif d_C>10 & d_C<=12
        d_C_final=12;
    elseif d_C>12 & d_C<=15
        d_C_final=15;
    elseif d_C>15 & d_C<=20
        d_C_final=20;
    elseif d_C>20 & d_C<=25
        d_C_final=25;
    elseif d_C>25 & d_C<=30
        d_C_final=30;
    elseif d_C>30 & d_C<=35
        d_C_final=35;
    elseif d_C>35 & d_C<=40
        d_C_final=40;
    elseif d_C>40 & d_C<=45
        d_C_final=45;
    elseif d_C>45 & d_C<=50
        d_C_final=50;
    elseif d_C>50 & d_C<=55
        d_C_final=55;
    elseif d_C>55 & d_C<=60
        d_C_final=60;
    elseif d_C>60 & d_C<=70
        d_C_final=70;
    elseif d_C>70 & d_C<=80
        d_C_final=80;
    elseif d_C>80 & d_C<=90
        d_C_final=90;
    elseif d_C>90 & d_C<=100
        d_C_final=100;
    elseif d_C>100 & d_C<=110
        d_C_final=110;
    elseif d_C>110 & d_C<=120
        d_C_final=120;
    elseif d_C>120 & d_C<=140
        d_C_final=140;
    elseif d_C>140 & d_C<=160
        d_C_final=160;
    elseif d_C>160 & d_C<=180
        d_C_final=180;
    elseif d_C>180 & d_C<=200
        d_C_final=200;
    elseif d_C>200 & d_C<=240
        d_C_final=240;
    elseif d_C>240 & d_C<=260
        d_C_final=260;
    elseif d_C>260 & d_C<=280
        d_C_final=280;
    elseif d_C>280 & d_C<=300
        d_C_final=300;
    elseif d_C>300 & d_C<=320
        d_C_final=320;
    elseif d_C>320 & d_C<=340
        d_C_final=340;
    elseif d_C>340 & d_C<=360
        d_C_final=360;
    elseif d_C>360 & d_C<=380
        d_C_final=380;
    elseif d_C>380 & d_C<=400
        d_C_final=400;
    elseif d_C>400 & d_C<=420
        d_C_final=420;
    elseif d_C>420 & d_C<=440
        d_C_final=440;
    elseif d_C>440 & d_C<=460
        d_C_final=460;
    elseif d_C>460 & d_C<=480
        d_C_final=480;
    elseif d_C>480 & d_C<=500
        d_C_final=500;
    elseif d_C>500 & d_C<=530
        d_C_final=530;
    elseif d_C>530 & d_C<=560
        d_C_final=560;
    elseif d_C>560 & d_C<=600
        d_C_final=600;
    elseif d_C>600 & d_C<=630
        d_C_final=630;
    elseif d_C>630 & d_C<=670
        d_C_final=670;
    elseif d_C>670 & d_C<=710
        d_C_final=710;
    elseif d_C>710 & d_C<=750
        d_C_final=750;
    elseif d_C>750 & d_C<=800
        d_C_final=800;
    elseif d_C>800 & d_C<=850
        d_C_final=850;
    else
        d_C_final=round(d_C);
    end

    %PUNTO G (primer punto intermedio)
    %Momento flector
    sigma_Mf_G=(32*Mg)/pi;
    sigma_alt_G=KfF*sigma_Mf_G;
    %Momento torsor
    tau_Mt_G=(16*T(i_torsor)*1000)/pi;
    tau_med_G=KfT*tau_Mt_G;
    %Cortante
    T_G=sqrt((Txy_G^2)+(Txz_G^2));
    tau_alt_G=(4/3)*((4*T_G)/pi);

    %Cálculo de las tensiones equivalentes
    sigma_eq_alt_G_1=sigma_alt_G;
    sigma_eq_alt_G_2=sqrt(3)*tau_alt_G;
    sigma_eq_med_G=sqrt(3)*tau_med_G;

    %Resistencia a la fatiga
    Se_G=Se_C;

    %Diámetro inicial punto G
    t1_G_prima=(((Se_G*sigma_eq_med_G+Sut*sigma_eq_alt_G_1)/(0.5*Se_G*Sut))+sqrt((((Se_G*sigma_eq_med_G+Sut*sigma_eq_alt_G_1)/(0.5*Se_G*Sut))^2)-4*(((Sut*sigma_eq_alt_G_2)^3)/(27*((0.5*Se_G*Sut)^3)))))/2;
    t2_G_prima=(((Se_G*sigma_eq_med_G+Sut*sigma_eq_alt_G_1)/(0.5*Se_G*Sut))-sqrt((((Se_G*sigma_eq_med_G+Sut*sigma_eq_alt_G_1)/(0.5*Se_G*Sut))^2)-4*(((Sut*sigma_eq_alt_G_2)^3)/(27*((0.5*Se_G*Sut)^3)))))/2;
    d_G_prima=nthroot(t1_G_prima,3)+nthroot(t2_G_prima,3);

    %Recalcular para el nuevo diámetro
    if d_G_prima<8
        Ctam_G=1;
    else
        Ctam_G=1.189*(d_G_prima^(-0.097));
    end
    Se_G_nuevo=Ccarga*Ctam_G*Csup*Ctemp*Cfiab*Se_prima;
    t1_G=(((Se_G_nuevo*sigma_eq_med_G+Sut*sigma_eq_alt_G_1)/(0.5*Se_G_nuevo*Sut))+sqrt((((Se_G_nuevo*sigma_eq_med_G+Sut*sigma_eq_alt_G_1)/(0.5*Se_G_nuevo*Sut))^2)-4*(((Sut*sigma_eq_alt_G_2)^3)/(27*((0.5*Se_G_nuevo*Sut)^3)))))/2;
    t2_G=(((Se_G_nuevo*sigma_eq_med_G+Sut*sigma_eq_alt_G_1)/(0.5*Se_G_nuevo*Sut))-sqrt((((Se_G_nuevo*sigma_eq_med_G+Sut*sigma_eq_alt_G_1)/(0.5*Se_G_nuevo*Sut))^2)-4*(((Sut*sigma_eq_alt_G_2)^3)/(27*((0.5*Se_G_nuevo*Sut)^3)))))/2;
    d_G=nthroot(t1_G,3)+nthroot(t2_G,3);

    %Elegir el diámetro normalizado que más se ajuste a los cálculos
    if d_G<=4
        d_G_final=4;
    elseif d_G>4 & d_G<=5
        d_G_final=5;
    elseif d_G>5 & d_G<=6
        d_G_final=6;
    elseif d_G>6 & d_G<=8
        d_G_final=8;
    elseif d_G>8 & d_G<=10
        d_G_final=10;
    elseif d_G>10 & d_G<=12
        d_G_final=12;
    elseif d_G>12 & d_G<=14
        d_G_final=14;
    elseif d_G>14 & d_G<=15
        d_G_final=15;
    elseif d_G>15 & d_G<=20
        d_G_final=20;
    elseif d_G>20 & d_G<=25
        d_G_final=25;
    elseif d_G>25 & d_G<=30
        d_G_final=30;
    elseif d_G>30 & d_G<=32
        d_G_final=32;
    elseif d_G>32 & d_G<=35
        d_G_final=35;
    elseif d_G>35 & d_G<=40
        d_G_final=40;
    elseif d_G>40 & d_G<=45
        d_G_final=45;
    elseif d_G>45 & d_G<=50
        d_G_final=50;
    elseif d_G>50 & d_G<=55
        d_G_final=55;
    elseif d_G>55 & d_G<=60
        d_G_final=60;
    elseif d_G>60 & d_G<=70
        d_G_final=70;
    elseif d_G>70 & d_G<=80
        d_G_final=80;
    elseif d_G>80 & d_G<=90
        d_G_final=90;
    elseif d_G>90 & d_G<=100
        d_G_final=100;
    elseif d_G>100 & d_G<=110
        d_G_final=110;
    elseif d_G>110 & d_G<=120
        d_G_final=120;
    elseif d_G>120 & d_G<=140
        d_G_final=140;
    elseif d_G>140 & d_G<=160
        d_G_final=160;
    elseif d_G>160 & d_G<=180
        d_G_final=180;
    elseif d_G>180 & d_G<=200
        d_G_final=200;
    elseif d_G>200 & d_G<=240
        d_G_final=240;
    elseif d_G>240 & d_G<=260
        d_G_final=260;
    elseif d_G>260 & d_G<=280
        d_G_final=280;
    elseif d_G>280 & d_G<=300
        d_G_final=300;
    elseif d_G>300 & d_G<=320
        d_G_final=320;
    elseif d_G>320 & d_G<=340
        d_G_final=340;
    elseif d_G>340 & d_G<=360
        d_G_final=360;
    elseif d_G>360 & d_G<=380
        d_G_final=380;
    elseif d_G>380 & d_G<=400
        d_G_final=400;
    elseif d_G>400 & d_G<=420
        d_G_final=420;
    elseif d_G>420 & d_G<=440
        d_G_final=440;
    elseif d_G>440 & d_G<=460
        d_G_final=460;
    elseif d_G>460 & d_G<=480
        d_G_final=480;
    elseif d_G>480 & d_G<=500
        d_G_final=500;
    elseif d_G>500 & d_G<=530
        d_G_final=530;
    elseif d_G>530 & d_G<=560
        d_G_final=560;
    elseif d_G>560 & d_G<=600
        d_G_final=600;
    elseif d_G>600 & d_G<=630
        d_G_final=630;
    elseif d_G>630 & d_G<=670
        d_G_final=670;
    elseif d_G>670 & d_G<=710
        d_G_final=710;
    elseif d_G>710 & d_G<=750
        d_G_final=750;
    elseif d_G>750 & d_G<=800
        d_G_final=800;
    elseif d_G>800 & d_G<=850
        d_G_final=850;
    else
        d_G_final=round(d_G);
    end

    %Comprobar que el diámetro normalizado coincide con el diámetro interior 
    %del engranaje de salida
    if m(i_ejes)==2 & Conducidas(i_ejes)>=12 & Conducidas(i_ejes)<=20 & d_G_final<=10
        d_G1_final=10;
    elseif m(i_ejes)==2 & Conducidas(i_ejes)>=21 & Conducidas(i_ejes)<=28 & d_G_final<=12
        d_G1_final=12;
    elseif m(i_ejes)==2 & Conducidas(i_ejes)>=29 & Conducidas(i_ejes)<=40 & d_G_final<=14
        d_G1_final=14;
    elseif m(i_ejes)==2 & Conducidas(i_ejes)>=41 & Conducidas(i_ejes)<=74 & d_G_final<=16
        d_G1_final=16;
    elseif m(i_ejes)==2 & Conducidas(i_ejes)>=75 & Conducidas(i_ejes)<=120 & d_G_final<=20
        d_G1_final=20;
    elseif m(i_ejes)==3 & Conducidas(i_ejes)>=12 & Conducidas(i_ejes)<=15 & d_G_final<=12
        d_G1_final=12;
    elseif m(i_ejes)==3 & Conducidas(i_ejes)>=16 & Conducidas(i_ejes)<=20 & d_G_final<=14
        d_G1_final=14;
    elseif m(i_ejes)==3 & Conducidas(i_ejes)>=21 & Conducidas(i_ejes)<=35 & d_G_final<=16
        d_G1_final=16;
    elseif m(i_ejes)==3 & Conducidas(i_ejes)>=36 & Conducidas(i_ejes)<=69 & d_G_final<=20
        d_G1_final=20;
    elseif m(i_ejes)==3 & Conducidas(i_ejes)>=70 & Conducidas(i_ejes)<=110 & d_G_final<=25
        d_G1_final=25;
    elseif m(i_ejes)==3 & Conducidas(i_ejes)>=114 & Conducidas(i_ejes)<=120 & d_G_final<=30
        d_G1_final=30;
    elseif m(i_ejes)==4 & Conducidas(i_ejes)>=12 & Conducidas(i_ejes)<=15 & d_G_final<=14
        d_G1_final=14;
    elseif m(i_ejes)==4 & Conducidas(i_ejes)>=16 & Conducidas(i_ejes)<=22 & d_G_final<=16
        d_G1_final=16;
    elseif m(i_ejes)==4 & Conducidas(i_ejes)>=23 & Conducidas(i_ejes)<=35 & d_G_final<=20
        d_G1_final=20;
    elseif m(i_ejes)==4 & Conducidas(i_ejes)>=36 & Conducidas(i_ejes)<=75 & d_G_final<=25
        d_G1_final=25;
    elseif m(i_ejes)==4 & Conducidas(i_ejes)>=76 & Conducidas(i_ejes)<=110 & d_G_final<=30
        d_G1_final=30;
    elseif m(i_ejes)==5 & Conducidas(i_ejes)>=12 & Conducidas(i_ejes)<=27 & d_G_final<=20
        d_G1_final=20;
    elseif m(i_ejes)==5 & Conducidas(i_ejes)>=28 & Conducidas(i_ejes)<=49 & d_G_final<=25
        d_G1_final=25;
    elseif m(i_ejes)==5 & Conducidas(i_ejes)>=50 & Conducidas(i_ejes)<=110 & d_G_final<=30
        d_G1_final=30;
    elseif m(i_ejes)==6 & Conducidas(i_ejes)>=12 & Conducidas(i_ejes)<=23 & d_G_final<=20
        d_G1_final=20;
    elseif m(i_ejes)==6 & Conducidas(i_ejes)>=24 & Conducidas(i_ejes)<=40 & d_G_final<=25
        d_G1_final=25;
    else
        message9=sprintf('El diámetro requerido para el eje intermedio es mayor que el diámetro interior del engranaje de entrada (etapa %d) que ha sido seleccionado.',i_ejes);
        f50=msgbox({message9;' ';...
            'Pruebe a modificar alguno de los siguientes datos introducidos:';...
            '1. Seleccionar otro material para los ejes.';...
            '2. Disminuir la dimensión Y de la caja.';...
            '3. Disminuir la potencia a transmitir.';...
            '4. Aumentar la velocidad de entrada o salida (la más pequeña).'},'Error','error');
        d_G1_final=d_G_final;
    end

    %PUNTO J (segundo punto intermedio)
    %Momento flector
    sigma_Mf_J=(32*Mj)/pi;
    sigma_alt_J=KfF*sigma_Mf_J;
    %Momento torsor
    tau_Mt_J=(16*T(i_torsor)*1000)/pi;
    tau_med_J=KfT*tau_Mt_J;
    %Cortante
    T_J=sqrt((Txy_J^2)+(Txz_J^2));
    tau_alt_J=(4/3)*((4*T_J)/pi);

    %Cálculo de las tensiones equivalentes
    sigma_eq_alt_J_1=sigma_alt_J;
    sigma_eq_alt_J_2=sqrt(3)*tau_alt_J;
    sigma_eq_med_J=sqrt(3)*tau_med_J;

    %Resistencia a la fatiga
    Se_J=Se_C;

    %Diámetro inicial punto J
    t1_J_prima=(((Se_J*sigma_eq_med_J+Sut*sigma_eq_alt_J_1)/(0.5*Se_J*Sut))+sqrt((((Se_J*sigma_eq_med_J+Sut*sigma_eq_alt_J_1)/(0.5*Se_J*Sut))^2)-4*(((Sut*sigma_eq_alt_J_2)^3)/(27*((0.5*Se_J*Sut)^3)))))/2;
    t2_J_prima=(((Se_J*sigma_eq_med_J+Sut*sigma_eq_alt_J_1)/(0.5*Se_J*Sut))-sqrt((((Se_J*sigma_eq_med_J+Sut*sigma_eq_alt_J_1)/(0.5*Se_J*Sut))^2)-4*(((Sut*sigma_eq_alt_J_2)^3)/(27*((0.5*Se_J*Sut)^3)))))/2;
    d_J_prima=nthroot(t1_J_prima,3)+nthroot(t2_J_prima,3);

    %Recalcular para el nuevo diámetro
    if d_J_prima<8
        Ctam_J=1;
    else
        Ctam_J=1.189*(d_J_prima^(-0.097));
    end
    Se_J_nuevo=Ccarga*Ctam_J*Csup*Ctemp*Cfiab*Se_prima;
    t1_J=(((Se_J_nuevo*sigma_eq_med_J+Sut*sigma_eq_alt_J_1)/(0.5*Se_J_nuevo*Sut))+sqrt((((Se_J_nuevo*sigma_eq_med_J+Sut*sigma_eq_alt_J_1)/(0.5*Se_J_nuevo*Sut))^2)-4*(((Sut*sigma_eq_alt_J_2)^3)/(27*((0.5*Se_J_nuevo*Sut)^3)))))/2;
    t2_J=(((Se_J_nuevo*sigma_eq_med_J+Sut*sigma_eq_alt_J_1)/(0.5*Se_J_nuevo*Sut))-sqrt((((Se_J_nuevo*sigma_eq_med_J+Sut*sigma_eq_alt_J_1)/(0.5*Se_J_nuevo*Sut))^2)-4*(((Sut*sigma_eq_alt_J_2)^3)/(27*((0.5*Se_J_nuevo*Sut)^3)))))/2;
    d_J=nthroot(t1_J,3)+nthroot(t2_J,3);

    %Elegir el diámetro normalizado que más se ajuste a los cálculos
    if d_J<=4
        d_J_final=4;
    elseif d_J>4 & d_J<=5
        d_J_final=5;
    elseif d_J>5 & d_J<=6
        d_J_final=6;
    elseif d_J>6 & d_J<=8
        d_J_final=8;
    elseif d_J>8 & d_J<=10
        d_J_final=10;
    elseif d_J>10 & d_J<=12
        d_J_final=12;
    elseif d_J>12 & d_J<=14
        d_J_final=14;
    elseif d_J>14 & d_J<=15
        d_J_final=15;
    elseif d_J>15 & d_J<=20
        d_J_final=20;
    elseif d_J>20 & d_J<=25
        d_J_final=25;
    elseif d_J>25 & d_J<=30
        d_J_final=30;
    elseif d_J>30 & d_J<=32
        d_J_final=32;
    elseif d_J>32 & d_J<=35
        d_J_final=35;
    elseif d_J>35 & d_J<=40
        d_J_final=40;
    elseif d_J>40 & d_J<=45
        d_J_final=45;
    elseif d_J>45 & d_J<=50
        d_J_final=50;
    elseif d_J>50 & d_J<=55
        d_J_final=55;
    elseif d_J>55 & d_J<=60
        d_J_final=60;
    elseif d_J>60 & d_J<=70
        d_J_final=70;
    elseif d_J>70 & d_J<=80
        d_J_final=80;
    elseif d_J>80 & d_J<=90
        d_J_final=90;
    elseif d_J>90 & d_J<=100
        d_J_final=100;
    elseif d_J>100 & d_J<=110
        d_J_final=110;
    elseif d_J>110 & d_J<=120
        d_J_final=120;
    elseif d_J>120 & d_J<=140
        d_J_final=140;
    elseif d_J>140 & d_J<=160
        d_J_final=160;
    elseif d_J>160 & d_J<=180
        d_J_final=180;
    elseif d_J>180 & d_J<=200
        d_J_final=200;
    elseif d_J>200 & d_J<=240
        d_J_final=240;
    elseif d_J>240 & d_J<=260
        d_J_final=260;
    elseif d_J>260 & d_J<=280
        d_J_final=280;
    elseif d_J>280 & d_J<=300
        d_J_final=300;
    elseif d_J>300 & d_J<=320
        d_J_final=320;
    elseif d_J>320 & d_J<=340
        d_J_final=340;
    elseif d_J>340 & d_J<=360
        d_J_final=360;
    elseif d_J>360 & d_J<=380
        d_J_final=380;
    elseif d_J>380 & d_J<=400
        d_J_final=400;
    elseif d_J>400 & d_J<=420
        d_J_final=420;
    elseif d_J>420 & d_J<=440
        d_J_final=440;
    elseif d_J>440 & d_J<=460
        d_J_final=460;
    elseif d_J>460 & d_J<=480
        d_J_final=480;
    elseif d_J>480 & d_J<=500
        d_J_final=500;
    elseif d_J>500 & d_J<=530
        d_J_final=530;
    elseif d_J>530 & d_J<=560
        d_J_final=560;
    elseif d_J>560 & d_J<=600
        d_J_final=600;
    elseif d_J>600 & d_J<=630
        d_J_final=630;
    elseif d_J>630 & d_J<=670
        d_J_final=670;
    elseif d_J>670 & d_J<=710
        d_J_final=710;
    elseif d_J>710 & d_J<=750
        d_J_final=750;
    elseif d_J>750 & d_J<=800
        d_J_final=800;
    elseif d_J>800 & d_J<=850
        d_J_final=850;
    else
        d_J_final=round(d_J);
    end

    %Comprobar que el diámetro normalizado coincide con el diámetro interior 
    %del engranaje de entrada
    if m(i_ejes+1)==2 & Conductoras(i_ejes+1)>=12 & Conductoras(i_ejes+1)<=20 & d_J_final<=10
        d_J1_final=10;
    elseif m(i_ejes+1)==2 & Conductoras(i_ejes+1)>=21 & Conductoras(i_ejes+1)<=28 & d_J_final<=12
        d_J1_final=12;
    elseif m(i_ejes+1)==2 & Conductoras(i_ejes+1)>=29 & Conductoras(i_ejes+1)<=40 & d_J_final<=14
        d_J1_final=14;
    elseif m(i_ejes+1)==2 & Conductoras(i_ejes+1)>=41 & Conductoras(i_ejes+1)<=74 & d_J_final<=16
        d_J1_final=16;
    elseif m(i_ejes+1)==2 & Conductoras(i_ejes+1)>=75 & Conductoras(i_ejes+1)<=120 & d_J_final<=20
        d_J1_final=20;
    elseif m(i_ejes+1)==3 & Conductoras(i_ejes+1)>=12 & Conductoras(i_ejes+1)<=15 & d_J_final<=12
        d_J1_final=12;
    elseif m(i_ejes+1)==3 & Conductoras(i_ejes+1)>=16 & Conductoras(i_ejes+1)<=20 & d_J_final<=14
        d_J1_final=14;
    elseif m(i_ejes+1)==3 & Conductoras(i_ejes+1)>=21 & Conductoras(i_ejes+1)<=35 & d_J_final<=16
        d_J1_final=16;
    elseif m(i_ejes+1)==3 & Conductoras(i_ejes+1)>=36 & Conductoras(i_ejes+1)<=69 & d_J_final<=20
        d_J1_final=20;
    elseif m(i_ejes+1)==3 & Conductoras(i_ejes+1)>=70 & Conductoras(i_ejes+1)<=110 & d_J_final<=25
        d_J1_final=25;
    elseif m(i_ejes+1)==3 & Conductoras(i_ejes+1)>=114 & Conductoras(i_ejes+1)<=120 & d_J_final<=30
        d_J1_final=30;
    elseif m(i_ejes+1)==4 & Conductoras(i_ejes+1)>=12 & Conductoras(i_ejes+1)<=15 & d_J_final<=14
        d_J1_final=14;
    elseif m(i_ejes+1)==4 & Conductoras(i_ejes+1)>=16 & Conductoras(i_ejes+1)<=22 & d_J_final<=16
        d_J1_final=16;
    elseif m(i_ejes+1)==4 & Conductoras(i_ejes+1)>=23 & Conductoras(i_ejes+1)<=35 & d_J_final<=20
        d_J1_final=20;
    elseif m(i_ejes+1)==4 & Conductoras(i_ejes+1)>=36 & Conductoras(i_ejes+1)<=75 & d_J_final<=25
        d_J1_final=25;
    elseif m(i_ejes+1)==4 & Conductoras(i_ejes+1)>=76 & Conductoras(i_ejes+1)<=110 & d_J_final<=30
        d_J1_final=30;
    elseif m(i_ejes+1)==5 & Conductoras(i_ejes+1)>=12 & Conductoras(i_ejes+1)<=27 & d_J_final<=20
        d_J1_final=20;
    elseif m(i_ejes+1)==5 & Conductoras(i_ejes+1)>=28 & Conductoras(i_ejes+1)<=49 & d_J_final<=25
        d_J1_final=25;
    elseif m(i_ejes+1)==5 & Conductoras(i_ejes+1)>=50 & Conductoras(i_ejes+1)<=110 & d_J_final<=30
        d_J1_final=30;
    elseif m(i_ejes+1)==6 & Conductoras(i_ejes+1)>=12 & Conductoras(i_ejes+1)<=23 & d_J_final<=20
        d_J1_final=20;
    elseif m(i_ejes+1)==6 & Conductoras(i_ejes+1)>=24 & Conductoras(i_ejes+1)<=40 & d_J_final<=25
        d_J1_final=25;
    else
        message10=sprintf('El diámetro requerido para el eje intermedio es mayor que el diámetro interior del engranaje de salida (etapa %d) que ha sido seleccionado.',i_ejes+1);
        f51=msgbox({message10;' ';...
            'Pruebe a modificar alguno de los siguientes datos introducidos:';...
            '1. Seleccionar otro material para los ejes.';...
            '2. Disminuir la dimensión Y de la caja.';...
            '3. Disminuir la potencia a transmitir.';...
            '4. Aumentar la velocidad de entrada o salida (la más pequeña).'},'Error','error');
        d_J1_final=d_J_final;
    end

    %PUNTO D (final eje)
    %Cortante
    T_D=sqrt((Txy_D^2)+(Txz_D^2));
    tau_alt_D=(4/3)*((4*T_D)/pi);

    %Cálculo de las tensiones equivalentes
    sigma_eq_alt_D=sqrt(3)*tau_alt_D;

    %Resistencia a la fatiga
    Se_D=Se_C;

    %Diámetro inicial punto D
    d_D_prima=sqrt((2*sigma_eq_alt_D)/Se_D);

    %Recalcular para el nuevo diámetro
    if d_D_prima<8
        Ctam_D=1;
    else
        Ctam_D=1.189*d_D_prima^(-0.097);
    end
    Se_D_nuevo=Ccarga*Ctam_D*Csup*Ctemp*Cfiab*Se_prima;
    d_D=sqrt((2*sigma_eq_alt_D)/Se_D_nuevo);

    %Elegir el diámetro normalizado que más se ajuste a los cálculos
    if d_D<=4
        d_D_final=4;
    elseif d_D>4 & d_D<=5
        d_D_final=5;
    elseif d_D>5 & d_D<=6
        d_D_final=6;
    elseif d_D>6 & d_D<=8
        d_D_final=8;
    elseif d_D>8 & d_D<=10
        d_D_final=10;
    elseif d_D>10 & d_D<=12
        d_D_final=12;
    elseif d_D>12 & d_D<=15
        d_D_final=15;
    elseif d_D>15 & d_D<=20
        d_D_final=20;
    elseif d_D>20 & d_D<=25
        d_D_final=25;
    elseif d_D>25 & d_D<=30
        d_D_final=30;
    elseif d_D>30 & d_D<=35
        d_D_final=35;
    elseif d_D>35 & d_D<=40
        d_D_final=40;
    elseif d_D>40 & d_D<=45
        d_D_final=45;
    elseif d_D>45 & d_D<=50
        d_D_final=50;
    elseif d_D>50 & d_D<=55
        d_D_final=55;
    elseif d_D>55 & d_D<=60
        d_D_final=60;
    elseif d_D>60 & d_D<=70
        d_D_final=70;
    elseif d_D>70 & d_D<=80
        d_D_final=80;
    elseif d_D>80 & d_D<=90
        d_D_final=90;
    elseif d_D>90 & d_D<=100
        d_D_final=100;
    elseif d_D>100 & d_D<=110
        d_D_final=110;
    elseif d_D>110 & d_D<=120
        d_D_final=120;
    elseif d_D>120 & d_D<=140
        d_D_final=140;
    elseif d_D>140 & d_D<=160
        d_D_final=160;
    elseif d_D>160 & d_D<=180
        d_D_final=180;
    elseif d_D>180 & d_D<=200
        d_D_final=200;
    elseif d_D>200 & d_D<=240
        d_D_final=240;
    elseif d_D>240 & d_D<=260
        d_D_final=260;
    elseif d_D>260 & d_D<=280
        d_D_final=280;
    elseif d_D>280 & d_D<=300
        d_D_final=300;
    elseif d_D>300 & d_D<=320
        d_D_final=320;
    elseif d_D>320 & d_D<=340
        d_D_final=340;
    elseif d_D>340 & d_D<=360
        d_D_final=360;
    elseif d_D>360 & d_D<=380
        d_D_final=380;
    elseif d_D>380 & d_D<=400
        d_D_final=400;
    elseif d_D>400 & d_D<=420
        d_D_final=420;
    elseif d_D>420 & d_D<=440
        d_D_final=440;
    elseif d_D>440 & d_D<=460
        d_D_final=460;
    elseif d_D>460 & d_D<=480
        d_D_final=480;
    elseif d_D>480 & d_D<=500
        d_D_final=500;
    elseif d_D>500 & d_D<=530
        d_D_final=530;
    elseif d_D>530 & d_D<=560
        d_D_final=560;
    elseif d_D>560 & d_D<=600
        d_D_final=600;
    elseif d_D>600 & d_D<=630
        d_D_final=630;
    elseif d_D>630 & d_D<=670
        d_D_final=670;
    elseif d_D>670 & d_D<=710
        d_D_final=710;
    elseif d_D>710 & d_D<=750
        d_D_final=750;
    elseif d_D>750 & d_D<=800
        d_D_final=800;
    elseif d_D>800 & d_D<=850
        d_D_final=850;
    else
        d_D_final=round(d_D);
    end
end

