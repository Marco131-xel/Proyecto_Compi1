package analizador;

//importaciones
import java_cup.runtime.Symbol;
import java.util.LinkedList;
import excepciones.Errores;

%%

//codigo de usuario
%{
    public LinkedList<Errores> listaErrores = new LinkedList<>();

    public LinkedList<Errores> getErrores(){
        return listaErrores;
    }
%}

%init{
    yyline = 1;
    yycolumn = 1;
    listaErrores = new LinkedList<>();
%init}

//caracteristicas de jflex
%cup
%class scanner
%public
%line
%char
%column
%full
%ignorecase

// BLOQUE SIGNOS
MENOR= "<"
MAYOR= ">"
INTER= "?"
EXCLA= "!"
IGUAL= "="
DOSPTS= ":"
LLAVESA= "{"
LLAVESC= "}"
CORCHEA= "["
CORCHEC= "]"
COMA= ","
COMID= "\""
//COMIS= "\'"

// BLOQUE CABECERA
XSON= "xson"
VERSION = "version"
RESOS= "realizar_solicitudes"
FINSOS= "fin_solicitudes_realizada"
RESO= "realizar_solicitud"
FINSO= "fin_solicitud_realizada"

// BLOQUE USUARIOS
USENU= "USUARIO_NUEVO"
DATUSE= "DATOS_USUARIO"
MODUSE= "MODIFICAR_USUARIO"
USEAN= "USUARIO_ANTIGUO"
NUVPASS= "NUEVO_PASSWORD"
ELIUSE= "ELIMINAR_USUARIO"
LOGIN= "LOGIN_USUARIO"

// BLOQUE TRIVIAS
NUVTRI= "NUEVA_TRIVIA"
PARATRIV= "PARAMETROS_TRIVIA"
ELITRIV= "ELIMINAR_TRIVIA"
MODITRIV= "MODIFICAR_TRIVIA"

// BLOQUE COMPONENTES
AGRETRIV= "AGREGAR_COMPONENTE"
PARACOMP= "PARAMETROS_COMPONENTE"
ELICOMP= "ELIMINAR_COMPONENTE"
MODICOMP= "MODIFICAR_COMPONENTE"

// BLOQUE DATOS
USUARIO= "USUARIO"
PASSWORD= "PASSWORD"
NOMBRE= "NOMBRE"
INSTITUCION= "INSTITUCION"

IDTRIV= "ID_TRIVIA"
TIEMPO= "TIEMPO_PREGUNTA"
TEMA= "TEMA"

IDE= "ID"
TRIVIA= "TRIVIA"
CLASE= "CLASE"
TEXTO= "TEXTO_VISIBLE"
RESPUESTA= "RESPUESTA"
OPCIONES= "OPCIONES"
INDICE= "INDICE"

// BLOQUES BASICOS
BLANCOS=[\ \r\t\f\n]+
DECIMAL=[0-9]+"."[0-9]+
ID=("-" | "_" | "\$") [a-zA-Z0-9]+
VALOR=[a-zA-Z0-9_]+

%%

// SIGNOS
<YYINITIAL> {MENOR} {return new Symbol(sym.MENOR, yyline, yycolumn,yytext());}
<YYINITIAL> {MAYOR} {return new Symbol(sym.MAYOR, yyline, yycolumn,yytext());}
<YYINITIAL> {INTER} {return new Symbol(sym.INTER, yyline, yycolumn,yytext());}
<YYINITIAL> {EXCLA} {return new Symbol(sym.EXCLA, yyline, yycolumn,yytext());}

<YYINITIAL> {IGUAL} {return new Symbol(sym.IGUAL, yyline, yycolumn,yytext());}
<YYINITIAL> {DOSPTS} {return new Symbol(sym.DOSPTS, yyline, yycolumn,yytext());}
<YYINITIAL> {LLAVESA} {return new Symbol(sym.LLAVESA, yyline, yycolumn,yytext());}
<YYINITIAL> {LLAVESC} {return new Symbol(sym.LLAVESC, yyline, yycolumn,yytext());}
<YYINITIAL> {CORCHEA} {return new Symbol(sym.CORCHEA, yyline, yycolumn,yytext());}
<YYINITIAL> {CORCHEC} {return new Symbol(sym.CORCHEC, yyline, yycolumn,yytext());}
<YYINITIAL> {COMA} {return new Symbol(sym.COMA, yyline, yycolumn,yytext());}
<YYINITIAL> {COMID} {return new Symbol(sym.COMID, yyline, yycolumn,yytext());}

// CABECERA
<YYINITIAL> {XSON} {return new Symbol(sym.XSON, yyline, yycolumn,yytext());}
<YYINITIAL> {VERSION} {return new Symbol(sym.VERSION, yyline, yycolumn,yytext());}
<YYINITIAL> {RESOS} {return new Symbol(sym.RESOS, yyline, yycolumn,yytext());}
<YYINITIAL> {FINSOS} {return new Symbol(sym.FINSOS, yyline, yycolumn,yytext());}
<YYINITIAL> {RESO} {return new Symbol(sym.RESO, yyline, yycolumn,yytext());}
<YYINITIAL> {FINSO} {return new Symbol(sym.FINSO, yyline, yycolumn,yytext());}

// USUARIOS
<YYINITIAL> {USENU} {return new Symbol(sym.USENU, yyline, yycolumn,yytext());}
<YYINITIAL> {DATUSE} {return new Symbol(sym.DATUSE, yyline, yycolumn,yytext());}
<YYINITIAL> {MODUSE} {return new Symbol(sym.MODUSE, yyline, yycolumn,yytext());}
<YYINITIAL> {USEAN} {return new Symbol(sym.USEAN, yyline, yycolumn,yytext());}
<YYINITIAL> {NUVPASS} {return new Symbol(sym.NUVPASS, yyline, yycolumn,yytext());}
<YYINITIAL> {ELIUSE} {return new Symbol(sym.ELIUSE, yyline, yycolumn,yytext());}
<YYINITIAL> {LOGIN} {return new Symbol(sym.LOGIN, yyline, yycolumn,yytext());}

// TRIVIAS
<YYINITIAL> {NUVTRI} {return new Symbol(sym.NUVTRI, yyline, yycolumn,yytext());}
<YYINITIAL> {PARATRIV} {return new Symbol(sym.PARATRIV, yyline, yycolumn,yytext());}
<YYINITIAL> {ELITRIV} {return new Symbol(sym.ELITRIV, yyline, yycolumn,yytext());}
<YYINITIAL> {MODITRIV} {return new Symbol(sym.MODITRIV, yyline, yycolumn,yytext());}

// COMPONENTES
<YYINITIAL> {AGRETRIV} {return new Symbol(sym.AGRETRIV, yyline, yycolumn,yytext());}
<YYINITIAL> {PARACOMP} {return new Symbol(sym.PARACOMP, yyline, yycolumn,yytext());}
<YYINITIAL> {ELICOMP} {return new Symbol(sym.ELICOMP, yyline, yycolumn,yytext());}
<YYINITIAL> {MODICOMP} {return new Symbol(sym.MODICOMP, yyline, yycolumn,yytext());}

// DATOS
<YYINITIAL> {USUARIO} {return new Symbol(sym.USUARIO, yyline, yycolumn,yytext());}
<YYINITIAL> {PASSWORD} {return new Symbol(sym.PASSWORD, yyline, yycolumn,yytext());}
<YYINITIAL> {NOMBRE} {return new Symbol(sym.NOMBRE, yyline, yycolumn,yytext());}
<YYINITIAL> {INSTITUCION} {return new Symbol(sym.INSTITUCION, yyline, yycolumn,yytext());}

<YYINITIAL> {IDTRIV} {return new Symbol(sym.IDTRIV, yyline, yycolumn,yytext());}
<YYINITIAL> {TIEMPO} {return new Symbol(sym.TIEMPO, yyline, yycolumn,yytext());}
<YYINITIAL> {TEMA} {return new Symbol(sym.TEMA, yyline, yycolumn,yytext());}

<YYINITIAL> {IDE} {return new Symbol(sym.IDE, yyline, yycolumn,yytext());}
<YYINITIAL> {TRIVIA} {return new Symbol(sym.TRIVIA, yyline, yycolumn,yytext());}
<YYINITIAL> {CLASE} {return new Symbol(sym.CLASE, yyline, yycolumn,yytext());}
<YYINITIAL> {TEXTO} {return new Symbol(sym.TEXTO, yyline, yycolumn,yytext());}
<YYINITIAL> {RESPUESTA} {return new Symbol(sym.RESPUESTA, yyline, yycolumn,yytext());}
<YYINITIAL> {OPCIONES} {return new Symbol(sym.OPCIONES, yyline, yycolumn,yytext());}
<YYINITIAL> {INDICE} {return new Symbol(sym.INDICE, yyline, yycolumn,yytext());}

// BASICOS
<YYINITIAL> {ID} {return new Symbol(sym.ID, yyline, yycolumn,yytext());}
<YYINITIAL> {VALOR} {return new Symbol(sym.VALOR, yyline, yycolumn,yytext());}
<YYINITIAL> {DECIMAL} {return new Symbol(sym.DECIMAL, yyline, yycolumn,yytext());}

<YYINITIAL> {BLANCOS} {}

<YYINITIAL> . {
                listaErrores.add(new Errores("LEXICO","El caracter "+
                yytext() + " No pertenece al lenguaje", yyline, yycolumn));
}