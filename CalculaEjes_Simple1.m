function [d_A_final,d_E1_final,d_B_final] = CalculaEjes_Simple1(Y_simple,Fr,Ft,T,m,Sut,d,Asup,bsup,Conductoras)
    %Cálculo de esfuerzos
    %Plano xy
    Rby=(Fr*(Y_simple/2))/(Y_simple);                                       %Momentos con respecto al punto A
    Ray=Fr-Rby;                                                             %Fuerzas en y
    %Plano xz
    Rbz=(Ft*(Y_simple/2))/(Y_simple);                                       %Momentos con respecto al punto A
    Raz=Ft-Rbz;                                                             %Fuerzas en z

    %Cortantes
    %Plano xy
    Txy=Rby;
    %Plano xz
    Txz=Rbz;

    %Momento flector
    %Plano xy
    Mfxy=Txy*(Y_simple/2);
    %Plano xz
    Mfxz=Txz*(Y_simple/2);

    %Momento flector resultante en engranaje
    Me=sqrt((Mfxy^2)+(Mfxz^2));

    %Concentradores de tensiones
    KfF=2;
    KfT=3;

    %PUNTO A (entrada eje)
    %Momento torsor
    tau_Mt_A=(16*T*1000)/pi;
    tau_med_A=KfT*tau_Mt_A;
    %Cortante
    T_A=sqrt((Txy^2)+(Txz^2));
    tau_alt_A=(4/3)*((4*T_A)/pi);

    %Cálculo de las tensiones equivalentes
    sigma_eq_alt_A=sqrt(3)*tau_alt_A;
    sigma_eq_med_A=sqrt(3)*tau_med_A;

    %Aplicando criterio Goodman y suponiendo n=2, podemos calcular el diámetro
    %del árbol
    n=2;
    Se_prima=0.5*Sut;
    Ccarga=1;                                                               %Porque está sometido a flexión
    Ctam=1.189*d^(-0.097);
    Csup=Asup*Sut^(bsup);
    Ctemp=1;                                                                %T<450º
    Cfiab=0.814;                                                            %Fiabilidad 99%
    %Resistencia a la fatiga
    Se_A=Ccarga*Ctam*Csup*Ctemp*Cfiab*Se_prima;

    %Diámetro inicial punto A
    t1_A_prima=(((Se_A*sigma_eq_med_A)/(0.5*Se_A*Sut))+sqrt((((Se_A*sigma_eq_med_A)/(0.5*Se_A*Sut))^2)-4*(((Sut*sigma_eq_alt_A)^3)/(27*((0.5*Se_A*Sut)^3)))))/2;
    t2_A_prima=(((Se_A*sigma_eq_med_A)/(0.5*Se_A*Sut))-sqrt((((Se_A*sigma_eq_med_A)/(0.5*Se_A*Sut))^2)-4*(((Sut*sigma_eq_alt_A)^3)/(27*((0.5*Se_A*Sut)^3)))))/2;
    d_A_prima=nthroot(t1_A_prima,3)+nthroot(t2_A_prima,3);

    %Recalcular para el nuevo diámetro
    if d_A_prima<8
        Ctam_A=1;
    else
        Ctam_A=1.189*d_A_prima^(-0.097);
    end
    Se_A_nuevo=Ccarga*Ctam_A*Csup*Ctemp*Cfiab*Se_prima;
    t1_A=(((Se_A_nuevo*sigma_eq_med_A)/(0.5*Se_A_nuevo*Sut))+sqrt((((Se_A_nuevo*sigma_eq_med_A)/(0.5*Se_A_nuevo*Sut))^2)-4*(((Sut*sigma_eq_alt_A)^3)/(27*((0.5*Se_A_nuevo*Sut)^3)))))/2;
    t2_A=(((Se_A_nuevo*sigma_eq_med_A)/(0.5*Se_A_nuevo*Sut))-sqrt((((Se_A_nuevo*sigma_eq_med_A)/(0.5*Se_A_nuevo*Sut))^2)-4*(((Sut*sigma_eq_alt_A)^3)/(27*((0.5*Se_A_nuevo*Sut)^3)))))/2;
    d_A=nthroot(t1_A,3)+nthroot(t2_A,3);

    %Elegir el diámetro normalizado que más se ajuste a los cálculos
    if d_A<=4
        d_A_final=4;
    elseif d_A>4 & d_A<=5
        d_A_final=5;
    elseif d_A>5 & d_A<=6
        d_A_final=6;
    elseif d_A>6 & d_A<=8
        d_A_final=8;
    elseif d_A>8 & d_A<=10
        d_A_final=10;
    elseif d_A>10 & d_A<=12
        d_A_final=12;
    elseif d_A>12 & d_A<=15
        d_A_final=15;
    elseif d_A>15 & d_A<=20
        d_A_final=20;
    elseif d_A>20 & d_A<=25
        d_A_final=25;
    elseif d_A>25 & d_A<=30
        d_A_final=30;
    elseif d_A>30 & d_A<=35
        d_A_final=35;
    elseif d_A>35 & d_A<=40
        d_A_final=40;
    elseif d_A>40 & d_A<=45
        d_A_final=45;
    elseif d_A>45 & d_A<=50
        d_A_final=50;
    elseif d_A>50 & d_A<=55
        d_A_final=55;
    elseif d_A>55 & d_A<=60
        d_A_final=60;
    elseif d_A>60 & d_A<=70
        d_A_final=70;
    elseif d_A>70 & d_A<=80
        d_A_final=80;
    elseif d_A>80 & d_A<=90
        d_A_final=90;
    elseif d_A>90 & d_A<=100
        d_A_final=100;
    elseif d_A>100 & d_A<=110
        d_A_final=110;
    elseif d_A>110 & d_A<=120
        d_A_final=120;
    elseif d_A>120 & d_A<=140
        d_A_final=140;
    elseif d_A>140 & d_A<=160
        d_A_final=160;
    elseif d_A>160 & d_A<=180
        d_A_final=180;
    elseif d_A>180 & d_A<=200
        d_A_final=200;
    elseif d_A>200 & d_A<=240
        d_A_final=240;
    elseif d_A>240 & d_A<=260
        d_A_final=260;
    elseif d_A>260 & d_A<=280
        d_A_final=280;
    elseif d_A>280 & d_A<=300
        d_A_final=300;
    elseif d_A>300 & d_A<=320
        d_A_final=320;
    elseif d_A>320 & d_A<=340
        d_A_final=340;
    elseif d_A>340 & d_A<=360
        d_A_final=360;
    elseif d_A>360 & d_A<=380
        d_A_final=380;
    elseif d_A>380 & d_A<=400
        d_A_final=400;
    elseif d_A>400 & d_A<=420
        d_A_final=420;
    elseif d_A>420 & d_A<=440
        d_A_final=440;
    elseif d_A>440 & d_A<=460
        d_A_final=460;
    elseif d_A>460 & d_A<=480
        d_A_final=480;
    elseif d_A>480 & d_A<=500
        d_A_final=500;
    elseif d_A>500 & d_A<=530
        d_A_final=530;
    elseif d_A>530 & d_A<=560
        d_A_final=560;
    elseif d_A>560 & d_A<=600
        d_A_final=600;
    elseif d_A>600 & d_A<=630
        d_A_final=630;
    elseif d_A>630 & d_A<=670
        d_A_final=670;
    elseif d_A>670 & d_A<=710
        d_A_final=710;
    elseif d_A>710 & d_A<=750
        d_A_final=750;
    elseif d_A>750 & d_A<=800
        d_A_final=800;
    elseif d_A>800 & d_A<=850
        d_A_final=850;
    else
        d_A_final=round(d_A);
    end

    %PUNTO E (punto medio eje)
    %Momento flector
    sigma_Mf_E=(32*Me)/pi;
    sigma_alt_E=KfF*sigma_Mf_E;
    %Momento torsor
    tau_Mt_E=(16*T*1000)/pi;
    tau_med_E=KfT*tau_Mt_E;

    %Cálculo de las tensiones equivalentes
    sigma_eq_alt_E=sigma_alt_E;
    sigma_eq_med_E=sqrt(3)*tau_med_E;

    %Resistencia a la fatiga
    Se_E=Se_A;

    %Diámetro inicial punto E
    d_E_prima=nthroot((2*(Sut*sigma_eq_alt_E+Se_E*sigma_eq_med_E))/(Se_E*Sut),3);

    %Recalcular para el nuevo diámetro
    if d_E_prima<8
        Ctam_E=1;
    else
        Ctam_E=1.189*(d_E_prima^(-0.097));
    end
    Se_E_nuevo=Ccarga*Ctam_E*Csup*Ctemp*Cfiab*Se_prima;
    d_E=nthroot((2*(Sut*sigma_eq_alt_E+Se_E_nuevo*sigma_eq_med_E))/(Se_E_nuevo*Sut),3);

    %Elegir el diámetro normalizado que más se ajuste a los cálculos
    if d_E<=4
        d_E_final=4;
    elseif d_E>4 & d_E<=5
        d_E_final=5;
    elseif d_E>5 & d_E<=6
        d_E_final=6;
    elseif d_E>6 & d_E<=8
        d_E_final=8;
    elseif d_E>8 & d_E<=10
        d_E_final=10;
    elseif d_E>10 & d_E<=12
        d_E_final=12;
    elseif d_E>12 & d_E<=14
        d_E_final=14;
    elseif d_E>14 & d_E<=15
        d_E_final=15;
    elseif d_E>15 & d_E<=20
        d_E_final=20;
    elseif d_E>20 & d_E<=25
        d_E_final=25;
    elseif d_E>25 & d_E<=30
        d_E_final=30;
    elseif d_E>30 & d_E<=32
        d_E_final=32;
    elseif d_E>32 & d_E<=35
        d_E_final=35;
    elseif d_E>35 & d_E<=40
        d_E_final=40;
    elseif d_E>40 & d_E<=45
        d_E_final=45;
    elseif d_E>45 & d_E<=50
        d_E_final=50;
    elseif d_E>50 & d_E<=55
        d_E_final=55;
    elseif d_E>55 & d_E<=60
        d_E_final=60;
    elseif d_E>60 & d_E<=70
        d_E_final=70;
    elseif d_E>70 & d_E<=80
        d_E_final=80;
    elseif d_E>80 & d_E<=90
        d_E_final=90;
    elseif d_E>90 & d_E<=100
        d_E_final=100;
    elseif d_E>100 & d_E<=110
        d_E_final=110;
    elseif d_E>110 & d_E<=120
        d_E_final=120;
    elseif d_E>120 & d_E<=140
        d_E_final=140;
    elseif d_E>140 & d_E<=160
        d_E_final=160;
    elseif d_E>160 & d_E<=180
        d_E_final=180;
    elseif d_E>180 & d_E<=200
        d_E_final=200;
    elseif d_E>200 & d_E<=240
        d_E_final=240;
    elseif d_E>240 & d_E<=260
        d_E_final=260;
    elseif d_E>260 & d_E<=280
        d_E_final=280;
    elseif d_E>280 & d_E<=300
        d_E_final=300;
    elseif d_E>300 & d_E<=320
        d_E_final=320;
    elseif d_E>320 & d_E<=340
        d_E_final=340;
    elseif d_E>340 & d_E<=360
        d_E_final=360;
    elseif d_E>360 & d_E<=380
        d_E_final=380;
    elseif d_E>380 & d_E<=400
        d_E_final=400;
    elseif d_E>400 & d_E<=420
        d_E_final=420;
    elseif d_E>420 & d_E<=440
        d_E_final=440;
    elseif d_E>440 & d_E<=460
        d_E_final=460;
    elseif d_E>460 & d_E<=480
        d_E_final=480;
    elseif d_E>480 & d_E<=500
        d_E_final=500;
    elseif d_E>500 & d_E<=530
        d_E_final=530;
    elseif d_E>530 & d_E<=560
        d_E_final=560;
    elseif d_E>560 & d_E<=600
        d_E_final=600;
    elseif d_E>600 & d_E<=630
        d_E_final=630;
    elseif d_E>630 & d_E<=670
        d_E_final=670;
    elseif d_E>670 & d_E<=710
        d_E_final=710;
    elseif d_E>710 & d_E<=750
        d_E_final=750;
    elseif d_E>750 & d_E<=800
        d_E_final=800;
    elseif d_E>800 & d_E<=850
        d_E_final=850;
    else
        d_E_final=round(d_E);
    end

    %Comprobar que el diámetro normalizado coincide con el diámetro interior 
    %del engranaje de entrada
    if m==2 & Conductoras>=12 & Conductoras<=20 & d_E_final<=10
        d_E1_final=10;
    elseif m==2 & Conductoras>=21 & Conductoras<=28 & d_E_final<=12
        d_E1_final=12;
    elseif m==2 & Conductoras>=29 & Conductoras<=40 & d_E_final<=14
        d_E1_final=14;
    elseif m==2 & Conductoras>=41 & Conductoras<=74 & d_E_final<=16
        d_E1_final=16;
    elseif m==2 & Conductoras>=75 & Conductoras<=120 & d_E_final<=20
        d_E1_final=20;
    elseif m==3 & Conductoras>=12 & Conductoras<=15 & d_E_final<=12
        d_E1_final=12;
    elseif m==3 & Conductoras>=16 & Conductoras<=20 & d_E_final<=14
        d_E1_final=14;
    elseif m==3 & Conductoras>=21 & Conductoras<=35 & d_E_final<=16
        d_E1_final=16;
    elseif m==3 & Conductoras>=36 & Conductoras<=69 & d_E_final<=20
        d_E1_final=20;
    elseif m==3 & Conductoras>=70 & Conductoras<=110 & d_E_final<=25
        d_E1_final=25;
    elseif m==3 & Conductoras>=114 & Conductoras<=120 & d_E_final<=30
        d_E1_final=30;
    elseif m==4 & Conductoras>=12 & Conductoras<=15 & d_E_final<=14
        d_E1_final=14;
    elseif m==4 & Conductoras>=16 & Conductoras<=22 & d_E_final<=16
        d_E1_final=16;
    elseif m==4 & Conductoras>=23 & Conductoras<=35 & d_E_final<=20
        d_E1_final=20;
    elseif m==4 & Conductoras>=36 & Conductoras<=75 & d_E_final<=25
        d_E1_final=25;
    elseif m==4 & Conductoras>=76 & Conductoras<=110 & d_E_final<=30
        d_E1_final=30;
    elseif m==5 & Conductoras>=12 & Conductoras<=27 & d_E_final<=20
        d_E1_final=20;
    elseif m==5 & Conductoras>=28 & Conductoras<=49 & d_E_final<=25
        d_E1_final=25;
    elseif m==5 & Conductoras>=50 & Conductoras<=110 & d_E_final<=30
        d_E1_final=30;
    elseif m==6 & Conductoras>=12 & Conductoras<=23 & d_E_final<=20
        d_E1_final=20;
    elseif m==6 & Conductoras>=24 & Conductoras<=40 & d_E_final<=25
        d_E1_final=25;
    else
        f48=msgbox({'El diámetro requerido para el eje de entrada es mayor que el diámetro interior del engranaje de entrada normalizado que ha sido seleccionado.';' ';...
            'Pruebe a modificar alguno de los siguientes datos introducidos:';...
            '1. Seleccionar otro material para los ejes.';...
            '2. Disminuir la dimensión Y de la caja.';...
            '3. Disminuir la potencia a transmitir.';...
            '4. Aumentar la velocidad de entrada.'},'Error','error');
        d_E1_final=d_E_final;
    end

    %PUNTO B (final eje)
    %Cortante
    T_B=sqrt((Txy^2)+(Txz^2));
    tau_alt_B=(4/3)*((4*T_B)/pi);

    %Cálculo de las tensiones equivalentes
    sigma_eq_alt_B=sqrt(3)*tau_alt_B;

    %Resistencia a la fatiga
    Se_B=Se_A;

    %Diámetro inical punto B
    d_B_prima=sqrt((2*sigma_eq_alt_B)/Se_B);

    %Recalcular para el nuevo diámetro
    if d_B_prima<8
        Ctam_B=1;
    else
        Ctam_B=1.189*d_B_prima^(-0.097);
    end
    Se_B_nuevo=Ccarga*Ctam_B*Csup*Ctemp*Cfiab*Se_prima;
    d_B=sqrt((2*sigma_eq_alt_B)/Se_B_nuevo);

    %Elegir el diámetro normalizado que más se ajuste a los cálculos
    if d_B<=4
        d_B_final=4;
    elseif d_B>4 & d_B<=5
        d_B_final=5;
    elseif d_B>5 & d_B<=6
        d_B_final=6;
    elseif d_B>6 & d_B<=8
        d_B_final=8;
    elseif d_B>8 & d_B<=10
        d_B_final=10;
    elseif d_B>10 & d_B<=12
        d_B_final=12;
    elseif d_B>12 & d_B<=15
        d_B_final=15;
    elseif d_B>15 & d_B<=20
        d_B_final=20;
    elseif d_B>20 & d_B<=25
        d_B_final=25;
    elseif d_B>25 & d_B<=30
        d_B_final=30;
    elseif d_B>30 & d_B<=35
        d_B_final=35;
    elseif d_B>35 & d_B<=40
        d_B_final=40;
    elseif d_B>40 & d_B<=45
        d_B_final=45;
    elseif d_B>45 & d_B<=50
        d_B_final=50;
    elseif d_B>50 & d_B<=55
        d_B_final=55;
    elseif d_B>55 & d_B<=60
        d_B_final=60;
    elseif d_B>60 & d_B<=70
        d_B_final=70;
    elseif d_B>70 & d_B<=80
        d_B_final=80;
    elseif d_B>80 & d_B<=90
        d_B_final=90;
    elseif d_B>90 & d_B<=100
        d_B_final=100;
    elseif d_B>100 & d_B<=110
        d_B_final=110;
    elseif d_B>110 & d_B<=120
        d_B_final=120;
    elseif d_B>120 & d_B<=140
        d_B_final=140;
    elseif d_B>140 & d_B<=160
        d_B_final=160;
    elseif d_B>160 & d_B<=180
        d_B_final=180;
    elseif d_B>180 & d_B<=200
        d_B_final=200;
    elseif d_B>200 & d_B<=240
        d_B_final=240;
    elseif d_B>240 & d_B<=260
        d_B_final=260;
    elseif d_B>260 & d_B<=280
        d_B_final=280;
    elseif d_B>280 & d_B<=300
        d_B_final=300;
    elseif d_B>300 & d_B<=320
        d_B_final=320;
    elseif d_B>320 & d_B<=340
        d_B_final=340;
    elseif d_B>340 & d_B<=360
        d_B_final=360;
    elseif d_B>360 & d_B<=380
        d_B_final=380;
    elseif d_B>380 & d_B<=400
        d_B_final=400;
    elseif d_B>400 & d_B<=420
        d_B_final=420;
    elseif d_B>420 & d_B<=440
        d_B_final=440;
    elseif d_B>440 & d_B<=460
        d_B_final=460;
    elseif d_B>460 & d_B<=480
        d_B_final=480;
    elseif d_B>480 & d_B<=500
        d_B_final=500;
    elseif d_B>500 & d_B<=530
        d_B_final=530;
    elseif d_B>530 & d_B<=560
        d_B_final=560;
    elseif d_B>560 & d_B<=600
        d_B_final=600;
    elseif d_B>600 & d_B<=630
        d_B_final=630;
    elseif d_B>630 & d_B<=670
        d_B_final=670;
    elseif d_B>670 & d_B<=710
        d_B_final=710;
    elseif d_B>710 & d_B<=750
        d_B_final=750;
    elseif d_B>750 & d_B<=800
        d_B_final=800;
    elseif d_B>800 & d_B<=850
        d_B_final=850;
    else
        d_B_final=round(d_B);
    end
end

