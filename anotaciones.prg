SET DATE ITALIAN
SET DELETED ON

_screen.Caption="Anotaciones"
_screen.WindowState= 2
*_screen.Visible= .F.



CLOSE DATABASES 
USE "\\belen\documentos c\anotaciones" shared

mostrar="a"
wmenu=" "
DO WHILE mostrar="a"

    horaactualizacion=TIME()
    
    DO FORM anotaciones

    DO case
         CASE wmenu="a"
		           fechaini=CTOD("  -  -    ")
                   fechafin=CTOD("  -  -    ")


					CLEAR
					@ 1,1 say "fecha inicial:  "  get fechaini
					@ 2,1 say "fecha final:    "  get fechafin

					READ
					SELECT * FROM "\\belen\documentos c\anotaciones" WHERE (fechahora>=fechaini).and.(fechahora<=fechafin)
                    CLOSE DATABASES
                    
		            wmenu=" "
		 CASE wmenu="b"
		            palabra="                    "
		            CLEAR
		            @ 1,1 say "palabra:    " get palabra
		            READ
		            *USE anotaciones INDEX inpalabra
		            
		            palabra=TRIM(palabra)
		            wpalabra="%"+palabra+"%"
		            SELECT * FROM "\\belen\documentos c\anotaciones" where (anotaciones.anotacion like LOWER(wpalabra)).or.(anotaciones.anotacion like UPPER(wpalabra))
		            
		            
			        CLOSE DATABASES
			        wmenu=" "

        endcase

enddo
CLOSE DATABASES
clear

*QUIT
_screen.Caption="Microsoft Visual FoxPro"