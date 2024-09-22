package analizador;

//importaciones
import java_cup.runtime.Symbol;
import java.util.LinkedList;
import excepciones.Errores;

%%

//codigo de usuario
%{
    public LinkedList<Errores> listaErrores = new LinkedList<>();
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
//%debug
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

// BLOQUE USUARIO
XSON= "xson"
VERSION = "version"

//RESOS= "realizar_solicitudes"
//FINSOS= "fin_solicitudes_realizada"
RESO= "realizar_solicitud"
FINSO= "fin_solicitud_realizada"
USENU= "USUARIO_NUEVO"
DATUSE= "DATOS_USUARIO"

USUARIO= "USUARIO"
PASSWORD= "PASSWORD"
NOMBRE= "NOMBRE"
INSTITUCION= "INSTITUCION"

// BLOQUES BASICOS
BLANCOS=[\ \r\t\f\n]+
DECIMAL=[0-9]+"."[0-9]+
ID=("-" | "_" | "\$") [a-zA-Z0-9]+
VALOR=[a-zA-Z0-9_]+

%%

// BLOQUE SIGNOS
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

<YYINITIAL> {XSON} {return new Symbol(sym.XSON, yyline, yycolumn,yytext());}
<YYINITIAL> {VERSION} {return new Symbol(sym.VERSION, yyline, yycolumn,yytext());}

<YYINITIAL> {RESO} {return new Symbol(sym.RESO, yyline, yycolumn,yytext());}
<YYINITIAL> {FINSO} {return new Symbol(sym.FINSO, yyline, yycolumn,yytext());}

// USUARIOS
<YYINITIAL> {USENU} {return new Symbol(sym.USENU, yyline, yycolumn,yytext());}
<YYINITIAL> {DATUSE} {return new Symbol(sym.DATUSE, yyline, yycolumn,yytext());}

<YYINITIAL> {USUARIO} {return new Symbol(sym.USUARIO, yyline, yycolumn,yytext());}
<YYINITIAL> {PASSWORD} {return new Symbol(sym.PASSWORD, yyline, yycolumn,yytext());}
<YYINITIAL> {NOMBRE} {return new Symbol(sym.NOMBRE, yyline, yycolumn,yytext());}
<YYINITIAL> {INSTITUCION} {return new Symbol(sym.INSTITUCION, yyline, yycolumn,yytext());}

// BASICOS
<YYINITIAL> {ID} {return new Symbol(sym.ID, yyline, yycolumn,yytext());}
<YYINITIAL> {VALOR} {return new Symbol(sym.VALOR, yyline, yycolumn,yytext());}
<YYINITIAL> {DECIMAL} {return new Symbol(sym.DECIMAL, yyline, yycolumn,yytext());}

<YYINITIAL> {BLANCOS} {}

<YYINITIAL> . {
                listaErrores.add(new Errores("LEXICO","El caracter "+
                yytext() + " No pertenece al lenguaje", yyline, yycolumn));
}