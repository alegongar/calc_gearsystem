clear;
clc;
%ESPECIFICACIONES DEL DISEÑO
%Datos mínimos especificaciones técnicas
f=msgbox({'En la siguiente ventana debe rellenar como mínimo:';' ';...
    '1. La potencia a transmitir.';' ';...
    '2. La relación de transmisión y una de las velocidades, o las dos velocidades requeridas.';' ';...
    '3. La dimensión de la caja (X) perpendicular a los ejes o la distancia entre ejes.';' ';...
    '4. La dimensión mínima de la caja (Y) en la dirección de los ejes.';' ';...
    '5. El sentido de giro de los ejes de entrada y salida.'},'Datos mínimos diseño');
uiwait(f);
%Especificaciones técnicas del diseño
prompt1 = {'Potencia a transmitir (kW):','Relación de transmisión:',...
    'Velocidad de entrada (rpm):','Velocidad de salida (rpm):',...
    'Sentido de giro de los ejes de entrada y salida [Mismo sentido=0;Sentido contrario=1]:'...
    'Dimensión de la caja (X) perpendicular a los ejes (mm):'...
    'Dimensión de la caja (Y) en la dirección de los ejes  (mm):',...
    'Altura máxima (Z) de la caja (mm):','Distancia entre ejes (mm):'};
title1 = 'Especificaciones del diseño';
dims1 = [1 60];
%definput1 = {'0.1','','2295','300','0','300','500','300',''};               %Datos ejemplo caja reductora 2
%definput1 = {'0.1','','2295','32','1','300','500','300',''};                %Datos prueba tren
definput1 = {'1','0.6','1000','','1','','150','','100'};                    %Datos ejemplo caja reductora 1
%definput1 = {'1','','1000','600','1','300','150','300',''};                 %Datos prueba transmisión simple
answer1 = inputdlg(prompt1,title1,dims1,definput1);

datos=1;
while datos==1
    if isempty(answer1)==1
        f0=msgbox('Debe rellenar los datos mínimos de diseño.','Error','error');
        break;
    else
        H=str2num(answer1{1});
        k=str2num(answer1{2});
        w_e=str2num(answer1{3});
        w_s=str2num(answer1{4});
        giro=str2num(answer1{5});
        X=str2num(answer1{6});
        Y=str2num(answer1{7});
        Z=str2num(answer1{8});
        DC=str2num(answer1{9});
    end
    if isempty(answer1{1})==1 & isempty(answer1{2})==1 & isempty(answer1{3})==1 & isempty(answer1{4})==1 & isempty(answer1{5})==1 & isempty(answer1{6})==1 & isempty(answer1{7})==1 & isempty(answer1{8})==1
        f1=msgbox('Debe rellenar los datos mínimos de diseño.','Error','error');
        break;
    elseif isempty(answer1{1})==1
        f2=msgbox('Debe rellenar la potencia a transmitir.','Error','error');
        break;
    elseif (isempty(answer1{2})==1 & isempty(answer1{3})==1) | (isempty(answer1{2})==1 & isempty(answer1{4})==1) | (isempty(answer1{3})==1 & isempty(answer1{4})==1)
        f3=msgbox('Debe rellenar la relación de transmisión y una de las velocidades, o las dos velocidades requeridas.','Error','error');
        break;
    elseif isempty(answer1{5})==1
        f4=msgbox('Debe rellenar el sentido de giro de los ejes de entrada y salida.','Error','error');
        break;
    elseif (isempty(answer1{6})==1 & isempty(answer1{9})==1)
        f5=msgbox('Debe rellenar la dimensión de la caja (X) perpendicular a los ejes o la distancia entre ejes.','Error','error');
        break;
    elseif isempty(answer1{7})==1
        f6=msgbox('Debe rellenar la dimensión de la caja (Y) en la dirección de los ejes.','Error','error');
        break;
    elseif (isempty(answer1{2})~=1 & isempty(answer1{3})~=1 & isempty(answer1{4})~=1)
        f7=msgbox('Solo debe rellenar la relación de transmisión y una de las velocidades, o las dos velocidades.','Error','error');
        break;
    elseif (isempty(answer1{6})~=1 & isempty(answer1{9})~=1)
        f8=msgbox('Solo debe rellenar la dimensión de la caja (X) perpendicular a los ejes o la distancia entre ejes.','Error','error');
        break;
    elseif giro~=0 & giro~=1
        f9=msgbox('Debe rellenar el sentido de giro con un 0 ó 1.','Error','error');
        break;
    end
    
    if w_e & w_s
        k=w_s/w_e;
    elseif k & w_e
        w_s=k*w_e;
    elseif k & w_s
        w_e=w_s/k;
    end

    %Datos mínimos otras especificaciones de los engranajes
    g=msgbox({'Si ha elegido un material para los engranajes, debe introducir todos los datos de la siguiente ventana.';' ';...
        'En caso contrario, no rellene los tres últimos datos y seleccione un material de la lista siguiente.'},'Datos mínimos engranajes');
    uiwait(g);
    %Otras especificaciones de los engranajes
    prompt2 = {'Fuente de potencia [Uniforme=1; Impacto suave=2; Impacto medio=3]:'...
        'Máquina impulsada [Uniforme=1; Impacto moderado=2; Impacto fuerte=3]:'...
        'Condiciones del soporte [Montaje preciso=1; Montaje poco rígido y contacto en toda la cara=2; Montaje tal que contacto en menos de la cara completa=3]:'...
        'Tipo de engrane intermedio [Engrane normal=1; Engrane loco=0]:'...
        'Confiabilidad (%) [99.99; 99.9; 99; 90; 50]:','Resistencia a la fatiga por flexión (MPa):'...
        'Coeficiente elástico (MPa^0.5):','Resistencia a la fatiga superficial (MPa):'};
    title2 = 'Especificaciones de los engranajes';
    dims2 = [1 70];
    %definput2 = {'1','2','2','1','99','300','191','3000'};                  %Datos prueba tren
    definput2 = {'1','2','2','1','99','','',''};                            %Datos ejemplos
    answer2 = inputdlg(prompt2,title2,dims2,definput2);

    if isempty(answer2)==1
        f10=msgbox('Debe rellenar las especificaciones requeridas de los engranajes.','Error','error');
        break;
    else
        FP=str2num(answer2{1});
        MI=str2num(answer2{2});
        montaje=str2num(answer2{3});
        engrane=str2num(answer2{4});
        conf=str2num(answer2{5});
        Sflex1=str2num(answer2{6});
        coef1=str2num(answer2{7});
        Ssup1=str2num(answer2{8});
    end
    if isempty(answer2{1})==1 & isempty(answer2{2})==1 & isempty(answer2{3})==1 & isempty(answer2{4})==1 & isempty(answer2{5})==1
        f11=msgbox('Debe rellenar las especificaciones requeridas de los engranajes.','Error','error');
        break;
    elseif isempty(answer2{1})==1
        f12=msgbox('Debe rellenar la fuente de potencia.','Error','error');
        break;
    elseif isempty(answer2{2})==1
        f13=msgbox('Debe rellenar la máquina impulsada.','Error','error');
        break;
    elseif isempty(answer2{3})==1
        f14=msgbox('Debe rellenar las condiciones del soporte.','Error','error');
        break;
    elseif isempty(answer2{4})==1
        f15=msgbox('Debe rellenar el tipo de engranaje intermedio.','Error','error');
        break;
    elseif isempty(answer2{5})==1
        f16=msgbox('Debe rellenar la confiabilidad.','Error','error');
        break;
    elseif FP~=1 & FP~=2 & FP~=3
        f17=msgbox('Debe rellenar la fuente de potencia con un 1, 2 ó 3.','Error','error');
        break;
    elseif MI~=1 & MI~=2 & MI~=3
        f18=msgbox('Debe rellenar la máquina impulsada con un 1, 2 ó 3.','Error','error');
        break;
    elseif montaje~=1 & montaje~=2 & montaje~=3
        f19=msgbox('Debe rellenar las condiciones del soporte con un 1, 2 ó 3.','Error','error');
        break;
    elseif engrane~=0 & engrane~=1
        f20=msgbox('Debe rellenar el tipo de engranaje intermedio con un 0 ó 1.','Error','error');
        break;
    elseif conf~=99.99 & conf~=99.9 & conf~=99 & conf~=90 & conf~=50
        f21=msgbox('Debe rellenar la confiabilidad con 99.99; 99.9; 99; 90 ó 50.','Error','error');
        break;
    end
    
    %Lista de materiales para los engranajes
    list1 = {'Acero AISI 4140','Acero AISI 4340','Endurecido por llama o por inducción (Tipo A)',...
        'Endurecido por llama o por inducción (Tipo B)','Carburado y recubrimiento endurecido',...
        'Nitroaleación 135M','Nitroaleación N','Cromo al 2.5%'};
    [indx1,tf1] = listdlg('PromptString','Seleccione material para los engranajes:','SelectionMode','single','ListSize',[250,200],'ListString',list1);

    if indx1==1
        Sflex2=310;
        coef2=191;
        Ssup2=1250;
        mat_gear='Acero AISI 4140';
    elseif indx1==2
        Sflex2=325;
        coef2=191;
        Ssup2=1200;
        mat_gear='Acero AISI 4340';
    elseif indx1==3
        Sflex2=380;
        coef2=191;
        Ssup2=1300;
        mat_gear='Endurecido por llama o por inducción (Tipo A)';
    elseif indx1==4
        Sflex2=150;
        coef2=191;
        Ssup2=1300;
        mat_gear='Endurecido por llama o por inducción (Tipo B)';
    elseif indx1==5
        Sflex2=520;
        coef2=191;
        Ssup2=1300;
        mat_gear='Carburado y recubrimiento endurecido';
    elseif indx1==6
        Sflex2=330;
        coef2=191;
        Ssup2=1350;
        mat_gear='Nitroaleación 135M';
    elseif indx1==7
        Sflex2=345;
        coef2=191;
        Ssup2=1410;
        mat_gear='Nitroaleación N';
    elseif indx1==8
        Sflex2=450;
        coef2=191;
        Ssup2=1200;
        mat_gear='Cromo al 2.5%';
    elseif isempty(answer2{6})==1 & isempty(answer2{7})==1 & isempty(answer2{8})==1 & isempty(indx1)
        f22=msgbox('Debe seleccionar un material para los engranajes.','Error','error');
        break;
    else
        mat_gear=0;
    end

    %Datos mínimos otras especificaciones de los ejes
    h=msgbox({'Si ha elegido un material para los ejes, debe introducir todos los datos de la siguiente ventana.';' ';...
        'En caso contrario, no rellene los datos y seleccione un material de la lista siguiente.'},'Datos mínimos ejes');
    uiwait(h);
    %Otras especificaciones de los ejes
    prompt3 = {'Resistencia a la rotura(MPa):','Resistencia de fluencia(MPa):','Tipo de laminado [En frío=1; En caliente=2]:'};
    title3 = 'Especificaciones de los ejes';
    dims3 = [1 50];
    answer3 = inputdlg(prompt3,title3,dims3);

    if isempty(answer3)~=1
        Sut=str2num(answer3{1});
        Syt=str2num(answer3{2});
        laminado=str2num(answer3{3});
        if laminado==1
            d=50;
            Asup=4.51;
            bsup=-0.265;
        elseif laminado==0
            d=100;
            Asup=57.7;
            bsup=-0.718;
        end
    end
    if Sut~=0 & Syt~=0 & laminado~=1 & laminado~=2
        f23=msgbox('Debe rellenar el tipo de laminado con un 1 ó 2.','Error','error');
        break;
    end
    
    %Lista de materiales para los ejes
    list2 = {'Acero AISI 1020 laminado en frío','Acero AISI 1020 laminado en caliente'};
    [indx2,tf2] = listdlg('PromptString','Seleccione material para los ejes:','SelectionMode','single','ListSize',[250,150],'ListString',list2);

    if indx2==1
        Sut=420;
        Syt=350;
        d=50;
        Asup=4.51;
        bsup=-0.265;
        mat_eje='Acero AISI 1020 laminado en frío';
    elseif indx2==2
        Sut=448;
        Syt=296;
        d=100;
        Asup=57.7;
        bsup=-0.718;
        mat_eje='Acero AISI 1020 laminado en caliente';
    elseif isempty(answer3{1})==1 & isempty(answer3{2})==1 & isempty(answer3{3})==1 & isempty(indx2)
        f24=msgbox('Debe seleccionar un material para los ejes.','Error','error');
        break;
    else
        mat_eje=0;
    end
    
    %Datos mínimos otras especificaciones de las chavetas
    j=msgbox({'Si ha elegido un material para las chavetas, debe introducir la resistencia de fluencia en la siguiente ventana.';' ';...
        'En caso contrario, no rellene el dato y seleccione un material de la lista siguiente.'},'Datos mínimos chavetas');
    uiwait(j);
    %Otras especificaciones de las chavetas
    prompt4 = {'Resistencia de fluencia(MPa):'};
    title4 = 'Especificaciones de las chavetas';
    dims4 = [1 55];
    answer4 = inputdlg(prompt4,title4,dims4);

    if isempty(answer4)~=1
        Sy=str2num(answer4{1});
    end

    %Lista de materiales para chavetas
    list3 = {'Acero AISI 1015 estirado en frío','Acero sin tratar C45','Acero Inoxidable AISI 316Ti'};
    [indx3,tf3] = listdlg('PromptString','Seleccione material para las chavetas:','SelectionMode','single','ListSize',[250,150],'ListString',list3);

    if indx3==1
        Sy=325;
        mat_chaveta='Acero AISI 1015 estirado en frío';
    elseif indx3==2
        Sy=305;
        mat_chaveta='Acero sin tratar C45';
    elseif indx3==3
        Sy=305;
        mat_chaveta='Acero Inoxidable AISI 316Ti';
    elseif isempty(answer4{1})==1 & isempty(indx3)==1
        f25=msgbox('Debe seleccionar un material para las chavetas.','Error','error');
        break;
    else
        mat_chaveta=0;
    end
    
    %CÁLCULO Y DISEÑO DE ENGRANAJES
    %Número mínimo de pares de ruedas
    t=0.01;
    k_max=5;
    pares=ceil(abs(log10(k)/log10(k_max)));
    if pares>1 & isempty(DC)~=1
        f26=msgbox('Al ser un sistema con más de un par de ruedas, debe introducir la dimensión de la caja (X) perpendicular a los ejes (NO la distancia entre ejes).','Error','error');
        break;
    end
    if pares>1
        %Convertir la relación de transmisión decimal en una fracción
        [Num,Den]=rat(k);
        %Si no se pueden conseguir n factores mayores de 14 (nº mínimo de dientes), 
        %es necesario aumentar numerador y denominador en la misma proporción
        if (Num<(14^pares) | Den<(14^pares))
            if Num<(14^pares)
                proporcion=ceil((14^pares)/Num);
                Num_nuevo=14^pares;
                Den_nuevo=Den*proporcion;
                k_nuevo=Num_nuevo/Den_nuevo;
                if k_nuevo>=(k-t) & k_nuevo<=(k+t)
                    Num=Num_nuevo;
                    Den=Den_nuevo;
                    k=k_nuevo;
                else
                    message0=sprintf('Al aumentar proporcionalmente las velocidades de entrada y salida para conseguir %d factores mayores de 14 (nº mínimo de dientes), no se puede mantener aprox. la relación de transmisión establecida.',pares);
                    f27=msgbox(message0,'Error','error');
                    break;
                end
            elseif Den<(14^pares)
                proporcion=ceil((14^pares)/Den);
                Den_nuevo=14^pares;
                Num_nuevo=Num*proporcion;
                k_nuevo=Num_nuevo/Den_nuevo;
                if k_nuevo>=(k-t) & k_nuevo<=(k+t)
                    Num=Num_nuevo;
                    Den=Den_nuevo;
                    k=k_nuevo;
                else
                    message0=sprintf('Al aumentar proporcionalmente las velocidades de entrada y salida para conseguir %d factores mayores de 14 (nº mínimo de dientes), no se puede mantener aprox. la relación de transmisión establecida.',pares);
                    f28=msgbox(message0,'Error','error');
                    break;
                end
            end
        end
        %Comprobar que el valor del numerador y denominador no son números
        %primos, en caso contrario mostrar mensaje de error
        if isprime(Num)==1
            f29=msgbox('El valor introducido para la velocidad de salida es un número primo. Al tratarse de un tren de engranajes, no es posible obtener el nº de dientes para cada engranaje. Modifique el valor de dicha velocidad.','Error','error');
            break;
        elseif isprime(Den)==1
            f30=msgbox('El valor introducido para la velocidad de entrada es un número primo. Al tratarse de un tren de engranajes, no es posible obtener el nº de dientes para cada engranaje. Modifique el valor de dicha velocidad.','Error','error');
            break;
        end
        %Aproximación del número de dientes de ruedas conductoras y conducidas
        Z_conductoras=round(nthroot(Num,pares));
        Z_conducidas=round(nthroot(Den,pares));
        %Descomposición en factores primos de los términos que dan la relación 
        %de transmisión
        N=factor(Num);
        D=factor(Den);
        %Longitud de los vectores
        size_N=length(N);
        size_D=length(D);
        %Número de componentes del vector a combinar según número de pares:
        %Para el numerador
        comb_N=combinator(size_N-1,pares,'c','r');
        suma_N=sum(comb_N,2);
        busca_N=find(suma_N==size_N);
        comb_final_N=comb_N(busca_N,:);
        [fila_comb_N,colum_comb_N]=size(comb_final_N);
        %Para el denominador
        comb_D=combinator(size_D-1,pares,'c','r');
        suma_D=sum(comb_D,2);
        busca_D=find(suma_D==size_D);
        comb_final_D=comb_D(busca_D,:);
        [fila_comb_D,colum_comb_D]=size(comb_final_D);
        %Para el numerador:
        for m_comb_N=1:fila_comb_N
            for n_comb_N=1:colum_comb_N
                if n_comb_N==colum_comb_N
                    Z_N(m_comb_N,n_comb_N)=Num;
                else
                    N=factor(Num);
                    size_N=length(N);
                    %Posibles combinaciones de n elementos, siendo n la longitud del 
                    %vector N obtenido de la descomposición en factores primos 
                    %(matriz de números binarios)
                    num_dec_max_N=(2^size_N)-1;
                    mat_true_N=dec2bin(1:1:num_dec_max_N)-'0';
                    %Para cada fila de la matriz, contar los unos que existen y coger 
                    %las combinaciones que tengan tantos unos como números del vector a 
                    %combinar según comb_final
                    cont_N=0;
                    vec_true_N=[];
                    [fila_mat_N,colum_mat_N]=size(mat_true_N);
                    fila_vec_N=1;
                    for m_N=1:fila_mat_N
                        for n_N=1:colum_mat_N
                            if mat_true_N(m_N,n_N)==1
                                cont_N=cont_N+1;
                            end
                        end
                        if cont_N==comb_final_N(m_comb_N,n_comb_N)
                            vec_true_N(fila_vec_N,:)=mat_true_N(m_N,:);
                            fila_vec_N=fila_vec_N+1;
                        end
                        cont_N=0;
                    end
                    %De las combinaciones elegidas, obtener el valor que sale de 
                    %multiplicar el vector de binarios de dichas combinaciones por el 
                    %vector N de la descomposición en factores primos
                    res_N=1;
                    fila_N=1;
                    res_vec_N=[];
                    [fila_vec_N,colum_vec_N]=size(vec_true_N);
                    for i_N=1:fila_vec_N
                        for j_N=1:colum_vec_N
                            if vec_true_N(i_N,j_N)==1
                                res_N=res_N*N(j_N);
                            end
                        end
                        res_vec_N(fila_N,:)=res_N;
                        fila_N=fila_N+1;
                        res_N=1;
                    end
                    %Obtener la diferencia de cada valor obtenido respecto del número 
                    %óptimo de dientes según Z_conductoras y elegir el de menor diferencia
                    dif_vec_N=abs(Z_conductoras-res_vec_N);
                    minimo_N=min(dif_vec_N);
                    busca_minimo_N=find(dif_vec_N==minimo_N);
                    busca_minimo_N=busca_minimo_N(1);
                    Z_N(m_comb_N,n_comb_N)=res_vec_N(busca_minimo_N,:);
                    Num=Num/Z_N(m_comb_N,n_comb_N);
                end
            end
            Num=Num_nuevo;
        end
        %Para el denominador:
        for m_comb_D=1:fila_comb_D
            for n_comb_D=1:colum_comb_D
                if n_comb_D==colum_comb_D
                    Z_D(m_comb_D,n_comb_D)=Den;
                else
                    D=factor(Den);
                    size_D=length(D);
                    %Posibles combinaciones de n elementos, siendo n la longitud del 
                    %vector D obtenido de la descomposición en factores primos 
                    %(matriz de números binarios)
                    num_dec_max_D=(2^size_D)-1;
                    mat_true_D=dec2bin(1:1:num_dec_max_D)-'0';
                    %Para cada fila de la matriz, contar los unos que existen y coger 
                    %las combinaciones que tengan tantos unos como números del vector a 
                    %combinar según comb_final
                    cont_D=0;
                    vec_true_D=[];
                    [fila_mat_D,colum_mat_D]=size(mat_true_D);
                    fila_vec_D=1;
                    for m_D=1:fila_mat_D
                        for n_D=1:colum_mat_D
                            if mat_true_D(m_D,n_D)==1
                                cont_D=cont_D+1;
                            end
                        end
                        if cont_D==comb_final_D(m_comb_D,n_comb_D)
                            vec_true_D(fila_vec_D,:)=mat_true_D(m_D,:);
                            fila_vec_D=fila_vec_D+1;
                        end
                        cont_D=0;
                    end
                    %De las combinaciones elegidas,obtener el valor que sale de 
                    %multiplicar el vector de binarios de dichas combinaciones por el 
                    %vector D de la descomposición en factores primos
                    res_D=1;
                    fila_D=1;
                    res_vec_D=[];
                    [fila_vec_D,colum_vec_D]=size(vec_true_D);
                    for i_D=1:fila_vec_D
                        for j_D=1:colum_vec_D
                            if vec_true_D(i_D,j_D)==1
                                res_D=res_D*D(j_D);
                            end
                        end
                        res_vec_D(fila_D,:)=res_D;
                        fila_D=fila_D+1;
                        res_D=1;
                    end
                    %Obtener la diferencia de cada valor obtenido respecto del número 
                    %óptimo de dientes según Z_conducidas y elegir el de menor diferencia
                    dif_vec_D=abs(Z_conducidas-res_vec_D);
                    minimo_D=min(dif_vec_D);
                    busca_minimo_D=find(dif_vec_D==minimo_D);
                    busca_minimo_D=busca_minimo_D(1);
                    Z_D(m_comb_D,n_comb_D)=res_vec_D(busca_minimo_D,:);
                    Den=Den/Z_D(m_comb_D,n_comb_D);
                end
            end
            Den=Den_nuevo;
        end
        %Elegir el número de dientes de las ruedas conductoras
        dif_Z_N=abs(Z_conductoras-Z_N);
        suma_Z_N=sum(dif_Z_N,2);
        minimo_Z_N=min(suma_Z_N);
        busca_minimo_Z_N=find(suma_Z_N==minimo_Z_N);
        Conductoras=Z_N(busca_minimo_Z_N,:);
        %Elegir el número de dientes de las ruedas conducidas
        dif_Z_D=abs(Z_conducidas-Z_D);
        suma_Z_D=sum(dif_Z_D,2);
        minimo_Z_D=min(suma_Z_D);
        busca_minimo_Z_D=find(suma_Z_D==minimo_Z_D);
        Conducidas=Z_D(busca_minimo_Z_D,:);
    end
    %Decidir si los engranes serán exteriores o interiores, incluyendo el
    %signo en la relación de transmisión
    if giro==0                                                              %Si se desea que los ejes de entrada y salida giren en el mismo sentido
        if (mod(pares,2))==0                                                %Si el número de pares de dientes es par
            pares_EXT=pares;
            pares_INT=0;
            message1=sprintf('Se debe disponer de %d engrane/s exterior/es debido al sentido de giro introducido.',pares_EXT);
            f31=msgbox(message1,'Engranajes','warn');
        elseif (mod(pares,2))~=0 & pares>1                                  %Si el número de pares de dientes es impar
            pares_EXT=pares-1;
            pares_INT=1;
            message2=sprintf('Se debe disponer de %d engrane/s exterior/es y %d interior/es debido al sentido de giro introducido.',pares_EXT,pares_INT);
            f32=msgbox(message2,'Engranajes','warn');
        else
            f49=msgbox('Al ser un sistema con un único par de ruedas, debe rellenar el sentido de giro con un 1.','Error','error');
            break;
        end
    elseif giro==1                                                          %Si se desea que los ejes de entrada y salida giren en sentido contrario
        if (mod(pares,2))~=0
            pares_EXT=pares;
            pares_INT=0;
            message3=sprintf('Se debe disponer de %d engrane/s exterior/es debido al sentido de giro introducido.',pares_EXT);
            f33=msgbox(message3,'Engranajes','warn');
        elseif (mod(pares,2))==0
            pares_EXT=pares-1;
            pares_INT=1;
            message4=sprintf('Se debe disponer de %d engrane/s exterior/es y %d interior/es debido al sentido de giro introducido.',pares_EXT,pares_INT);
            f34=msgbox(message4,'Engranajes','warn');
        end
    end
    if pares_EXT>0
        for i_pares=1:pares_EXT
            engrane_EXT(i_pares)=1;
        end
    end
    if pares_INT>0
        for i_pares=pares_EXT+1:pares_EXT+pares_INT
            engrane_EXT(i_pares)=0;
        end
    end
    %Módulo
    m(1:pares)=2;
    
    condicion_1=false;
    condicion_2=false;
    while condicion_1==false
        if pares==1
            %Caso a ejecutar según especificaciones introducidas
            if H & k & w_e & w_s & X
                caso='C1';
            elseif H & k & w_e & w_s & DC
                caso='C2';
            else
                caso=0;
            end
            %Número de dientes de la pareja de ruedas
            switch (caso)
                case 'C1'
                    x=((2/3)*X)/25.4;
                    d2=(x/(k+1));
                    dp2=d2*25.4;
                    d1=d2*k;
                    dp1=d1*25.4;
                    if X>(dp1+dp2)
                        Conductoras=dp1/m;
                        Conducidas=dp2/m;
                    end
                case 'C2'
                    dc=DC/25.4;
                    d2=((dc*2)/(k+1));
                    dp2=d2*25.4;
                    d1=d2*k;
                    dp1=d1*25.4;
                    if (DC*(1-t))<((dp1+dp2)/2)<(DC*(1+t))
                        Conductoras=dp1/m;
                        Conducidas=dp2/m;
                    end
                otherwise
                    f35=msgbox('No se aportan datos suficientes para el diseño y cálculo de los elementos del sistema.','Error','error');
                    condicion_2=true;
                    break;
            end
        end
        %Velocidades angulares (rpm)
        ruedas=pares*2;
        w(1)=w_e;
        for i_w=2:2:ruedas
            w(i_w)=w(i_w-1)*(Conductoras(i_w/2)/Conducidas(i_w/2));
            if i_w~=ruedas
                w(i_w+1)=w(i_w);
            end
        end
        %Relaciones de transmisión parciales
        i_w=2;
        for i_k=1:pares
            k_parcial(i_k)=w(i_w)/w(i_w-1);
            i_w=i_w+2;
        end
        %Ángulo de presión
        phi(1:pares)=20*pi/180;
        %Comprobar que el ángulo no es tan pequeño como para producir
        %interferencia
        for i_inter=1:pares
            for i_inter=1:pares
                N_conducidas(i_inter)=((((Conductoras(i_inter))^2)*((sin(phi(i_inter)))^2)-4)/(4-2*(Conductoras(i_inter))*(sin(phi(i_inter)))^2));
                if Conducidas(i_inter)>N_conducidas(i_inter)
                    phi(i_inter)=phi(i_inter)+(pi/180);
                end
            end
        end
        %Para comprobar que el coeficiente de recubrimiento es mayor que la
        %unidad se necesitan los radios que se calculan dentro del siguiente
        %bucle porque puede variar si se modifica el módulo (línea 624)
        
        %%Análisis de fuerzas
        %Pares de torsión (Nm)
        W=H*1000;                                                           %Potencia en W
        for i_T=1:ruedas
            T(i_T)=(30*W)/(w(i_T)*pi);
        end
        %Diámetros y radios de paso
        size_conductoras=length(Conductoras);
        size_conducidas=length(Conducidas);
        i_paso_conductoras=1;
        for i_conductoras=1:size_conductoras
            dp(i_paso_conductoras)=Conductoras(i_conductoras)*m(i_conductoras);
            rp(i_paso_conductoras)=dp(i_paso_conductoras)/2;
            rb(i_paso_conductoras)=rp(i_paso_conductoras)*cos(phi(i_conductoras));
            rc(i_paso_conductoras)=m(i_conductoras)+rp(i_paso_conductoras);
            pb(i_paso_conductoras)=(2*pi*rb(i_paso_conductoras))/(Conductoras(i_conductoras));
            i_paso_conductoras=i_paso_conductoras+2;
        end
        i_paso_conducidas=2;
        for i_conducidas=1:size_conducidas
            dp(i_paso_conducidas)=Conducidas(i_conducidas)*m(i_conducidas);
            rp(i_paso_conducidas)=dp(i_paso_conducidas)/2;
            rb(i_paso_conducidas)=rp(i_paso_conducidas)*cos(phi(i_conducidas));
            rc(i_paso_conducidas)=m(i_conducidas)+rp(i_paso_conducidas);
            pb(i_paso_conducidas)=(2*pi*rb(i_paso_conducidas))/(Conducidas(i_conducidas));
            i_paso_conducidas=i_paso_conducidas+2;
        end
        %Comprobar que el coeficiente de recubrimiento es mayor que la unidad
        i_coef_cond=1;
        for i_coef=1:pares
            for i_coef=1:pares
                arco_cond(i_coef)=sqrt(((rc(i_coef_cond))^2)-((rb(i_coef_cond))^2))-(rb(i_coef_cond)*tan(phi(i_coef)))+sqrt(((rc(i_coef_cond+1))^2)-((rb(i_coef_cond+1))^2))-(rb(i_coef_cond+1)*tan(phi(i_coef)));
                recubrimiento(i_coef)=arco_cond(i_coef)/pb(i_coef_cond);
                if recubrimiento<1.1
                    phi(i_coef)=phi(i_coef)+(pi/180);
                end
                if i_coef<pares
                    i_coef_cond=i_coef_cond+2;
                end
            end
            i_coef_cond=1;
        end
        %Comprobar diámetros con dimensiones caja:
        %a.Comprobar que el diámetro mayor de cada par es menor que la
        %altura máxima Z de la caja
        i_Z=1;
        Z_nueva=[];
        if isempty(Z)~=1
            for j_dim=1:2:ruedas-1
                if w(j_dim)>w(j_dim+1)
                    if Z<=(dp(j_dim+1))
                        Z_nueva(i_Z)=ceil(1.3*(dp(j_dim+1)));
                    end
                elseif w(j_dim)<w(j_dim+1)
                    if Z<=(dp(j_dim))
                        Z_nueva(i_Z)=ceil(1.3*(dp(j_dim)));
                    end
                end
                i_Z=i_Z+1;
            end
        end
        %b.Comprobar que la dimensión X de la caja es mayor que los
        %diámetros de paso
        i_X=1;
        X_nueva=[];
        if isempty(X)~=1
            for i_dim=1:2:ruedas-1
                if engrane_EXT(i_X)==1
                    if X<=(dp(i_dim)+dp(i_dim+1))
                        X_nueva(i_X)=ceil(1.3*(dp(i_dim)+dp(i_dim+1)));
                    end
                elseif engrane_EXT(i_X)==0
                    if X<=(dp(i_dim))
                        X_nueva(i_X)=ceil(1.3*(dp(i_dim)));
                    elseif X<=(dp(i_dim+1))
                        X_nueva(i_X)=ceil(1.3*(dp(i_dim+1)));
                    end
                end
                i_X=i_X+1;
            end
        end
        %Redimensionar la caja
        Z_final=0;
        X_final=0;
        if isempty(Z_nueva)~=1
            Z_final=max(Z_nueva);
        end
        if isempty(X_nueva)~=1
            X_final=max(X_nueva);
        end
        if (Z_final>0 & X_final>0)
            message5=sprintf('Las dimensiones de la caja (X y Z) no son válidas para el sistema diseñado. Deben ser X>=%d y Z>=%d mm.',X_final,Z_final);
            f36=msgbox(message5,'Error','error');
            condicion_2=true;
            break;
        elseif (Z_final>0 & X_final==0)
            message6=sprintf('La dimensión Z de la caja no es válida para el sistema diseñado. Debe ser Z>=%d mm.',Z_final);
            f37=msgbox(message6,'Error','error');
            condicion_2=true;
            break;
        elseif (X_final>0 & Z_final==0)
            message7=sprintf('La dimensión X de la caja no es válida para el sistema diseñado. Debe ser X>=%d mm.',X_final);
            f38=msgbox(message7,'Error','error');
            condicion_2=true;
            break;
        end
        %Comprobar que la dimensión Y de la caja introducida está entre un
        %máximo y un mínimo
        Y_min=3/2*(40+80*(pares-1));
        Y_max=3/2*(240+400*(pares-1));
        if Y>Y_max | Y<Y_min
            message8=sprintf('Se recomienda que la dimensión Y de la caja esté dentro del rango %d<Y<%d mm.',Y_min,Y_max);
            f39=msgbox(message8,'Error','error');
            break;
        end
        %Fuerzas tangenciales (N)
        i_Ft=1;
        for i_T=2:2:ruedas
            Ft(i_Ft)=T(i_T)/(rp(i_T)/1000);
            i_Ft=i_Ft+1;
        end
        %Fuerzas radiales (N)
        size_Ft=length(Ft);
        for i_Fr=1:size_Ft
            Fr(i_Fr)=Ft(i_Fr)*tan(phi(i_Fr));
        end

        %%Análisis de tensiones:
        %Los dos análisis siguientes se hacen para uno de los dos engranajes de cada
        %pareja porque se ha supuesto que ambos tienen el mismo ancho de diente y 
        %mismo material.
        %1.Análisis de fractura del diente
        %Factor dinámico
        i_Kv=1;
        for i_v=1:2:ruedas-1
            v(i_v)=w(i_v)*((2*pi)/60)*(rp(i_v)/1000);
            Kv(i_Kv)=(3.56+sqrt(v(i_v)))/3.56;                              %Perfil generado con fresa madre o cepillo
            i_Kv=i_Kv+1;
        end
        %Factor de sobrecarga
        if FP==1 & MI==1
            Ko=1.00;
        elseif FP==1 & MI==2
            Ko=1.25;
        elseif FP==1 & MI==3
            Ko=1.75;
        elseif FP==2 & MI==1
            Ko=1.25;
        elseif FP==2 & MI==2
            Ko=1.50;
        elseif FP==2 & MI==3
            Ko=2.00;
        elseif FP==3 & MI==1
            Ko=1.50;
        elseif FP==3 & MI==2
            Ko=1.75;
        elseif FP==3 & MI==3
            Ko=2.25;
        end
        %Factor de corrección por tamaño
        Ks=1.00;                                                            %Para dientes muy largos 1.25-1.5
        %Factor de distribución de carga
        for i_m=1:pares
            b(i_m)=9*m(i_m);                                                %Suponiendo un ancho de cara (9m<b<14m) en mm
            if montaje==1 & (0<b(i_m)) & (b(i_m)<=50)
                Km(i_m)=1.3;
            elseif montaje==1 & (50<b(i_m)) & (b(i_m)<=200)
                Km(i_m)=1.4;
            elseif montaje==1 & (200<b(i_m)) & (b(i_m)<=350)
                Km(i_m)=1.5;
            elseif montaje==1 & (350<b(i_m)) & (b(i_m)<500)
                Km(i_m)=1.6;
            elseif montaje==1 & b(i_m)>=500
                Km(i_m)=1.8;
            elseif montaje==2 & (0<b(i_m)) & (b(i_m)<=50)
                Km(i_m)=1.6;
            elseif montaje==2 & (50<b(i_m)) & (b(i_m)<=200)
                Km(i_m)=1.7;
            elseif montaje==2 & (200<b(i_m)) & (b(i_m)<=350)
                Km(i_m)=1.8;
            elseif montaje==2 & (350<b(i_m)) & (b(i_m)<500)
                Km(i_m)=2.0;
            elseif montaje==2 & b(i_m)>=500
                Km(i_m)=2.2;
            elseif montaje==3
                Km(i_m)=2.2;
            end
        end
        %Factor geométrico de resistencia a la flexión
        J=Calcula_FactorJ(pares,Conducidas,Conductoras);
        %Factor de engrane intermedio
        if engrane==1
            Ki=1;
        elseif engrane==0
            Ki=1.42;
        end
        %Factor de espesor del aro
        Kb=1;                                                               %Macizo
        %Tensión en la raíz del diente (sin el ancho de cara)
        sigma_b=[];
        for i_sigma_b=1:pares
            sigma_b(i_sigma_b)=(Ft(i_sigma_b)*Ko*Kv(i_sigma_b)*Ks*Km(i_sigma_b)*Ki*Kb)/(m(i_sigma_b)*J(i_sigma_b));
        end
        %Criterio de fallo:
        %Factor de vida
        Kl=1;                                                               %Suponiendo nº de ciclos 10^7
        %Factor de temperatura
        Kt=1;                                                               %Para temperaturas hasta 250ºF (120ºC)
        %Factor de confiabilidad
        if conf==99.99
            Kr=1.50;
        elseif conf==99.9
            Kr=1.25;
        elseif conf==99
            Kr=1.00;
        elseif conf==90
            Kr=0.85;
        elseif conf==50
            Kr=0.70;
        end
        %Resistencia a la fatiga por flexión según material
        if Sflex1                                                           %Material introducido
            Sfb=Sflex1;
        elseif Sflex2
            Sfb=Sflex2;
        end
        %Tensión permisible
        sigma_perm_b=Kl/(Kt*Kr)*Sfb;
        %Ancho de cara
        for i_b=1:pares
            b(i_b)=round(sigma_b(i_b)/sigma_perm_b,2);                      %Redondeado a la segunda cifra decimal
            if b(i_b)<(9*m(i_b)) || b(i_b)>(14*m(i_b))                      %Establecer ancho de cara si no es 9m<b<14m
                b(i_b)=9*m(i_b);
                sigma_b(i_b)=sigma_b(i_b)/b(i_b);                           %Calcular la nueva tensión
            end
        end
        for i_b=1:pares
            if (sigma_b(i_b)>=sigma_perm_b) & m(i_b)<6
                condicion_1=false;
                m(i_b)=m(i_b)+1;
            elseif (sigma_b(i_b)<sigma_perm_b) & m(i_b)<6 & ((m(i_b)==2 & Conductoras(i_b)>120)|(m(i_b)==2 & Conducidas(i_b)>120)|(m(i_b)==3 & Conductoras(i_b)>120)|(m(i_b)==3 & Conducidas(i_b)>120)|(m(i_b)==4 & Conductoras(i_b)>110)|(m(i_b)==4 & Conducidas(i_b)>110)|(m(i_b)==5 & Conductoras(i_b)>110)|(m(i_b)==5 & Conducidas(i_b)>110)|(m(i_b)==6 & Conductoras(i_b)>40)|(m(i_b)==6 & Conducidas(i_b)>40))
                condicion_1=false;
                m(i_b)=m(i_b)+1;
            else
                condicion_1=true;
            end
        end
    end

    for i_b=1:pares
        if (m(i_b)==2 & Conductoras(i_b)>120)|(m(i_b)==2 & Conducidas(i_b)>120)|(m(i_b)==3 & Conductoras(i_b)>120)|(m(i_b)==3 & Conducidas(i_b)>120)|(m(i_b)==4 & Conductoras(i_b)>110)|(m(i_b)==4 & Conducidas(i_b)>110)|(m(i_b)==5 & Conductoras(i_b)>110)|(m(i_b)==5 & Conducidas(i_b)>110)|(m(i_b)==6 & Conductoras(i_b)>40)|(m(i_b)==6 & Conducidas(i_b)>40)| Conductoras(i_b)<14 | Conducidas(i_b)<14
            f40=msgbox('No hay engranajes normalizados para su sistema.','Error','error');
            condicion_2=true;
        end
    end

    while condicion_2==false
        i_dp=1;
        for i_b=1:pares
            if (sigma_b(i_b)>=sigma_perm_b)
                f41=msgbox('El material elegido para los engranajes NO es válido. Pruebe a introducir otro material.','Error','error');
            elseif (sigma_b(i_b)<sigma_perm_b)
                %2.Análisis de fatiga superficial
                Co=Ko;                                                      %Factor de sobrecarga
                Cs=Ks;                                                      %Factor de correción por tamaño
                Cm=Km;                                                      %Factor de corrección por distribución de la carga
                Cv=Kv;                                                      %Factor dinámico
                %Coeficiente elástico según material
                if coef1                                                    %Material introducido
                    Cp=coef1;
                elseif coef2                                                %Material seleccionado
                    Cp=coef2;
                end
                %Factor de condición superficial
                Cf=1;                                                       %Métodos convencionales de fabricación
                %Factor geométrico
                mn=1;                                                       %Engranes rectos
                if engrane_EXT(i_b)==1
                    I(i_b)=((cos(phi(i_b))*sin(phi(i_b)))/(2*mn))*(k_parcial(i_b)/(k_parcial(i_b)+1));        %Para engranes externos
                elseif engrane_EXT(i_b)==0
                    I(i_b)=abs(((cos(phi(i_b))*sin(phi(i_b)))/(2*mn))*(k_parcial(i_b)/(k_parcial(i_b)-1)));   %Para engranes internos (me sale negativo por eso el abs)
                end
                %Tensión superficial del diente
                sigma_c(i_b)=Cp*(sqrt((Ft(i_b)/(b(i_b)*I(i_b)*dp(i_dp)))*Co*Cs*Cm(i_b)*Cf*Cv(i_b)));
                %Criterio de fallo:
                %Factor de vida
                Cl=1;                                                       %Suponiendo nº de ciclos 10^7
                %Factor de razón de dureza
                A=0;                                                        %Engranajes con mismo material
                Ch=1;                                                       %Como A=0, entonces Ch=1+A*(k-1)=1
                %Factor de temperatura
                Ct=Kt;
                %Factor de confiabilidad
                Cr=Kr;
                %Resistencia a la fatiga superficial
                if Ssup1                                                    %Material introducido
                    Sfc=Ssup1;
                elseif Ssup2                                                %Material seleccionado
                    Sfc=Ssup2;
                end
                %Tensión permisible
                sigma_perm_c=((Cl*Ch)/(Ct*Cr))*Sfc;
                %Comprobar que la tensión permisible es mayor que la del material
                if (sigma_c(i_b)<sigma_perm_c)
                    %Mostrar Resultados Engranajes
                    %Leer imagen
                    I1=imread('engranajes.jpg');
                    %Crear texto
                    text_str1=cell(9,1);
                    text_str1{1}=['Módulo: ' num2str(m(i_b),'%d')];
                    text_str1{2}=['Ángulo de presión: ' num2str(round((phi(i_b)*180/pi)),'%dº')];
                    if mat_gear~=0
                        text_str1{3}=['Material: ' mat_gear];
                    else
                        text_str1{3}='Material introducido por el usuario';
                    end
                    text_str1{4}='Engranaje de Entrada:';
                    text_str1{5}=['Número de dientes: Z=' num2str(round(Conductoras(i_b)),'%d')];
                    text_str1{6}=['Diámetro de paso: dp=' num2str(round(dp(i_dp)),'%d mm')];
                    text_str1{7}='Engranaje de Salida:';
                    text_str1{8}=['Número de dientes: Z=' num2str(round(Conducidas(i_b)),'%d')];
                    text_str1{9}=['Diámetro de paso: dp=' num2str(round(dp(i_dp+1)),'%d mm')];
                    %Definir la posición y el color de los cuadros de texto
                    position1=[410 40;410 60;410 80;410 110;410 130;410 150;410 180;410 200;410 220];
                    box_color1={'white','white','white','white','white','white','white','white','white'};
                    %Insertar el texto
                    RGB1=insertText(I1,position1,text_str1,'FontSize',12,'Boxcolor',box_color1,'BoxOpacity',0,'TextColor','black');
                    %Mostrar la imagen
                    figure
                    imshow(RGB1)
                    title(['Engranajes Etapa ',num2str(i_b),'']);
                    if pares>1
                        if i_b==1
                            print('Engranajes Etapa 1','-dpdf','-fillpage');
                        elseif i_b==2
                            print('Engranajes Etapa 2','-dpdf','-fillpage');
                        elseif i_b==3
                            print('Engranajes Etapa 3','-dpdf','-fillpage');
                        elseif i_b==4
                            print('Engranajes Etapa 4','-dpdf','-fillpage');
                        elseif i_b==5
                            print('Engranajes Etapa 5','-dpdf','-fillpage');
                        end
                    else
                        print('Engranajes','-dpdf','-fillpage');
                    end
                else
                    f42=msgbox('El material elegido para los engranajes NO es válido. Pruebe a introducir otro material.','Error','error');
                end
                i_dp=i_dp+2;
            end
        end
        
        %CÁLCULO Y DISEÑO DE ÁRBOLES
        %Número de ejes totales e intermedios
        ejes=pares+1;
        ejes_intermedios=ejes-2;
        %Cálculo de los diámetros de las diferentes secciones de los ejes
        if pares==1
            [d_A_final,d_E1_final,d_E2_final,d_B_final]=CalculaEjes_1par(Y,Fr,Ft,T(2),m,Sut,d,Asup,bsup,Conductoras,Conducidas);
            %%Mostrar Resultados Eje de Entrada
            %Leer imagen
            I2=imread('ejes1.jpg');
            %Crear texto
            text_str2=cell(14,1);
            text_str2{1}='Rodamiento A';
            text_str2{2}='Rodamiento B';
            text_str2{3}='Engranaje';
            text_str2{4}='Chavetero';
            text_str2{5}='Anilla elástica';
            text_str2{6}=num2str(round((2/3)*Y/2),'%d mm');
            text_str2{7}=num2str(round((2/3)*Y/2),'%d mm');
            text_str2{8}=num2str(round((2/3)*Y),'%d mm');
            text_str2{9}=['d=' num2str(round(d_A_final),'%d mm')];
            text_str2{10}=['d=' num2str(round(d_B_final),'%d mm')];
            text_str2{11}=['d=' num2str(round(d_E1_final),'%d mm')];
            text_str2{12}=['d=' num2str(round(d_E1_final*1.5),'%d mm')];
            text_str2{13}='ENTRADA';
            if mat_eje~=0
                text_str2{14}=['Material: ' mat_eje];
            else
                text_str2{14}='Material introducido por el usuario';
            end
            %Definir la posición y el color de los cuadros de texto
            position2=[100 145;390 145;257 160;200 10;340 175;330 200;185 200;260 230;68 45;435 40;345 25;155 26;10 104;100 260];
            box_color2={'white','white','white','white','white','white','white','white','white','white','white','white','white','white'};
            %Insertar el texto
            RGB2=insertText(I2,position2,text_str2,'FontSize',10,'Boxcolor',box_color2,'BoxOpacity',0,'TextColor','black');
            %Mostrar la imagen
            figure
            imshow(RGB2)
            title('Eje de Entrada');
            print('Eje de Entrada','-dpdf','-fillpage');
            %%Mostrar Resultados Eje de Salida
            %Leer imagen
            I3=imread('ejes2.jpg');
            %Crear texto
            text_str3=cell(14,1);
            text_str3{1}='Rodamiento C';
            text_str3{2}='Rodamiento D';
            text_str3{3}='Engranaje';
            text_str3{4}='Chavetero';
            text_str3{5}='Anilla elástica';
            text_str3{6}=num2str(round((2/3)*Y/2),'%d mm');
            text_str3{7}=num2str(round((2/3)*Y/2),'%d mm');
            text_str3{8}=num2str(round((2/3)*Y),'%d mm');
            text_str3{9}=['d=' num2str(round(d_B_final),'%d mm')];
            text_str3{10}=['d=' num2str(round(d_A_final),'%d mm')];
            text_str3{11}=['d=' num2str(round(d_E2_final*1.5),'%d mm')];
            text_str3{12}=['d=' num2str(round(d_E2_final),'%d mm')];
            text_str3{13}='SALIDA';
            if mat_eje~=0
                text_str3{14}=['Material: ' mat_eje];
            else
                text_str3{14}='Material introducido por el usuario';
            end
            %Definir la posición y el color de los cuadros de texto
            position3=[95 145;385 145;250 160;300 10;140 175;330 200;185 200;250 230;75 40;435 45;345 26;160 26;492 104;100 260];
            box_color3={'white','white','white','white','white','white','white','white','white','white','white','white','white','white'};
            %Insertar el texto
            RGB3=insertText(I3,position3,text_str3,'FontSize',10,'Boxcolor',box_color3,'BoxOpacity',0,'TextColor','black');
            %Mostrar la imagen
            figure
            imshow(RGB3)
            title('Eje de Salida');
            print('Eje de Salida','-dpdf','-fillpage');
        elseif pares>1
            %Establecer longitud de ejes según la dimensión Y de la caja
            Y_interm=ceil((2/3*Y)/ejes_intermedios);
            Y_simple=[];
            if m(1)>=2 & m(1)<4
                Y_simple(1)=ceil((1/3*Y)/pares);
            elseif m(1)>=4 & m(1)<=6
                Y_simple(1)=ceil((1/3*Y)/(pares-1));
            end
            if m(pares)>=2 & m(pares)<4
                Y_simple(2)=ceil((1/3*Y)/pares);
            elseif m(pares)>=4 & m(pares)<=6
                Y_simple(2)=ceil((1/3*Y)/(pares-1));
            end
            %Cálculo de diámetros de las diferentes secciones de los ejes
            if rem(pares,2)==0
                [d_A1_final,d_E1_final,d_B1_final]=CalculaEjes_Simple1(Y_simple(1),Fr(1),Ft(1),T(1),m(1),Sut,d,Asup,bsup,Conductoras(1));
                [d_A2_final,d_E2_final,d_B2_final]=CalculaEjes_Simple3(Y_simple(2),Fr(pares),Ft(pares),T(ruedas),m(pares),Sut,d,Asup,bsup,Conducidas(pares));
                i_torsor=2;
                for i_ejes=1:ejes_intermedios
                    [d_C_final(i_ejes),d_G1_final(i_ejes),d_J1_final(i_ejes),d_D_final(i_ejes)]=CalculaEjes_Intermedios(Y_simple(1),Y_interm,Fr,Ft,T,m,Sut,d,Asup,bsup,Conductoras,Conducidas,i_ejes,i_torsor);
                    i_torsor=i_torsor+2;
                    %Mostrar Resultados Ejes Intermedios
                    %Leer imagen
                    I6=imread('intermedios.jpg');
                    %Crear texto
                    text_str6=cell(16,1);
                    text_str6{1}='Rodamiento C';
                    text_str6{2}='Rodamiento D';
                    text_str6{3}='Engranaje G';
                    text_str6{4}='Engranaje J';
                    text_str6{5}='Chavetero';
                    text_str6{6}='Anilla elástica';
                    text_str6{7}=num2str(round(Y_simple(1)/2),'%d mm');
                    text_str6{8}=num2str(round(Y_simple(1)/2),'%d mm');
                    text_str6{9}=num2str(round(Y_interm),'%d mm');
                    text_str6{10}=['d=' num2str(round(d_C_final(i_ejes)),'%d mm')];
                    text_str6{11}=['d=' num2str(round(d_D_final(i_ejes)),'%d mm')];
                    if d_G1_final>d_J1_final
                        text_str6{12}=['d=' num2str(round(d_G1_final(i_ejes)*1.5),'%d mm')];
                    else
                        text_str6{12}=['d=' num2str(round(d_J1_final(i_ejes)*1.5),'%d mm')];
                    end
                    text_str6{13}=['d=' num2str(round(d_G1_final(i_ejes)),'%d mm')];
                    text_str6{14}=['d=' num2str(round(d_J1_final(i_ejes)),'%d mm')];
                    text_str6{15}=num2str(round(Y_interm-(Y_simple(1)/2)),'%d mm');
                    if mat_eje~=0
                        text_str6{16}=['Material: ' mat_eje];
                    else
                        text_str6{16}='Material introducido por el usuario';
                    end
                    %Definir la posición y el color de los cuadros de texto
                    position6=[40 145;525 145;185 160;385 160;245 10;85 175;470 200;130 200;295 230;24 40;570 45;325 26;105 26;480 26;295 200;80 260];
                    box_color6={'white','white','white','white','white','white','white','white','white','white','white','white','white','white','white','white'};
                    %Insertar el texto
                    RGB6=insertText(I6,position6,text_str6,'FontSize',10,'Boxcolor',box_color6,'BoxOpacity',0,'TextColor','black');
                    %Mostrar la imagen
                    figure
                    imshow(RGB6)
                    title(['Eje Intermedio Etapas ',num2str(i_ejes),'-',num2str(i_ejes+1),'']);
                    if i_ejes==1
                        print('Eje Intermedio Etapas 1-2','-dpdf','-fillpage');
                    elseif i_ejes==2
                        print('Eje Intermedio Etapas 2-3','-dpdf','-fillpage');
                    elseif i_ejes==3
                        print('Eje Intermedio Etapas 3-4','-dpdf','-fillpage');
                    elseif i_ejes==4
                        print('Eje Intermedio Etapas 4-5','-dpdf','-fillpage');
                    end
                end
            else
                [d_A1_final,d_E1_final,d_B1_final]=CalculaEjes_Simple1(Y_simple(1),Fr(1),Ft(1),T(1),m(1),Sut,d,Asup,bsup,Conductoras(1));
                [d_A2_final,d_E2_final,d_B2_final]=CalculaEjes_Simple2(Y_simple(2),Fr(pares),Ft(pares),T(ruedas),m(pares),Sut,d,Asup,bsup,Conducidas(pares));
                i_torsor=2;
                for i_ejes=1:ejes_intermedios
                    [d_C_final(i_ejes),d_G1_final(i_ejes),d_J1_final(i_ejes),d_D_final(i_ejes)]=CalculaEjes_Intermedios(Y_simple(1),Y_interm,Fr,Ft,T,m,Sut,d,Asup,bsup,Conductoras,Conducidas,i_ejes,i_torsor);
                    i_torsor=i_torsor+2;
                    %Mostrar Resultados Ejes Intermedios
                    %Leer imagen
                    I6=imread('intermedios.jpg');
                    %Crear texto
                    text_str6=cell(16,1);
                    text_str6{1}='Rodamiento C';
                    text_str6{2}='Rodamiento D';
                    text_str6{3}='Engranaje G';
                    text_str6{4}='Engranaje J';
                    text_str6{5}='Chavetero';
                    text_str6{6}='Anilla elástica';
                    text_str6{7}=num2str(round(Y_simple(1)/2),'%d mm');
                    text_str6{8}=num2str(round(Y_simple(1)/2),'%d mm');
                    text_str6{9}=num2str(round(Y_interm),'%d mm');
                    text_str6{10}=['d=' num2str(round(d_C_final(i_ejes)),'%d mm')];
                    text_str6{11}=['d=' num2str(round(d_D_final(i_ejes)),'%d mm')];
                    if d_G1_final>d_J1_final
                        text_str6{12}=['d=' num2str(round(d_G1_final(i_ejes)*1.5),'%d mm')];
                    else
                        text_str6{12}=['d=' num2str(round(d_J1_final(i_ejes)*1.5),'%d mm')];
                    end
                    text_str6{13}=['d=' num2str(round(d_G1_final(i_ejes)),'%d mm')];
                    text_str6{14}=['d=' num2str(round(d_J1_final(i_ejes)),'%d mm')];
                    text_str6{15}=num2str(round(Y_interm-(Y_simple(1)/2)),'%d mm');
                    if mat_eje~=0
                        text_str6{16}=['Material: ' mat_eje];
                    else
                        text_str6{16}='Material introducido por el usuario';
                    end
                    %Definir la posición y el color de los cuadros de texto
                    position6=[40 145;525 145;185 160;385 160;245 10;85 175;470 200;130 200;295 230;24 40;572 45;327 26;102 26;482 26;295 200;80 260];
                    box_color6={'white','white','white','white','white','white','white','white','white','white','white','white','white','white','white','white'};
                    %Insertar el texto
                    RGB6=insertText(I6,position6,text_str6,'FontSize',10,'Boxcolor',box_color6,'BoxOpacity',0,'TextColor','black');
                    %Mostrar la imagen
                    figure
                    imshow(RGB6)
                    title(['Eje Intermedio Etapas ',num2str(i_ejes),'-',num2str(i_ejes+1),'']);
                    if i_ejes==1
                        print('Eje Intermedio Etapas 1-2','-dpdf','-fillpage');
                    elseif i_ejes==2
                        print('Eje Intermedio Etapas 2-3','-dpdf','-fillpage');
                    elseif i_ejes==3
                        print('Eje Intermedio Etapas 3-4','-dpdf','-fillpage');
                    elseif i_ejes==4
                        print('Eje Intermedio Etapas 4-5','-dpdf','-fillpage');
                    end
                end
            end
            %%Mostrar Resultados Eje de Entrada
            %Leer imagen
            I4=imread('ejes1.jpg');
            %Crear texto
            text_str4=cell(14,1);
            text_str4{1}='Rodamiento A';
            text_str4{2}='Rodamiento B';
            text_str4{3}='Engranaje';
            text_str4{4}='Chavetero';
            text_str4{5}='Anilla elástica';
            text_str4{6}=num2str(round(Y_simple(1)/2),'%d mm');
            text_str4{7}=num2str(round(Y_simple(1)/2),'%d mm');
            text_str4{8}=num2str(round(Y_simple(1)),'%d mm');
            text_str4{9}=['d=' num2str(round(d_A1_final),'%d mm')];
            text_str4{10}=['d=' num2str(round(d_B1_final),'%d mm')];
            text_str4{11}=['d=' num2str(round(d_E1_final),'%d mm')];
            text_str4{12}=['d=' num2str(round(d_E1_final*1.5),'%d mm')];
            text_str4{13}='ENTRADA';
            if mat_eje~=0
                text_str4{14}=['Material: ' mat_eje];
            else
                text_str4{14}='Material introducido por el usuario';
            end
            %Definir la posición y el color de los cuadros de texto
            position4=[100 145;390 145;257 160;200 10;340 175;330 200;185 200;260 230;74 45;435 40;345 25;155 26;10 104;100 260];
            box_color4={'white','white','white','white','white','white','white','white','white','white','white','white','white','white'};
            %Insertar el texto
            RGB4=insertText(I4,position4,text_str4,'FontSize',10,'Boxcolor',box_color4,'BoxOpacity',0,'TextColor','black');
            %Mostrar la imagen
            figure
            imshow(RGB4)
            title('Eje de Entrada');
            print('Eje de Entrada','-dpdf','-fillpage');
            %%Mostrar Resultados Eje de Salida
            %Leer imagen
            I5=imread('ejes2.jpg');
            %Crear texto
            text_str5=cell(14,1);
            text_str5{1}='Rodamiento A';
            text_str5{2}='Rodamiento B';
            text_str5{3}='Engranaje';
            text_str5{4}='Chavetero';
            text_str5{5}='Anilla elástica';
            text_str5{6}=num2str(round(Y_simple(2)/2),'%d mm');
            text_str5{7}=num2str(round(Y_simple(2)/2),'%d mm');
            text_str5{8}=num2str(round(Y_simple(2)),'%d mm');
            text_str5{9}=['d=' num2str(round(d_A2_final),'%d mm')];
            text_str5{10}=['d=' num2str(round(d_B2_final),'%d mm')];
            text_str5{11}=['d=' num2str(round(d_E2_final*1.5),'%d mm')];
            text_str5{12}=['d=' num2str(round(d_E2_final),'%d mm')];
            text_str5{13}='SALIDA';
            if mat_eje~=0
                text_str5{14}=['Material: ' mat_eje];
            else
                text_str5{14}='Material introducido por el usuario';
            end
            %Definir la posición y el color de los cuadros de texto
            position5=[95 145;385 145;250 160;300 10;140 175;330 200;185 200;250 230;73 40;435 45;345 26;160 26;492 104;100 260];
            box_color5={'white','white','white','white','white','white','white','white','white','white','white','white','white','white'};
            %Insertar el texto
            RGB5=insertText(I5,position5,text_str5,'FontSize',10,'Boxcolor',box_color5,'BoxOpacity',0,'TextColor','black');
            %Mostrar la imagen
            figure
            imshow(RGB5)
            title('Eje de Salida');
            print('Eje de Salida','-dpdf','-fillpage');
        end
        
        %CÁLCULO Y SELECCIÓN DE RODAMIENTOS
        %Datos
        Xr=1;
        Yr=0;
        if pares==1
            %Capacidad dinámica del rodamiento A en función del diámetro
            Cdyn_A=Calcula_Cdyn(d_A_final);
            %Capacidad dinámica del rodamiento B en función del diámetro
            Cdyn_B=Calcula_Cdyn(d_B_final);
            %Comprobar factor de la duración de vida
            fn1=nthroot((33.33/w(1)),3);
            fn2=nthroot((33.33/w(2)),3);
            %PUNTO A (inicio eje de entrada)
            Txy=(Fr*((2/3)*Y/2))/((2/3)*Y);
            Txz=(Ft*((2/3)*Y/2))/((2/3)*Y);
            T_A=sqrt((Txy^2)+(Txz^2));
            Pr_A=Xr*(T_A/1000);
            fl_A=Cdyn_A/Pr_A*fn1;
            %PUNTO B (final eje de entrada)
            T_B=sqrt((Txy^2)+(Txz^2));
            Pr_B=Xr*(T_B/1000);
            fl_B=Cdyn_B/Pr_B*fn1;
            %PUNTO A' (inicio eje de salida)
            f1_A_prima=Cdyn_B/Pr_B*fn2;
            %PUNTO B' (final eje de salida)
            fl_B_prima=Cdyn_A/Pr_A*fn2;
            %Mostrar Resultados Rodamientos
            if fl_A>=2 & fl_B_prima>=2 & fl_B>=2 & f1_A_prima>=2
                %Leer imagen
                I7=imread('rodamientos1.jpg');
                %Crear texto
                text_str7=cell(5,1);
                %tread_val=[d_A_final,d_B_final];
                text_str7{1}='RODAMIENTOS RÍGIDOS DE BOLAS';
                text_str7{2}=['Rodamiento A: d=' num2str(round(d_A_final),'%d mm (Eje Entrada)')];
                text_str7{3}=['Rodamiento B: d=' num2str(round(d_B_final),'%d mm (Eje Entrada)')];
                text_str7{4}=['Rodamiento C: d=' num2str(round(d_B_final),'%d mm (Eje Salida)')];
                text_str7{5}=['Rodamiento D: d=' num2str(round(d_A_final),'%d mm (Eje Salida)')];
                %Definir la posición y el color de los cuadros de texto
                position7=[170 30;170 50;170 70;170 90;170 110];
                box_color7={'white','white','white','white','white'};
                %Insertar el texto
                RGB7=insertText(I7,position7,text_str7,'FontSize',12,'Boxcolor',box_color7,'BoxOpacity',0,'TextColor','black');
                %Mostrar la imagen
                figure
                imshow(RGB7)
                title('Rodamientos');
                print('Rodamientos','-dpdf','-fillpage');
            else
                f43=msgbox({'No hay rodamientos normalizados para su sistema.';' ';...
                    'Pruebe a modificar alguno de los siguientes datos introducidos:';...
                    '1. Seleccionar otro material para los rodamientos.';...
                    '2. Disminuir la dimensión Y de la caja.';...
                    '3. Disminuir la potencia a transmitir.';...
                    '4. Aumentar la velocidad de entrada o salida (la más pequeña).'},'Error','error');
            end
        elseif pares>1
            %%Rodamientos Eje Entrada
            %Capacidad dinámica del rodamiento A en función del diámetro
            Cdyn_A1=Calcula_Cdyn(d_A1_final);
            %Capacidad dinámica del rodamiento B en función del diámetro
            Cdyn_B1=Calcula_Cdyn(d_B1_final);
            %Comprobar factor de la duración de vida
            fn_e=nthroot((33.33/w(1)),3);
            %PUNTO A (inicio eje de entrada)
            Txy_A1=(Fr(1)*(Y_simple(1)/2))/(Y_simple(1));
            Txz_A1=(Ft(1)*(Y_simple(1)/2))/(Y_simple(1));
            T_A1=sqrt((Txy_A1^2)+(Txz_A1^2));
            Pr_A1=Xr*(T_A1/1000);
            fl_A1=Cdyn_A1/Pr_A1*fn_e;
            %PUNTO B (final eje de entrada)
            T_B1=sqrt((Txy_A1^2)+(Txz_A1^2));
            Pr_B1=Xr*(T_B1/1000);
            fl_B1=Cdyn_B1/Pr_B1*fn_e;
            %%Rodamientos Eje Salida
            %Capacidad dinámica del rodamiento A en función del diámetro
            Cdyn_A2=Calcula_Cdyn(d_A2_final);
            %Capacidad dinámica del rodamiento B en función del diámetro
            Cdyn_B2=Calcula_Cdyn(d_B2_final);
            %Comprobar factor de la duración de vida
            fn_s=nthroot((33.33/w(ruedas)),3);
            %PUNTO A (inicio eje de salida)
            Txy_A2=(Fr(pares)*(Y_simple(2)/2))/(Y_simple(2));
            Txz_A2=(Ft(pares)*(Y_simple(2)/2))/(Y_simple(2));
            T_A2=sqrt((Txy_A2^2)+(Txz_A2^2));
            Pr_A2=Xr*(T_A2/1000);
            fl_A2=Cdyn_A2/Pr_A2*fn_s;
            %PUNTO B (final eje de salida)
            T_B2=sqrt((Txy_A2^2)+(Txz_A2^2));
            Pr_B2=Xr*(T_B2/1000);
            fl_B2=Cdyn_B2/Pr_B2*fn_s;
            %%Mostrar Resultados Rodamientos Ejes Entrada y Salida
            if fl_A1>=2 & fl_B1>=2 & fl_A2>=2 & fl_B2>=2
                %Leer imagen
                I7=imread('rodamientos1.jpg');
                %Crear texto
                text_str7=cell(5,1);
                %tread_val=[d_A1_final,d_B1_final,d_A2_final,d_B2_final];
                text_str7{1}='RODAMIENTOS RÍGIDOS DE BOLAS';
                text_str7{2}=['Rodamiento A: d=' num2str(round(d_A1_final),'%d mm (Eje Entrada)')];
                text_str7{3}=['Rodamiento B: d=' num2str(round(d_B1_final),'%d mm (Eje Entrada)')];
                text_str7{4}=['Rodamiento A: d=' num2str(round(d_A2_final),'%d mm (Eje Salida)')];
                text_str7{5}=['Rodamiento B: d=' num2str(round(d_B2_final),'%d mm (Eje Salida)')];
                %Definir la posición y el color de los cuadros de texto
                position7=[170 30;170 50;170 70;170 90;170 110];
                box_color7={'white','white','white','white','white'};
                %Insertar el texto
                RGB7=insertText(I7,position7,text_str7,'FontSize',12,'Boxcolor',box_color7,'BoxOpacity',0,'TextColor','black');
                %Mostrar la imagen
                figure
                imshow(RGB7)
                title('Rodamientos Ejes Entrada y Salida');
                print('Rodamientos Ejes Entrada y Salida','-dpdf','-fillpage');
            else
                f44=msgbox({'No hay rodamientos normalizados para los ejes de entrada y salida.';' ';...
                    'Pruebe a modificar alguno de los siguientes datos introducidos:';...
                    '1. Seleccionar otro material para los rodamientos.';...
                    '2. Disminuir la dimensión Y de la caja.';...
                    '3. Disminuir la potencia a transmitir.';...
                    '4. Aumentar la velocidad de entrada o salida (la más pequeña).'},'Error','error');
            end
            %%Rodamientos Ejes Intermedios
            i_fn=2;
            for i_rod=1:ejes_intermedios
                %Capacidad dinámica del rodamiento C en función del diámetro
                Cdyn_C(i_rod)=Calcula_Cdyn(d_C_final(i_rod));
                %Capacidad dinámica del rodamiento D en función del diámetro
                Cdyn_D(i_rod)=Calcula_Cdyn(d_D_final(i_rod));
                %Comprobar factor de la duración de vida
                fn(i_rod)=nthroot((33.33/w(i_fn)),3);
                i_fn=i_fn+2;
                %PUNTO C (inicio eje intermedio)
                Txy_C(i_rod)=Fr(i_rod)+Fr(i_rod+1)-((Fr(i_rod)*(Y_simple(1)/2)+Fr(i_rod+1)*(Y_interm-(Y_simple(1)/2)))/(Y_interm));
                Txz_C(i_rod)=Ft(i_rod)+Ft(i_rod+1)-((Ft(i_rod)*(Y_simple(1)/2)+Ft(i_rod+1)*(Y_interm-(Y_simple(1)/2)))/(Y_interm));
                T_C(i_rod)=sqrt(((Txy_C(i_rod))^2)+((Txz_C(i_rod))^2));
                Pr_C(i_rod)=Xr*(T_C(i_rod)/1000);
                fl_C(i_rod)=Cdyn_C(i_rod)/Pr_C(i_rod)*fn(i_rod);
                %PUNTO D (final eje intermedio)
                Txy_D(i_rod)=(Fr(i_rod)*(Y_simple(1)/2)+Fr(i_rod+1)*(Y_interm-(Y_simple(1)/2)))/(Y_interm);
                Txz_D(i_rod)=(Ft(i_rod)*(Y_simple(1)/2)+Ft(i_rod+1)*(Y_interm-(Y_simple(1)/2)))/(Y_interm);
                T_D(i_rod)=sqrt(((Txy_D(i_rod))^2)+((Txz_D(i_rod))^2));
                Pr_D(i_rod)=Xr*(T_D(i_rod)/1000);
                fl_D(i_rod)=Cdyn_D(i_rod)/Pr_D(i_rod)*fn(i_rod);
            end
            %%Mostrar Resultados Rodamientos Ejes Intermedios
            if fl_C>=2 & fl_D>=2
                if ejes_intermedios==1
                    %Leer imagen
                    I8=imread('rodamientos1.jpg');
                    %Crear texto
                    text_str8=cell(3,1);
                    text_str8{1}='RODAMIENTOS RÍGIDOS DE BOLAS';
                    text_str8{2}=['Rodamiento C: d=' num2str(round(d_C_final),'%d mm')];
                    text_str8{3}=['Rodamiento D: d=' num2str(round(d_D_final),'%d mm')];
                    %Definir la posición y el color de los cuadros de texto
                    position8=[170 30;170 50;170 70];
                    box_color8={'white','white','white'};
                    %Insertar el texto
                    RGB8=insertText(I8,position8,text_str8,'FontSize',12,'Boxcolor',box_color8,'BoxOpacity',0,'TextColor','black');
                    %Mostrar la imagen
                    figure
                    imshow(RGB8)
                    title('Rodamientos Ejes Intermedios');
                    print('Rodamientos Ejes Intermedios','-dpdf','-fillpage');
                elseif ejes_intermedios==2
                    %Leer imagen
                    I8=imread('rodamientos1.jpg');
                    %Crear texto
                    text_str8=cell(5,1);
                    text_str8{1}='RODAMIENTOS RÍGIDOS DE BOLAS';
                    text_str8{2}=['Rodamiento C: d=' num2str(round(d_C_final(1)),'%d mm (Eje Etapas 1-2)')];
                    text_str8{3}=['Rodamiento D: d=' num2str(round(d_D_final(1)),'%d mm (Eje Etapas 1-2)')];
                    text_str8{4}=['Rodamiento C: d=' num2str(round(d_C_final(2)),'%d mm (Eje Etapas 2-3)')];
                    text_str8{5}=['Rodamiento D: d=' num2str(round(d_D_final(2)),'%d mm (Eje Etapas 2-3)')];
                    %Definir la posición y el color de los cuadros de texto
                    position8=[155 30;155 50;155 70;155 90;155 110];
                    box_color8={'white','white','white','white','white'};
                    %Insertar el texto
                    RGB8=insertText(I8,position8,text_str8,'FontSize',12,'Boxcolor',box_color8,'BoxOpacity',0,'TextColor','black');
                    %Mostrar la imagen
                    figure
                    imshow(RGB8)
                    title('Rodamientos Ejes Intermedios');
                    print('Rodamientos Ejes Intermedios','-dpdf','-fillpage');
                elseif ejes_intermedios==3
                    %Leer imagen
                    I8=imread('rodamientos2.jpg');
                    %Crear texto
                    text_str8=cell(7,1);
                    text_str8{1}='RODAMIENTOS RÍGIDOS DE BOLAS';
                    text_str8{2}=['Rodamiento C: d=' num2str(round(d_C_final(1)),'%d mm (Eje Etapas 1-2)')];
                    text_str8{3}=['Rodamiento D: d=' num2str(round(d_D_final(1)),'%d mm (Eje Etapas 1-2)')];
                    text_str8{4}=['Rodamiento C: d=' num2str(round(d_C_final(2)),'%d mm (Eje Etapas 2-3)')];
                    text_str8{5}=['Rodamiento D: d=' num2str(round(d_D_final(2)),'%d mm (Eje Etapas 2-3)')];
                    text_str8{6}=['Rodamiento C: d=' num2str(round(d_C_final(3)),'%d mm (Eje Etapas 3-4)')];
                    text_str8{7}=['Rodamiento D: d=' num2str(round(d_D_final(3)),'%d mm (Eje Etapas 3-4)')];
                    %Definir la posición y el color de los cuadros de texto
                    position8=[170 50;170 70;170 90;170 110;170 130;170 150;170 170];
                    box_color8={'white','white','white','white','white','white','white'};
                    %Insertar el texto
                    RGB8=insertText(I8,position8,text_str8,'FontSize',12,'Boxcolor',box_color8,'BoxOpacity',0,'TextColor','black');
                    %Mostrar la imagen
                    figure
                    imshow(RGB8)
                    title('Rodamientos Ejes Intermedios');
                    print('Rodamientos Ejes Intermedios','-dpdf','-fillpage');
                elseif ejes_intermedios==4
                    %Leer imagen
                    I8=imread('rodamientos2.jpg');
                    %Crear texto
                    text_str8=cell(9,1);
                    text_str8{1}='RODAMIENTOS RÍGIDOS DE BOLAS';
                    text_str8{2}=['Rodamiento C: d=' num2str(round(d_C_final(1)),'%d mm (Eje Etapas 1-2)')];
                    text_str8{3}=['Rodamiento D: d=' num2str(round(d_D_final(1)),'%d mm (Eje Etapas 1-2)')];
                    text_str8{4}=['Rodamiento C: d=' num2str(round(d_C_final(2)),'%d mm (Eje Etapas 2-3)')];
                    text_str8{5}=['Rodamiento D: d=' num2str(round(d_D_final(2)),'%d mm (Eje Etapas 2-3)')];
                    text_str8{6}=['Rodamiento C: d=' num2str(round(d_C_final(3)),'%d mm (Eje Etapas 3-4)')];
                    text_str8{7}=['Rodamiento D: d=' num2str(round(d_D_final(3)),'%d mm (Eje Etapas 3-4)')];
                    text_str8{8}=['Rodamiento C: d=' num2str(round(d_C_final(4)),'%d mm (Eje Etapas 4-5)')];
                    text_str8{9}=['Rodamiento D: d=' num2str(round(d_D_final(4)),'%d mm (Eje Etapas 4-5)')];
                    %Definir la posición y el color de los cuadros de texto
                    position8=[170 50;170 70;170 90;170 110;170 130;170 150;170 170;170 190;170 210];
                    box_color8={'white','white','white','white','white','white','white','white','white'};
                    %Insertar el texto
                    RGB8=insertText(I8,position8,text_str8,'FontSize',12,'Boxcolor',box_color8,'BoxOpacity',0,'TextColor','black');
                    %Mostrar la imagen
                    figure
                    imshow(RGB8)
                    title('Rodamientos Ejes Intermedios');
                    print('Rodamientos Ejes Intermedios','-dpdf','-fillpage');
                end
            else
                f45=msgbox({'No hay rodamientos normalizados para los ejes intermedios.';' ';...
                    'Pruebe a modificar alguno de los siguientes datos introducidos:';...
                    '1. Seleccionar otro material para los rodamientos.';...
                    '2. Disminuir la dimensión Y de la caja.';...
                    '3. Disminuir la potencia a transmitir.';...
                    '4. Aumentar la velocidad de entrada o salida (la más pequeña).'},'Error','error');
            end
        end
        
        %CÁLCULO Y SELECCIÓN DE CHAVETAS
        if pares==1
            %Longitud mínima del chavetero en función de la tensión de cizalladura
            n=2;
            L_1=(4*(T(2)*1000)*n)/(d_E1_final*b*Sy);
            L_2=(4*(T(2)*1000)*n)/(d_E2_final*b*Sy);
            %Chaveta normalizada según diámetro del eje y la longitud mínima
            %para el engranaje de entrada
            [L_1_final,b_1_final,w_1,chavetas_1]=Calcula_Chavetas(d_E1_final,L_1);
            %Chaveta normalizada según diámetro del eje y la longitud mínima
            %para el engranaje de salida
            [L_2_final,b_2_final,w_2,chavetas_2]=Calcula_Chavetas(d_E2_final,L_2);
            %Comprobar que las chavetas soportan las tensiones de aplastamiento
            if chavetas_1~=0 & chavetas_2~=0
                sigma_aplast_1=(2*(T(2)*1000))/(d_E1_final*(w_1/2)*L_1_final);
                sigma_aplast_2=(2*(T(2)*1000))/(d_E2_final*(w_2/2)*L_2_final);
                if (sigma_aplast_1<(Sy/n)) & (sigma_aplast_2<(Sy/n))
                    %Mostrar Resultados Chavetas
                    %Leer imagen
                    I9=imread('chavetas1.jpg');
                    %Crear texto
                    text_str9=cell(4,1);
                    if mat_chaveta~=0
                        text_str9{1}=['Material: ' mat_chaveta];
                    else
                        text_str9{1}='Material introducido por el usuario';
                    end
                    text_str9{2}='CHAVETAS DIN 6885';
                    text_str9{3}=['Chaveta DIN 6885-' num2str(b_1_final,'%d') '-' num2str(w_1,'%d') '-' num2str(L_1_final,'%d (Etapa 1)')];
                    text_str9{4}=['Chaveta DIN 6885-' num2str(b_2_final,'%d') '-' num2str(w_2,'%d') '-' num2str(L_2_final,'%d (Etapa 2)')];
                    %Definir la posición y el color de los cuadros de texto
                    position9=[180 100;180 35;180 55;180 75];
                    box_color9={'white','white','white','white'};
                    %Insertar el texto
                    RGB9=insertText(I9,position9,text_str9,'FontSize',12,'Boxcolor',box_color9,'BoxOpacity',0,'TextColor','black');
                    %Mostrar la imagen
                    figure
                    imshow(RGB9)
                    title('Chavetas');
                    print('Chavetas','-dpdf','-fillpage');
                else
                    f46=msgbox('El material elegido para las chavetas NO es válido. Pruebe a introducir otro material.', 'Error','error');
                end
            end
        elseif pares>1
            %%Chavetas Ejes Entrada y Salida
            %Longitud mínima del chavetero en función de la tensión de cizalladura
            n=2;
            L_1=(4*(T(1)*1000)*n)/(d_E1_final*b(1)*Sy);
            L_2=(4*(T(ruedas)*1000)*n)/(d_E2_final*b(pares)*Sy);
            %Chaveta normalizada según diámetro del eje y la longitud mínima
            %para el engranaje de entrada
            [L_1_final,b_1_final,w_1,chavetas_1]=Calcula_Chavetas(d_E1_final,L_1);
            %Chaveta normalizada según diámetro del eje y la longitud mínima
            %para el engranaje de salida
            [L_2_final,b_2_final,w_2,chavetas_2]=Calcula_Chavetas(d_E2_final,L_2);
            %Comprobar que las chavetas soportan las tensiones de aplastamiento
            if chavetas_1~=0 & chavetas_2~=0
                sigma_aplast_1=(2*(T(1)*1000))/(d_E1_final*(w_1/2)*L_1_final);
                sigma_aplast_2=(2*(T(ruedas)*1000))/(d_E2_final*(w_2/2)*L_2_final);
                if (sigma_aplast_1<(Sy/n)) & (sigma_aplast_2<(Sy/n))
                    %Mostrar Resultados Chavetas Eje Entrada y Salida
                    %Leer imagen
                    I9=imread('chavetas1.jpg');
                    %Crear texto
                    text_str9=cell(4,1);
                    if mat_chaveta~=0
                        text_str9{1}=['Material: ' mat_chaveta];
                    else
                        text_str9{1}='Material introducido por el usuario';
                    end
                    text_str9{2}='CHAVETAS DIN 6885';
                    text_str9{3}=['Chaveta DIN 6885-' num2str(b_1_final,'%d') '-' num2str(w_1,'%d') '-' num2str(L_1_final,'%d (Eje Entrada)')];
                    text_str9{4}=['Chaveta DIN 6885-' num2str(b_2_final,'%d') '-' num2str(w_2,'%d') '-' num2str(L_2_final,'%d (Eje Salida)')];
                    %Definir la posición y el color de los cuadros de texto
                    position9=[180 100;180 35;180 55;180 75];
                    box_color9={'white','white','white','white'};
                    %Insertar el texto
                    RGB9=insertText(I9,position9,text_str9,'FontSize',12,'Boxcolor',box_color9,'BoxOpacity',0,'TextColor','black');
                    %Mostrar la imagen
                    figure
                    imshow(RGB9)
                    title('Chavetas Ejes Entrada y Salida');
                    print('Chavetas Ejes Entrada y Salida','-dpdf','-fillpage');
                elseif (sigma_aplast_1<(Sy/n)) & (sigma_aplast_2>(Sy/n))
                    %Mostrar Resultados Chavetas Eje Entrada
                    %Leer imagen
                    I9=imread('chavetas1.jpg');
                    %Crear texto
                    text_str9=cell(2,1);
                    if mat_chaveta~=0
                        text_str9{1}=['Material: ' mat_chaveta];
                    else
                        text_str9{1}='Material introducido por el usuario';
                    end
                    text_str9{2}=['CHAVETA DIN 6885-' num2str(b_1_final,'%d') '-' num2str(w_1,'%d') '-' num2str(L_1_final,'%d (Eje Entrada)')];
                    %Definir la posición y el color de los cuadros de texto
                    position9=[180 75;180 45];
                    box_color9={'white','white'};
                    %Insertar el texto
                    RGB9=insertText(I9,position9,text_str9,'FontSize',12,'Boxcolor',box_color9,'BoxOpacity',0,'TextColor','black');
                    %Mostrar la imagen
                    figure
                    imshow(RGB9)
                    title('Chaveta Eje Entrada');
                    print('Chavetas Ejes Entrada','-dpdf','-fillpage');
                    f46=msgbox('El material elegido para la chaveta del eje de salida NO es válido. Pruebe a introducir otro material.', 'Error','error');
                elseif (sigma_aplast_1>(Sy/n)) & (sigma_aplast_2<(Sy/n))
                    %Mostrar Resultados Chavetas Eje Salida
                    %Leer imagen
                    I9=imread('chavetas1.jpg');
                    %Crear texto
                    text_str9=cell(3,1);
                    if mat_chaveta~=0
                        text_str9{1}=['Material: ' mat_chaveta];
                    else
                        text_str9{1}='Material introducido por el usuario';
                    end
                    text_str9{2}=['CHAVETA DIN 6885-' num2str(b_2_final,'%d') '-' num2str(w_2,'%d') '-' num2str(L_2_final,'%d (Eje Salida)')];
                    %Definir la posición y el color de los cuadros de texto
                    position9=[180 75;180 45];
                    box_color9={'white','white'};
                    %Insertar el texto
                    RGB9=insertText(I9,position9,text_str9,'FontSize',12,'Boxcolor',box_color9,'BoxOpacity',0,'TextColor','black');
                    %Mostrar la imagen
                    figure
                    imshow(RGB9)
                    title('Chaveta Eje Salida');
                    print('Chavetas Ejes Salida','-dpdf','-fillpage');
                    f46=msgbox('El material elegido para la chaveta del eje de entrada NO es válido. Pruebe a introducir otro material.', 'Error','error');
                else
                    f47=msgbox('El material elegido para las chavetas de los ejes de entrada y salida NO es válido. Pruebe a introducir otro material.', 'Error','error');
                end
            end
            %%Chavetas Ejes Intermedios
            i_torsor=2;
            for i_chaveta=1:ejes_intermedios
                %Longitud mínima del chavetero en función de la tensión de cizalladura
                n=2;
                L_1(i_chaveta)=(4*(T(i_torsor)*1000)*n)/(d_G1_final(i_chaveta)*b(i_chaveta)*Sy);
                L_2(i_chaveta)=(4*(T(i_torsor)*1000)*n)/(d_J1_final(i_chaveta)*b(i_chaveta+1)*Sy);
                %Chaveta normalizada según diámetro del eje y la longitud mínima
                %para el engranaje de entrada del eje intermedio
                [L_1_final(i_chaveta),b_1_final(i_chaveta),w_1(i_chaveta),chavetas_1(i_chaveta)]=Calcula_Chavetas(d_G1_final(i_chaveta),L_1(i_chaveta));
                %Chaveta normalizada según diámetro del eje y la longitud mínima
                %para el engranaje de salida del eje intermedio
                [L_2_final(i_chaveta),b_2_final(i_chaveta),w_2(i_chaveta),chavetas_2(i_chaveta)]=Calcula_Chavetas(d_J1_final(i_chaveta),L_2(i_chaveta));
                %Tensiones de aplastamiento
                if chavetas_1(i_chaveta)~=0 & chavetas_2(i_chaveta)~=0
                    sigma_aplast_1(i_chaveta)=(2*(T(i_torsor)*1000))/(d_G1_final(i_chaveta)*(w_1(i_chaveta)/2)*L_1_final(i_chaveta));
                    sigma_aplast_2(i_chaveta)=(2*(T(i_torsor)*1000))/(d_J1_final(i_chaveta)*(w_2(i_chaveta)/2)*L_2_final(i_chaveta));
                end
                i_torsor=i_torsor+2;
            end
            %Comprobar que las chavetas soportan las tensiones de aplastamiento
            if chavetas_1~=0 & chavetas_2~=0
                if (sigma_aplast_1<(Sy/n)) & (sigma_aplast_2<(Sy/n))
                    if ejes_intermedios==1
                        %Mostrar Resultados Chavetas Ejes Intermedios
                        %Leer imagen
                        I10=imread('chavetas1.jpg');
                        %Crear texto
                        text_str10=cell(4,1);
                        if mat_chaveta~=0
                            text_str10{1}=['Material: ' mat_chaveta];
                        else
                            text_str10{1}='Material introducido por el usuario';
                        end
                        text_str10{2}='CHAVETAS DIN 6885';
                        text_str10{3}=['Chaveta DIN 6885-' num2str(b_1_final(1),'%d') '-' num2str(w_1(1),'%d') '-' num2str(L_1_final(1),'%d (G Etapa 1)')];
                        text_str10{4}=['Chaveta DIN 6885-' num2str(b_2_final(1),'%d') '-' num2str(w_2(1),'%d') '-' num2str(L_2_final(1),'%d (J Etapa 2)')];
                        %Definir la posición y el color de los cuadros de texto
                        position10=[180 95;180 30;180 50;180 70];
                        box_color10={'white','white','white','white'};
                        %Insertar el texto
                        RGB10=insertText(I10,position10,text_str10,'FontSize',12,'Boxcolor',box_color10,'BoxOpacity',0,'TextColor','black');
                        %Mostrar la imagen
                        figure
                        imshow(RGB10)
                        title('Chavetas Ejes Intermedios');
                        print('Chavetas Ejes Intermedios','-dpdf','-fillpage');
                    elseif ejes_intermedios==2
                        %Mostrar Resultados Chavetas Ejes Intermedios
                        %Leer imagen
                        I10=imread('chavetas1.jpg');
                        %Crear texto
                        text_str10=cell(6,1);
                        if mat_chaveta~=0
                            text_str10{1}=['Material: ' mat_chaveta];
                        else
                            text_str10{1}='Material introducido por el usuario';
                        end
                        text_str10{2}='CHAVETAS DIN 6885';
                        text_str10{3}=['Chaveta DIN 6885-' num2str(b_1_final(1),'%d') '-' num2str(w_1(1),'%d') '-' num2str(L_1_final(1),'%d (G Etapa 1)')];
                        text_str10{4}=['Chaveta DIN 6885-' num2str(b_2_final(1),'%d') '-' num2str(w_2(1),'%d') '-' num2str(L_2_final(1),'%d (J Etapa 2)')];
                        text_str10{5}=['Chaveta DIN 6885-' num2str(b_1_final(2),'%d') '-' num2str(w_1(2),'%d') '-' num2str(L_1_final(2),'%d (G Etapa 2)')];
                        text_str10{6}=['Chaveta DIN 6885-' num2str(b_2_final(2),'%d') '-' num2str(w_2(2),'%d') '-' num2str(L_2_final(2),'%d (J Etapa 3)')];
                        %Definir la posición y el color de los cuadros de texto
                        position10=[180 130;180 25;180 45;180 65;180 85;180 105];
                        box_color10={'white','white','white','white','white','white'};
                        %Insertar el texto
                        RGB10=insertText(I10,position10,text_str10,'FontSize',12,'Boxcolor',box_color10,'BoxOpacity',0,'TextColor','black');
                        %Mostrar la imagen
                        figure
                        imshow(RGB10)
                        title('Chavetas Ejes Intermedios');
                        print('Chavetas Ejes Intermedios','-dpdf','-fillpage');
                    elseif ejes_intermedios==3
                        %Mostrar Resultados Chavetas Ejes Intermedios
                        %Leer imagen
                        I10=imread('chavetas2.jpg');
                        %Crear texto
                        text_str10=cell(8,1);
                        if mat_chaveta~=0
                            text_str10{1}=['Material: ' mat_chaveta];
                        else
                            text_str10{1}='Material introducido por el usuario';
                        end
                        text_str10{2}='CHAVETAS DIN 6885';
                        text_str10{3}=['Chaveta DIN 6885-' num2str(b_1_final(1),'%d') '-' num2str(w_1(1),'%d') '-' num2str(L_1_final(1),'%d (G Etapa 1)')];
                        text_str10{4}=['Chaveta DIN 6885-' num2str(b_2_final(1),'%d') '-' num2str(w_2(1),'%d') '-' num2str(L_2_final(1),'%d (J Etapa 2)')];
                        text_str10{5}=['Chaveta DIN 6885-' num2str(b_1_final(2),'%d') '-' num2str(w_1(2),'%d') '-' num2str(L_1_final(2),'%d (G Etapa 2)')];
                        text_str10{6}=['Chaveta DIN 6885-' num2str(b_2_final(2),'%d') '-' num2str(w_2(2),'%d') '-' num2str(L_2_final(2),'%d (J Etapa 3)')];
                        text_str10{7}=['Chaveta DIN 6885-' num2str(b_1_final(3),'%d') '-' num2str(w_1(3),'%d') '-' num2str(L_1_final(3),'%d (G Etapa 3)')];
                        text_str10{8}=['Chaveta DIN 6885-' num2str(b_2_final(3),'%d') '-' num2str(w_2(3),'%d') '-' num2str(L_2_final(3),'%d (J Etapa 4)')];
                        %Definir la posición y el color de los cuadros de texto
                        position10=[200 175;200 30;200 50;200 70;200 90;200 110;200 130;200 150];
                        box_color10={'white','white','white','white','white','white','white','white'};
                        %Insertar el texto
                        RGB10=insertText(I10,position10,text_str10,'FontSize',12,'Boxcolor',box_color10,'BoxOpacity',0,'TextColor','black');
                        %Mostrar la imagen
                        figure
                        imshow(RGB10)
                        title('Chavetas Ejes Intermedios');
                        print('Chavetas Ejes Intermedios','-dpdf','-fillpage');
                    elseif ejes_intermedios==4
                        %Mostrar Resultados Chavetas Ejes Intermedios
                        %Leer imagen
                        I10=imread('chavetas2.jpg');
                        %Crear texto
                        text_str10=cell(10,1);
                        if mat_chaveta~=0
                            text_str10{1}=['Material: ' mat_chaveta];
                        else
                            text_str10{1}='Material introducido por el usuario';
                        end
                        text_str10{2}='CHAVETAS DIN 6885';
                        text_str10{3}=['Chaveta DIN 6885-' num2str(b_1_final(1),'%d') '-' num2str(w_1(1),'%d') '-' num2str(L_1_final(1),'%d (G Etapa 1)')];
                        text_str10{4}=['Chaveta DIN 6885-' num2str(b_2_final(1),'%d') '-' num2str(w_2(1),'%d') '-' num2str(L_2_final(1),'%d (J Etapa 2)')];
                        text_str10{5}=['Chaveta DIN 6885-' num2str(b_1_final(2),'%d') '-' num2str(w_1(2),'%d') '-' num2str(L_1_final(2),'%d (G Etapa 2)')];
                        text_str10{6}=['Chaveta DIN 6885-' num2str(b_2_final(2),'%d') '-' num2str(w_2(2),'%d') '-' num2str(L_2_final(2),'%d (J Etapa 3)')];
                        text_str10{7}=['Chaveta DIN 6885-' num2str(b_1_final(3),'%d') '-' num2str(w_1(3),'%d') '-' num2str(L_1_final(3),'%d (G Etapa 3)')];
                        text_str10{8}=['Chaveta DIN 6885-' num2str(b_2_final(3),'%d') '-' num2str(w_2(3),'%d') '-' num2str(L_2_final(3),'%d (J Etapa 4)')];
                        text_str10{9}=['Chaveta DIN 6885-' num2str(b_1_final(4),'%d') '-' num2str(w_1(4),'%d') '-' num2str(L_1_final(4),'%d (G Etapa 4)')];
                        text_str10{10}=['Chaveta DIN 6885-' num2str(b_2_final(4),'%d') '-' num2str(w_2(4),'%d') '-' num2str(L_2_final(4),'%d (J Etapa 5)')];
                        %Definir la posición y el color de los cuadros de texto
                        position10=[200 215;200 30;200 50;200 70;200 90;200 110;200 130;200 150;200 170;200 190];
                        box_color10={'white','white','white','white','white','white','white','white','white','white'};
                        %Insertar el texto
                        RGB10=insertText(I10,position10,text_str10,'FontSize',12,'Boxcolor',box_color10,'BoxOpacity',0,'TextColor','black');
                        %Mostrar la imagen
                        figure
                        imshow(RGB10)
                        title('Chavetas Ejes Intermedios');
                        print('Chavetas Ejes Intermedios','-dpdf','-fillpage');
                    end
                else
                    f48=msgbox('El material elegido para las chavetas de los ejes intermedios NO es válido. Pruebe a introducir otro material.', 'Error','error');
                end
            end
        end
        condicion_2=true;
    end
    datos=0;
end